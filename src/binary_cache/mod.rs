// Module to read cached NAR infos from /nix/var/nix/binary-cache-v3.sqlite


#[derive(Debug)]
pub enum Error {
    RusqliteError(rusqlite::Error),
    ParsingError(String),
}

impl From<rusqlite::Error> for Error {
    fn from(err: rusqlite::Error) -> Error {
        Error::RusqliteError(err)
    }
}

pub type Result<T> = std::result::Result<T, Error>;

/**
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
pub struct NAR {
    pub cache: i32,
    pub store_path: String,
    pub url: String,
    pub compression: String,
    pub file_hash: Option<String>,
    pub file_size: Option<i32>,
    pub nar_hash: Option<String>,
    pub nar_size: Option<i32>,
    pub refs: Option<String>,
    pub deriver: Option<String>,
    pub signed_by: Option<String>,
    pub timestamp: i32,
}

pub struct BinaryCache {
    pub id: i32,
    pub url: String,
    pub timestamp: i32,
    pub store_dir: String,
    pub want_mass_query: i32,
    pub priority: i32,
}

// Wrapper around the binary cache sqlite database
pub struct BinaryCacheDB {
    conn: rusqlite::Connection,
}

impl BinaryCacheDB {
    pub fn new_with_db(conn: rusqlite::Connection) -> BinaryCacheDB {
        BinaryCacheDB {
            conn,
        }
    }

    pub fn lookup_binary_cache(&self, id: i32) -> Result<Option<BinaryCache>> {
        let mut stmt = self.conn.prepare_cached(
            "SELECT id, url, timestamp, storeDir, wantMassQuery, priority FROM BinaryCaches WHERE id = :id LIMIT 1;",
        )?;

        let r = stmt.query_map_named(
            named_params!{
                ":id": id,
            },
            |row| Ok(BinaryCache{
                id: row.get(0)?,
                url: row.get(1)?,
                timestamp: row.get(2)?,
                store_dir: row.get(3)?,
                want_mass_query: row.get(4)?,
                priority: row.get(5)?,
            }))?.next();

        return r.transpose().map_err(|e| e.into());
    }

    pub fn lookup_nar_for_path<S: AsRef<str>>(&self, path: S) -> Result<Option<NAR>> {
        let mut stmt = self.conn.prepare_cached(
            "SELECT cache, storePath, url, compression, fileHash, fileSize, narHash, narSize, refs, deriver, signedBy, timestamp FROM NARs WHERE storePath = :path LIMIT 1")?;

        let r = stmt.query_map_named(
            named_params!{
                ":path": path.as_ref(),
            },
            |row| Ok(NAR{
                cache: row.get(0)?,
                store_path: row.get(1)?,
                url: row.get(2)?,
                compression: row.get(3)?,
                file_hash: row.get(4)?,
                file_size: row.get(5)?,
                nar_hash: row.get(6)?,
                nar_size: row.get(7)?,
                refs: row.get(8)?,
                deriver: row.get(9)?,
                signed_by: row.get(10)?,
                timestamp: row.get(11)?,
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

    fn test_cache() -> super::BinaryCacheDB {
        super::BinaryCacheDB::new_with_db(test_connection())
    }


    #[test]
    fn test_lookup_nar_for_path_unknown() {
        let cache = test_cache();

        let nar = cache.lookup_nar_for_path("foo").unwrap();
        assert!(nar.is_none());
    }

    #[test]
    fn test_lookup_nar_for_path_known() {
        let cache = test_cache();

        let nar = cache.lookup_nar_for_path("fh7bfrad2xfwxhi7sl0xh1lpy2bipqmk-dmenu-4.6").unwrap();
        assert!(nar.is_some());
        let nar = nar.unwrap();

        assert_eq!(nar.cache, 1);
        assert_eq!(nar.signed_by, Some("cache.nixos.org-1".to_owned()));
    }

    #[test]
    fn test_lookup_binary_cache() {
        let cache = test_cache();
        let bcache = cache.lookup_binary_cache(1);
        match bcache {
            Ok(Some(b)) => {
                assert_eq!(b.store_dir, "/nix/store");
                assert_eq!(b.url, "https://cache.nixos.org");
            },
            _ => assert!(false),
        }
    }
}
