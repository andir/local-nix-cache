use crate::util;
use futures::future::{err, Future};
use multicast_dns::discovery::*;
use reqwest::r#async::{Client, Response};
use std::collections::HashSet;
use std::hash::{Hash, Hasher};
use std::sync::{Arc, RwLock};
use std::time::{SystemTime, UNIX_EPOCH};

#[derive(Debug)]
pub enum Error {
    LockError,
}

struct AvahiHost {
    addr: String,
    port: u16,
    last_seen: u128,
}

impl AvahiHost {
    fn new(addr: String, port: u16) -> AvahiHost {
        let now = SystemTime::now().duration_since(UNIX_EPOCH).unwrap();
        AvahiHost {
            addr,
            port,
            last_seen: now.as_millis(),
        }
    }
}

impl Hash for AvahiHost {
    fn hash<H: Hasher>(&self, state: &mut H) {
        self.addr.hash(state);
        self.port.hash(state);
    }
}

impl std::cmp::PartialEq for AvahiHost {
    fn eq(&self, other: &Self) -> bool {
        self.addr == other.addr && self.port == other.port
    }
}
impl std::cmp::Eq for AvahiHost {}

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
        let seen_hosts: RwLock<HashSet<AvahiHost>> = RwLock::new(HashSet::new());

        let update_hosts = || {
            let seen_hosts = seen_hosts.read().expect("RwLock poisoned");
            let hosts: Vec<_> = seen_hosts
                .iter()
                .map(|v| (v.addr.clone(), v.port))
                .collect();
            println!("Hosts: {:?}", hosts);
            let mut hs = self.hosts.write().expect("RwLock poisoned");
            *hs = hosts;
        };

        loop {
            println!("Searching for avahi nixcaches");
            let on_service_resolved = |service: ServiceInfo| {
                println!("resolved: {:?}", service);
                if let Some(a) = service.address.clone() {
                    {
                        let mut seen_hosts = seen_hosts.write().expect("RwLock poisoned");
                        let host = AvahiHost::new(a, service.port);
                        seen_hosts.replace(host);
                    }

                    update_hosts();
                }
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
                println!("All discovered");
            };

            let discovery_listeners = DiscoveryListeners {
                on_service_discovered: Some(&on_service_discovered),
                on_all_discovered: Some(&on_all_discovered),
            };

            manager
                .discover_services("_nixcache._tcp", discovery_listeners)
                .unwrap();
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
