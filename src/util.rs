use futures::future::{err, ok, Future};
use reqwest::r#async::Response;
use std::sync::{Arc, Condvar, Mutex};

#[derive(Debug)]
pub enum RetrievalError {
    Exhausted,
    Not200,
    ReqwestError(reqwest::Error),
}

#[derive(Debug)]
pub struct SmallHeader {
    pub content_type: Option<String>,
    pub content_length: Option<u64>,
}

pub fn stream200_or_err(
    mut r: reqwest::r#async::Response,
) -> Box<dyn Future<Item = (SmallHeader, Response), Error = RetrievalError>> {
    let content_type: Option<_> = match r
        .headers()
        .get(reqwest::header::CONTENT_TYPE)
        .map(|v| v.to_str())
    {
        Some(Ok(v)) => Some(v.to_string()),
        _ => None,
    };
    let content_length = r.content_length();
    let sh = SmallHeader {
        content_type,
        content_length,
    };
    if r.status().as_u16() == 200 {
        Box::new(ok((sh, r)))
    } else {
        Box::new(err(RetrievalError::Not200))
    }
}


#[derive(Debug)]
pub struct WaitGroup {
   counter: Mutex<i64>,
   condvar: Condvar,
}

impl WaitGroup {
    pub fn new() -> Self {
        WaitGroup {
            counter: Mutex::new(0),
            condvar: Condvar::new(),
        }
    }

    pub fn new_arc() -> Arc<Self> {
        Arc::new(Self::new())
    }

    pub fn increment(&self) {
        let mut c = self.counter.lock().unwrap();
        *c += 1;
    }

    pub fn decrement(&self) {
        let mut c = self.counter.lock().unwrap();
        *c -= 1;
        self.condvar.notify_all();
    }

    pub fn wait(&self) {
        let mut count = self.counter.lock().unwrap();
        while *count > 0 {
            count = self.condvar.wait(count).unwrap();
        }
    }
}
