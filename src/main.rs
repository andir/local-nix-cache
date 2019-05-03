#[macro_use]
extern crate rusqlite;
extern crate libnixstore_sys;

mod store;
mod binary_cache;

pub use store::*;
pub use binary_cache::*;

use crate::binary_cache::BinaryCacheDB;
use std::sync::{RwLock, Arc};
use std::collections::HashMap;

/*
  StorePath: /nix/store/8aijxqjfzwysvx4d4ydank0kax2z4mz2-systemd-239.20190219
  URL: nar/00ba0gdz2jgzj7azm5ggycmkn9f02b871l4v01zggqhcjvdgdin3.nar.xz
  Compression: xz
  FileHash: sha256:00ba0gdz2jgzj7azm5ggycmkn9f02b871l4v01zggqhcjvdgdin3
  FileSize: 4030068
  NarHash: sha256:1hgm1k2hkn5mcq6pndycwxxhw0my6sk7brbsxp6axvwj2bm1rwpp
  NarSize: 21544632
  References: 39v133j0yzybc8bqs7zqdp98y6kp6gsv-libapparmor-2.12.0 4fayzafn5gmsv08zf71azwpyrdihlh34-kmod-25 4j8iyd154cyid79wjq409a538py853vd-util-linux-2.32.1-bin 68z2cvbzws1pn0z8dhgfkmws75r2z7gm-coreutils-8.29 7gx4kiv5m0i7d7qkixq2cwzbr10lvxwc-glibc-2.27 8aijxqjfzwysvx4d4ydank0kax2z4mz2-systemd-239.20190219 8j13mdddcpk924npkifr3hbsfq56xw4r-lz4-1.8.3 9s9g5gv27k3j8y6mjvlv60q59n3mfqgc-util-linux-2.32.1 ah8z1r2iim5dz9gzg530xihjh6417shq-xz-5.2.4 b9p787yqaqi313l9rr0491igjwyzqfmw-bash-4.4-p23 dmb9jil2qwhyd1bscrcnmg4kahriqhf2-libgpg-error-1.28 fyyxw96k5g2b7zh8lqvl4y4786hv4c96-libidn2-2.0.5 ij3j1wirsgbqc7yw5j1d23m89kjfczkm-systemd-239.20190219-lib j6zw24ky002abm3k1sdpmzzmbg3lsxqr-iptables-1.6.2 jx6rh0192a90db75niyhbm9cvpl6rrwl-audit-2.8.4 m22l6qg6yj9abds5bipk04290igb1j3i-libgcrypt-1.8.3 m32jma185w7ib8x7y8gz250i56sbmi32-pcre2-10.31 mdjsx29y76nbbjchsldbr8a9ip9mwjrn-libcap-2.25-lib nz0rzym6lydlhgkdckxpzl9phzwvzzzb-kbd-2.0.4 rb2z41k2rnq7abzklsbi457wd3hg242y-acl-2.2.52 x882sqlwz9z519jrarhr6vk4i7rf5q48-kexec-tools-2.0.17 y0d2h6csi3ai7b2a3nkx7m8nq10i0hk1-libseccomp-2.3.3-lib zhi6gr8ndcys2d1lpsav5w50wyamfjz4-linux-pam-1.3.0 zsv2w891mi8d5xi8g92vprc0qm0w0p4w-libmicrohttpd-0.9.59
  Deriver: xv6m5s410dqh28nn9avd3fh08mw26khc-systemd-239.20190219.drv
  Sig: cache.nixos.org-1:Ub8INk3OBTOuYTbqcGuR5JOBCm9FzCJyzLcpxFxnbL+LjdV7d+G/rwiAC3iETXG+/DMX0MiQK/4+frY5R+z8CA==
*/

#[derive(Default, Clone, Debug)]
pub struct NARInfo {
    store_path: String,
    url: String,
    compression: String,
    file_hash: String,
    file_size: isize,
    nar_hash: String,
    nar_size: isize,
    references: String,
    deriver: String,
    sig: String,
}

