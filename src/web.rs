use crate::avahi;
use crate::narinfo::NARInfo;
use crate::state::State as AppState;
use actix_web::web::{Data as State, Path};
use actix_web::{middleware, App, Error, HttpResponse, HttpServer, Responder};
use futures::future::{ok, Future};
use multicast_dns::host::HostManager as AvahiHostManager;
use std::sync::Arc;

fn nar(data: State<AppState>, info: Path<(String,)>) -> impl Responder {
    let hash = format!("sha256:{}", info.0);

    let mut instance = libnixstore_sys::Instance::new().unwrap();
    let path = match instance.query_path_from_file_hash(&hash) {
        Ok(Some(p)) => p,
        Ok(None) | Err(_) => {
            println!("No path for nar hash {} found or failed to query", &hash);
            return HttpResponse::NotFound().finish();
        }
    };

    let path_info = match instance.query_path_info(path) {
        Ok(Some(pi)) => pi,
        Ok(None) | Err(_) => return HttpResponse::NotFound().finish(),
    };

    // let narinfo = match data.retrieve_narinfo(&path_info.hash_part) {
    //     Ok(n) => n,
    //     Err(_) => {
    //         println!("Failed to retrieve narinfo for nar file of path {}", &path_info.path);
    //         return HttpResponse::NotFound().finish();
    //     },
    // };

    println!("path info: {:?} for {}", path_info, hash);
    use std::process::Command;
    let out = Command::new("nix-store")
        .arg("--dump")
        .arg(path_info.path)
        .output()
        .expect("failed to execute dump");

    return HttpResponse::Ok()
        .content_type("application/x-nix-nar")
        .body(out.stdout);
}

fn narinfo(data: State<AppState>, info: Path<(String,)>) -> Box<dyn Future<Item=HttpResponse, Error=Error>> {
    //let bdb = data.open_binary_cache_db();
    //let sdb = data.open_store_db();
    let mut instance = libnixstore_sys::Instance::new().unwrap();

    println!("narinfo for path: {}", &info.0);

    match instance.query_path_from_hash_part(&info.0) {
        Err(e) => {
            println!("Failed to query for path from hash_part for {}", &info.0);
            Box::new(ok(HttpResponse::NotFound().finish()))
        }
        Ok(None) => {
            println!("No path for hash part {} found.", &info.0);
            Box::new(ok(HttpResponse::NotFound().finish()))
        }
        Ok(Some(path)) => {
            let path_info = match instance.query_path_info(&path) {
                Ok(Some(pi)) => pi,
                Ok(None) | Err(_) => {
                    println!(
                        "Failed to query path info or no path info found for path: {}",
                        path
                    );
                    return Box::new(ok(HttpResponse::NotFound().finish()));
                }
            };
            let sigs = path_info.signatures.clone();
            // very ugly way to deal with this.. If the local Nar cache would always be
            // there we could look it up there :/
            if !sigs.is_empty() && sigs.starts_with("cache.nixos.org-1:") {
                let fut = data.retrieve_narinfo(&info.0)
                    .then(move |r: Result<NARInfo, _>| {
                        match r {
                            Ok(narinfo) => {
                            match instance.query_path_from_file_hash(&narinfo.file_hash) {
                                Ok(None) | Err(_) => {
                                    println!("Path {} not cached locally", &path_info.path);
                                    return HttpResponse::NotFound().finish()
                                }
                                Ok(Some(_)) => {}
                            }

                            let resp = narinfo.format_with_compression("none");
                            HttpResponse::Ok()
                                .content_type("text/x-nix-narinfo")
                                .body(resp)
                        },
                        Err(e) => {
                            println!("Failed to retrieve NARInfo for path {}: {:?}", path, e);
                            HttpResponse::NotFound().finish()
                        }
                    }
                });
                Box::new(fut)
            } else {
                println!("Path {} is not signed by cache.nixos.org", path);
                Box::new(ok(HttpResponse::NotFound().finish()))
            }
        }
    }
}

fn nix_cache_info(_state: State<AppState>) -> impl Responder {
    "StoreDir: /nix/store\nWantMassQuery: 1\nPriority: 30\n"
}

fn avahi_proxy(
    state: State<AppState>,
    info: Path<(String,)>,
) -> impl Future<Item = HttpResponse, Error = Error> {
    let path = &info.0;
    println!("Got request for {}", path);
    let hosts = state.get_avahi().get_hosts();

    let client = reqwest::r#async::ClientBuilder::new()
        .connect_timeout(std::time::Duration::from_millis(300))
        .build()
        .expect("Failed to build client");

    avahi::try_retrieve(client, (*path).to_string(), hosts)
        .and_then(|r| Ok(HttpResponse::Ok().body(r)))
        .or_else(|r| {
            println!("or else: {:?}", r);
            HttpResponse::NotFound().finish()})
}

pub fn serve(port: i16) -> std::io::Result<()> {
    let host_manager = AvahiHostManager::new();
    if let Err(e) =
        host_manager.announce_service("My local nix cache", "_nixcache._tcp", port as u16)
    {
        println!("Failed to announce service via avahi. Consider setting `services.avahi.publish.userServices = true;` in your NixOS configuration. Error: {}", e);
    }

    let avahi = Arc::new(avahi::AvahiDiscovery::new());
    {
        let a = Arc::clone(&avahi);
        std::thread::spawn(move || a.run());
    }

    HttpServer::new(move || {
        use actix_web::web::*;
        let d = Data::new(AppState::new(Arc::clone(&avahi)));
        App::new()
            .register_data(d)
            .wrap(middleware::Logger::default())
            .service(resource("/nar/{narHash}.nar").route(get().to(nar)))
            .service(resource("/{narHash}.narinfo").route(get().to(narinfo)))
            .service(resource("/nix-cache-info").route(get().to(nix_cache_info)))
            .service(resource("/avahi/nix-cache-info").route(get().to(nix_cache_info)))
            .service(resource("/avahi/{path}").route(get().to_async(avahi_proxy)))
    })
    .bind(format!("[::]:{}", port))?
    .run()?;

    Ok(())
}
