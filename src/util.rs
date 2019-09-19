use futures::future::{err, Future};
#[derive(Debug)]
pub enum RetrievalError {
    Exhausted,
    Not200,
    ReqwestError(reqwest::Error),
}

pub fn text200_or_err(mut r: reqwest::r#async::Response) -> Box<dyn Future<Item=String, Error= RetrievalError>> {
    if r.status().as_u16() == 200 {
        use futures::future::IntoFuture;
        Box::new(r.text().map_err(RetrievalError::ReqwestError).into_future())
    } else {
        Box::new(err(RetrievalError::Not200))
    }
}