impl NARInfo {
    fn format_with_compression(&self, compression: &str) -> String {
       use std::fmt::Write;
       let mut info = "".to_owned();
       write!(info, "StorePath: {}\n", self.store_path).unwrap();
       write!(info, "URL: {}\n", self.url).unwrap();
       write!(info, "Compression: {}\n", compression);
       write!(info, "NarHash: {}\n", self.nar_hash).unwrap();
       write!(info, "NarSize: {}\n", self.nar_size).unwrap();
       write!(info, "FileHash: {}\n", self.file_hash).unwrap();
       write!(info, "FileSize: {}\n", self.file_size).unwrap();
       write!(info, "References: {}\n", self.references).unwrap();
       write!(info, "Deriver: {}\n", self.deriver).unwrap();
       write!(info, "Sig: {}\n", self.sig).unwrap();
       info
    }
}

impl std::string::ToString for NARInfo {
   fn to_string(&self) -> String {
       self.format_with_compression(&self.compression)
   }
}

impl NARInfo {
    pub fn parse<S: AsRef<str>>(s: S) -> std::result::Result<Self, String> {
        // Using default here is basically a hack.. It should really be a struct of options that
        // all must be filled out and the a "flat" struct with the fields should be returned
        // from the function
        let mut ni = Self::default();

        let parse_size = |v: String| {
            v.parse().map_err(|_| format!("failed to parse value {} as isize", v))
        };

        for line in s.as_ref().lines() {
            let parts = line.splitn(2, ": ").collect::<Vec<_>>();
            if parts.len() != 2 {
                return Err(format!("Not exactly two parts from line: {}", line));
            }
            match (parts[0], parts[1].to_owned()) {
                ("StorePath", val) => ni.store_path = val,
                ("URL", val) => ni.url = val,
                ("Compression", val) => ni.compression = val,
                ("FileHash", val) => ni.file_hash = val,
                ("FileSize", val) => ni.file_size = parse_size(val)?,
                ("NarHash", val) => ni.nar_hash = val,
                ("NarSize", val) => ni.nar_size = parse_size(val)?,
                ("References", val) => ni.references = val,
                ("Deriver", val) => ni.deriver = val,
                ("Sig", val) => ni.sig = val,
                (other, val) => {
                    return Err(format!("unknown field {} with value {}", other, val));
                }
            }
        }

        // FIXME: we are removing the compression behind the URL so we can just serve the files
        // without compression for now
        ni.url = ni.url
            .replace(".nar.xz", ".nar")
            .replace(".nar.gz", ".nar")
            .replace(".nar.bz2", ".nar");

        Ok(ni)
    }
}

#[derive(Clone)]
struct Data {
    dbfile: String,
    narinfo_cache: Arc<RwLock<HashMap<String, NARInfo>>>,
}

impl Data {

    fn with_dbfile(dbfile: &str) -> Self {
        Self {
            dbfile: dbfile.to_owned(),
            narinfo_cache: Arc::new(RwLock::new(HashMap::new())),
            //nar2narinfo: Arc::new(RwLock::new(HashMap::new()))
        }
    }

    fn open_store_db(&self) -> StoreDB {
        StoreDB::new().unwrap()
    }

    fn retrieve_narinfo<S: AsRef<str>>(&self, path: S) -> std::result::Result<NARInfo, String> {
        let cache = Arc::clone(&self.narinfo_cache);

        let map = cache.read().expect("RwLock poisoned");

        if let Some(narinfo) = map.get(path.as_ref()) {
            return Ok(narinfo.clone());
        }
        drop(map);

        let url = format!("https://cache.nixos.org/{}.narinfo", path.as_ref());

        // Retrieve data from the internetz, it is a bit ugly since we are not using the event loop
        // that is already running from actix
        let text = reqwest::get(&url)
            .map_err(|e| format!("Failed to request narinfo from binary cache: {}", e))?
            .text().map_err(|e| format!("Failed to retrieve response from binary cache: {}", e))?;

        let narinfo = NARInfo::parse(text)?;

        {
            let mut map = cache.write().expect("RwLock poisoned");
            map.entry(path.as_ref().to_owned()).or_insert(narinfo.clone());
        }

        Ok(narinfo)
    }
}

