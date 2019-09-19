use std::collections::HashMap;
use std::sync::{Arc, RwLock};
use crate::avahi;
use crate::narinfo::NARInfo;

pub struct State {
    narinfo_cache: Arc<RwLock<HashMap<String, NARInfo>>>,
    avahi: Arc<avahi::AvahiDiscovery>,
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

    pub fn retrieve_narinfo<S: AsRef<str>>(&self, path: S) -> std::result::Result<NARInfo, String> {
        let cache = Arc::clone(&self.narinfo_cache);

        {
            let map = cache.read().expect("RwLock poisoned");
            if let Some(narinfo) = map.get(path.as_ref()) {
                return Ok(narinfo.clone());
            }
        }

        let url = format!("https://cache.nixos.org/{}.narinfo", path.as_ref());

        // Retrieve data from the internetz, it is a bit ugly since we are not using the event loop
        // that is already running from actix
        let text = reqwest::get(&url)
            .map_err(|e| format!("Failed to request narinfo from binary cache: {}", e))?
            .text()
            .map_err(|e| format!("Failed to retrieve response from binary cache: {}", e))?;

        let narinfo = NARInfo::parse(text)?;

        {
            let mut map = cache.write().expect("RwLock poisoned");
            map.entry(path.as_ref().to_owned())
                .or_insert(narinfo.clone());
        }

        Ok(narinfo)
    }
}


