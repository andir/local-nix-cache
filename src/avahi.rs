use multicast_dns::discovery::*;
use std::sync::{RwLock, Arc};
use futures::future::Future;
use futures::future::err;
use reqwest::r#async::Client;

#[derive(Debug)]
pub enum Error {
    LockError,
}

#[derive(Debug)]
pub struct AvahiDiscovery {
    hosts: RwLock<Vec<(String, u16)>>
}

impl AvahiDiscovery {
    pub fn new() -> Self {
        AvahiDiscovery {
            hosts: RwLock::new(Vec::new()),
        }
    }

    pub fn get_hosts(&self) -> Vec<(String, u16)> {
        let hosts =
            self.hosts.read().expect("RwLock poisoned");
       hosts.clone()
    }

    pub fn run(&self) {
        let manager = Arc::new(DiscoveryManager::new());
        loop {
            let hosts = Arc::new(RwLock::new(vec![]));

            let on_service_resolved = |service: ServiceInfo| {
              let h = Arc::clone(&hosts);
              let mut hs = h.write().expect("RwLock poisoned");
              hs.push(service);
            };

            let on_service_discovered = {
                let manager = manager.clone();
                move |service: ServiceInfo| {
                    let resolve_listeners = ResolveListeners {
                        on_service_resolved: Some(&on_service_resolved),
                    };
                    manager.resolve_service(service, resolve_listeners);
                }
            };

            let on_all_discovered = || {
                let h = Arc::clone(&hosts);
                let hs = h.read().expect("RwLock poisoned");
                println!("All discovered");
                let mut sh = self.hosts.write().expect("RwLock poisoned");
                *sh = hs.iter()
                    .filter_map(|h| match (h.address.clone(), h.port) {
                        (Some(a), port) => Some((a, port)),
                        _ => None,
                    }).collect::<Vec<_>>();
                    };

            let discovery_listeners = DiscoveryListeners {
                on_service_discovered: Some(&on_service_discovered),
                on_all_discovered: Some(&on_all_discovered),
            };

            manager.discover_services("_nixcache._tcp", discovery_listeners).unwrap();

            std::thread::sleep(std::time::Duration::from_millis(10000));
        }
    }
}


#[derive(Debug)]
enum AvahiRetrievalError {
    Exhausted,
}

pub fn try_retrieve(client: Client, path: String, hosts: Vec<(String, u16)>) -> Box<dyn Future<Item=String, Error=AvahiRetrievalError>> {
    if let Some(((host, port), hosts)) = hosts.split_first() {
        let hosts = hosts.to_vec();
        let url = format!("http://{}/{}", host, path);
        let chain = client.get(&url).send()
            .and_then(|mut r| r.text())
            .or_else(|_| try_retrieve(client, path, hosts))
            .map_err(|e| e.into());
        Box::new(chain)
    } else {
        Box::new(err(AvahiRetrievalError::Exhausted))
    }
}