fn serve(dbfile: &str, port: i16) -> std::io::Result<()> {
    use actix_web::{App, web, Responder, HttpServer, HttpResponse, middleware};

    fn nar(data: web::Data<Data>, info: web::Path<(String,)>) -> impl Responder {
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
        use std::process::{Command};
        let out = Command::new("nix-store")
            .arg("--dump")
            .arg(path_info.path)
            .output()
            .expect("failed to execute dump");

        return HttpResponse::Ok().content_type("application/x-nix-nar").body(out.stdout);
       }

    fn narinfo(data: web::Data<Data>, info: web::Path<(String,)>) -> impl Responder {
        //let bdb = data.open_binary_cache_db();
        //let sdb = data.open_store_db();
        let mut instance = libnixstore_sys::Instance::new().unwrap();


        println!("narinfo for path: {}", &info.0);

        match instance.query_path_from_hash_part(&info.0) {
            Err(e) => {
                println!("Failed to query for path from hash_part for {}", &info.0);
                return HttpResponse::NotFound().finish();
            },
            Ok(None) => {
                println!("No path for hash part {} found.", &info.0);
                return HttpResponse::NotFound().finish();
            },
            Ok(Some(path)) => {
                let path_info = match instance.query_path_info(&path) {
                    Ok(Some(pi)) => pi,
                    Ok(None) | Err(_) => {
                        println!("Failed to query path info or no path info found for path: {}", path);
                        return HttpResponse::NotFound().finish();
                    },
                };
                let sigs = path_info.signatures;
                // very ugly way to deal with this.. If the local Nar cache would always be
                // there we could look it up there :/
                if !sigs.is_empty() && sigs.starts_with("cache.nixos.org-1:") {


                    let narinfo = data.retrieve_narinfo(&info.0);
                    match narinfo {
                        Ok(narinfo) => {
                            match instance.query_path_from_file_hash(&narinfo.file_hash) {
                                Ok(None) | Err(_) => {
                                    println!("Path {} not cached locally", &path_info.path);
                                    return HttpResponse::NotFound().finish();
                                },
                                Ok(Some(_)) => {},
                            }

                            let resp = narinfo.format_with_compression("none");
                            return HttpResponse::Ok().content_type("text/x-nix-narinfo").body(resp);
                        },
                        Err(e) => {
                            println!("Failed to retrieve NARInfo for path {}: {}", path, e);
                            return HttpResponse::NotFound().finish();
                        }
                    }
                } else {
                    println!("Path {} is not signed by cache.nixos.org", path);
                    return HttpResponse::NotFound().finish();
//                    return format!("Found but not giving it away since it lacks signatures! {:?}", path);
                }
            },
        }
    }

    fn nix_cache_info() -> impl Responder {
        "StoreDir: /nix/store\nWantMassQuery: 1\nPriority: 30\n"
    }

    let d = Data::with_dbfile(dbfile);
            HttpServer::new(move || App::new()
            .data(d.clone())
            .wrap(middleware::Logger::default())
            .route("/nar/{narHash}.nar", web::get().to(nar))
            .route("/{narHash}.narinfo", web::get().to(narinfo))
            .route("/nix-cache-info", web::get().to(nix_cache_info))
            ).bind(format!("[::]:{}", port))?
        .run()
}


fn main() {
    use clap::{App, Arg};
    env_logger::init();

    let matches = App::new("Nix-Local-Cache-Serve-Narinfo")
                    .version("1.0")
                    .author("Andreas Rammhold <andreas@rammhold.de>")
                    .about("Serves narinfo files present in the local nix store. Only serves those files that were downloaded from the official hydra. No private builds should be leaked.")
                    .arg(Arg::with_name("dbfile")
                         .long("dbfile")
                         .help("The sqlite database file that should be used to determine if the a NAR file exists on the local machine. FIXME: this isn't correct anymore.")
                         .default_value("/nix/var/nix/db/db.sqlite"))
                    .arg(Arg::with_name("port")
                         .long("port")
                         .help("The port to listen on for incoming HTTP connections.")
                         .default_value("8380"))
                    .get_matches();

    let dbfile = matches.value_of("dbfile").expect("Missing the database file name");
    let port = matches.value_of("port")
        .expect("Missing the port to listen on.")
        .parse::<i16>()
        .expect("Invalid port (not numeric)");
    println!("Got Database file: {}", dbfile);
    println!("Got port: {}", port);


    // let hash = "8aijxqjfzwysvx4d4ydank0kax2z4mz2";

    let connection = rusqlite::Connection::open(dbfile).expect("Failed to open database. Does the use have write access (for the locks)?");
    serve(dbfile, port).unwrap();
}
