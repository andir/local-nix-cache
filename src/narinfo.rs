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
    pub fn format_with_compression(&self, compression: &str) -> String {
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
            v.parse()
                .map_err(|_| format!("failed to parse value {} as isize", v))
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
        ni.url = ni
            .url
            .replace(".nar.xz", ".nar")
            .replace(".nar.gz", ".nar")
            .replace(".nar.bz2", ".nar");

        Ok(ni)
    }
}


