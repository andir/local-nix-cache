use crate::avahi;
use crate::narinfo::NARInfo;
use futures::future::{err, ok, Future};
use std::collections::HashMap;
use std::sync::{Arc, RwLock};

use crate::util;

pub struct State {
    narinfo_cache: Arc<RwLock<HashMap<String, NARInfo>>>,
    avahi: Arc<avahi::AvahiDiscovery>,
}

#[derive(Debug)]
pub enum Error {
    ReqwestError(reqwest::Error),
    RetrievalError(util::RetrievalError),
    ParseError(String),
}

impl From<util::RetrievalError> for Error {
    fn from(e: util::RetrievalError) -> Error {
        Error::RetrievalError(e)
    }
}

impl From<reqwest::Error> for Error {
    fn from(e: reqwest::Error) -> Error {
        Error::ReqwestError(e)
    }
}

impl State {
    pub fn new(a: Arc<avahi::AvahiDiscovery>) -> Self {
        Self {
            narinfo_cache: Arc::new(RwLock::new(HashMap::new())),
            avahi: a,
        }
    }

    pub fn get_avahi(&self) -> Arc<avahi::AvahiDiscovery> {
        Arc::clone(&self.avahi)
    }

    pub fn retrieve_narinfo<S: AsRef<str>>(
        &self,
        path: S,
    ) -> Box<dyn Future<Item = NARInfo, Error = Error>> {
        let path = path.as_ref().to_string();
        let cache = Arc::clone(&self.narinfo_cache);

        {
            let map = cache.read().expect("RwLock poisoned");
            if let Some(narinfo) = map.get(&path) {
                return Box::new(ok(narinfo.clone()));
            }
        }

        let url = format!("https://cache.nixos.org/{}.narinfo", &path);

        let client = reqwest::r#async::ClientBuilder::new()
            .build()
            .expect("Failed to build client");
        let response = client
            .get(&url)
            .send()
            .map_err(|e| Error::from(e))
            .and_then(|r| util::stream200_or_err(r).map_err(Error::RetrievalError));
        let narinfo = response
            .and_then(|(_sh, mut r)| r.text().map_err(Error::ReqwestError))
            .and_then(move |text| {
                let text = text.to_string();
                let narinfo = match NARInfo::parse(text) {
                    Ok(n) => n,
                    Err(e) => return err(Error::ParseError(e)),
                };
                {
                    let mut map = cache.write().expect("RwLock poisoned");
                    map.entry(path).or_insert(narinfo.clone());
                }
                ok(narinfo)
            });
        Box::new(narinfo)
    }
}
