use crate::util;
use futures::future::{err, Future};
use multicast_dns::discovery::*;
use reqwest::r#async::{Client, Response};
use std::sync::{Arc, RwLock};

#[derive(Debug)]
pub enum Error {
    LockError,
}

#[derive(Debug)]
pub struct AvahiDiscovery {
    hosts: RwLock<Vec<(String, u16)>>,
}

impl AvahiDiscovery {
    pub fn new() -> Self {
        AvahiDiscovery {
            hosts: RwLock::new(Vec::new()),
        }
    }

    pub fn get_hosts(&self) -> Vec<(String, u16)> {
        let hosts = self.hosts.read().expect("RwLock poisoned");
        hosts.clone()
    }

    pub fn run(&self) {
        let manager = Arc::new(DiscoveryManager::new());
        loop {
            println!("Searching for avahi nixcaches");
            let hosts = Arc::new(RwLock::new(vec![]));

            let on_service_resolved = |service: ServiceInfo| {
                let h = Arc::clone(&hosts);
                let mut hs = h.write().expect("RwLock poisoned");
                println!("resolved: {:?}", service);
                hs.push(service);
            };

            let on_service_discovered = {
                let manager = manager.clone();
                move |service: ServiceInfo| {
                    let resolve_listeners = ResolveListeners {
                        on_service_resolved: Some(&on_service_resolved),
                    };
                    println!("discovered: {:?}", service);
                    manager.resolve_service(service, resolve_listeners);
                }
            };

            let on_all_discovered = || {
                let h = Arc::clone(&hosts);
                let hs = h.read().expect("RwLock poisoned");
                println!("All discovered");
                let mut sh = self.hosts.write().expect("RwLock poisoned");
                let v = hs
                    .iter()
                    .filter_map(|h| match (h.address.clone(), h.port) {
                        (Some(a), port) => Some((a, port)),
                        _ => None,
                    })
                    .collect::<Vec<_>>();
                println!("Discovered: {:?}", v);
                *sh = v;
            };

            let discovery_listeners = DiscoveryListeners {
                on_service_discovered: Some(&on_service_discovered),
                on_all_discovered: Some(&on_all_discovered),
            };

            manager
                .discover_services("_nixcache._tcp", discovery_listeners)
                .unwrap();

            std::thread::sleep(std::time::Duration::from_millis(10000));
        }
    }
}

#[derive(Debug)]
pub enum AvahiRetrievalError {
    Exhausted,
    ReqwestError(reqwest::Error),
    RetrievalError(util::RetrievalError),
}

pub fn try_retrieve(
    client: Client,
    path: String,
    hosts: Vec<(String, u16)>,
) -> Box<dyn Future<Item = (util::SmallHeader, Response), Error = AvahiRetrievalError>> {
    if let Some(((host, port), hosts)) = hosts.split_first() {
        let hosts = hosts.to_vec();
        let url = format!("http://{}:{}/{}", host, port, path);
        println!("trying: {}", url);

        let chain = client
            .get(&url)
            .send()
            .map_err(AvahiRetrievalError::ReqwestError)
            .and_then(|r| util::stream200_or_err(r).map_err(AvahiRetrievalError::RetrievalError))
            .map(|(sh, r)| {
                println!("sh: {:?}", sh);
                (sh, r)
            })
            .or_else(|r| {
                println!("failed to retrieve from host: {:?}", r);
                try_retrieve(client, path, hosts)
            });
        Box::new(chain)
    } else {
        Box::new(err(AvahiRetrievalError::Exhausted))
    }
}
