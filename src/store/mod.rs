
#[derive(Debug)]
pub struct ValidPath {
    pub id: i32,
    pub path: String,
    pub hash: String,
    pub registration_time: i32,
    pub deriver: Option<String>,
    pub nar_size: i32,
    pub ultimate: Option<i32>,
    pub sigs: Option<String>,
    pub ca: Option<String>,
}

impl ValidPath {

}

#[derive(Debug, PartialEq)]
pub enum Error {
    RusqliteError(rusqlite::Error),
    InvalidHash,
}

impl From<rusqlite::Error> for Error {
    fn from(err: rusqlite::Error) -> Error {
        Error::RusqliteError(err)
    }
}

pub const HASH_PART_LEN: usize = 32; // Size of the hash part of nix-store strings (base32)

pub type Result<T> = std::result::Result<T, Error>;

// Wrapper around the local-store sqlite database
pub struct StoreDB {
    prefix: String,
    conn: rusqlite::Connection,
}

impl StoreDB {
    pub fn new() -> Result<StoreDB> {
        let root = "/nix".to_owned();

        let mut flags = rusqlite::OpenFlags::empty();
        flags.set(rusqlite::OpenFlags::SQLITE_OPEN_READ_ONLY, true);
        flags.set(rusqlite::OpenFlags::SQLITE_OPEN_PRIVATE_CACHE, true);

        Ok(StoreDB {
            prefix: format!("{}/store/", root),
            conn: rusqlite::Connection::open_with_flags(
                format!("{}/var/nix/db/db.sqlite", root),
                flags
            )?,
        })
    }

    pub fn new_with_db(db: rusqlite::Connection) -> StoreDB {
        StoreDB {
            prefix: "/nix/store".to_owned(),
            conn: db,
        }
    }

  pub fn query_path_from_hash_part<S: AsRef<str>>(&self, hash_part: S) -> Result<Option<ValidPath>> {

      if hash_part.as_ref().len() != HASH_PART_LEN {
          return Err(Error::InvalidHash);
      }

      let path = format!("/nix/store/{}", hash_part.as_ref());
      let mut stmt = self.conn.prepare_cached(
          "SELECT id, path, hash, registrationTime, deriver, narSize, ultimate, sigs, ca FROM ValidPaths WHERE path >= :path LIMIT 1;")?;

      let r = stmt.query_map_named(
          named_params!{
              ":path": path,
          },
          |row| Ok(ValidPath {
              id: row.get(0)?,
              path: row.get(1)?,
              hash: row.get(2)?,
              registration_time: row.get(3)?,
              deriver: row.get(4)?,
              nar_size: row.get(5)?,
              ultimate: row.get(6)?,
              sigs: row.get(7)?,
              ca: row.get(8)?,
          }))?.next();

      return r.transpose().map_err(|e| e.into());
  }
}


#[cfg(test)]
mod tests {

    fn test_connection() -> rusqlite::Connection {
        let mut conn = rusqlite::Connection::open_in_memory().unwrap();
        conn.trace(Some(|s| println!("sql: {}", s)));
        conn.execute_batch(include_str!("./schema.sqlite3")).unwrap();
        conn
    }

    fn test_store() -> super::StoreDB {
        let conn = test_connection();
        super::StoreDB::new_with_db(conn)
    }

    #[test]
    fn unknown_hash() {
        let store = test_store();
        let r = store.query_path_from_hash_part("1-1-1-1-1-1");
        assert!(r.ok().is_none());
    }

    #[test]
    fn short_hash() {
        let store = test_store();
        let r = store.query_path_from_hash_part("9krlzvny65gdc8s7kpb6lkx8cd");
        assert_eq!(r.err(), Some(super::Error::InvalidHash));
    }

    #[test]
    fn valid_hash() {
        let store = test_store();
        let r = store.query_path_from_hash_part("9krlzvny65gdc8s7kpb6lkx8cd02c25b");
        assert!(r.is_ok());
        assert!(r.expect("failed to unwrap after is_ok?!?").is_some());
    }
}
