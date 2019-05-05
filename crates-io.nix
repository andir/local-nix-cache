{ lib, buildRustCrate, buildRustCrateHelpers }:
with buildRustCrateHelpers;
let inherit (lib.lists) fold;
    inherit (lib.attrsets) recursiveUpdate;
in
rec {

# actix-0.7.9

  crates.actix."0.7.9" = deps: { features?(features_.actix."0.7.9" deps {}) }: buildRustCrate {
    crateName = "actix";
    version = "0.7.9";
    description = "Actor framework for Rust";
    authors = [ "Nikolay Kim <fafhrd91@gmail.com>" ];
    sha256 = "1gn83m5ydj3247j1sr1brlsvxqcsj6qq2mjq417060d48xzrxrw9";
    libPath = "src/lib.rs";
    dependencies = mapFeatures features ([
      (crates."actix_derive"."${deps."actix"."0.7.9"."actix_derive"}" deps)
      (crates."bitflags"."${deps."actix"."0.7.9"."bitflags"}" deps)
      (crates."bytes"."${deps."actix"."0.7.9"."bytes"}" deps)
      (crates."crossbeam_channel"."${deps."actix"."0.7.9"."crossbeam_channel"}" deps)
      (crates."failure"."${deps."actix"."0.7.9"."failure"}" deps)
      (crates."fnv"."${deps."actix"."0.7.9"."fnv"}" deps)
      (crates."futures"."${deps."actix"."0.7.9"."futures"}" deps)
      (crates."log"."${deps."actix"."0.7.9"."log"}" deps)
      (crates."parking_lot"."${deps."actix"."0.7.9"."parking_lot"}" deps)
      (crates."smallvec"."${deps."actix"."0.7.9"."smallvec"}" deps)
      (crates."tokio"."${deps."actix"."0.7.9"."tokio"}" deps)
      (crates."tokio_codec"."${deps."actix"."0.7.9"."tokio_codec"}" deps)
      (crates."tokio_executor"."${deps."actix"."0.7.9"."tokio_executor"}" deps)
      (crates."tokio_io"."${deps."actix"."0.7.9"."tokio_io"}" deps)
      (crates."tokio_reactor"."${deps."actix"."0.7.9"."tokio_reactor"}" deps)
      (crates."tokio_tcp"."${deps."actix"."0.7.9"."tokio_tcp"}" deps)
      (crates."tokio_timer"."${deps."actix"."0.7.9"."tokio_timer"}" deps)
      (crates."uuid"."${deps."actix"."0.7.9"."uuid"}" deps)
    ]
      ++ (if features.actix."0.7.9".tokio-signal or false then [ (crates.tokio_signal."${deps."actix"."0.7.9".tokio_signal}" deps) ] else [])
      ++ (if features.actix."0.7.9".trust-dns-proto or false then [ (crates.trust_dns_proto."${deps."actix"."0.7.9".trust_dns_proto}" deps) ] else [])
      ++ (if features.actix."0.7.9".trust-dns-resolver or false then [ (crates.trust_dns_resolver."${deps."actix"."0.7.9".trust_dns_resolver}" deps) ] else []))
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."actix"."0.7.9"."libc"}" deps)
    ]) else []);
    features = mkFeatures (features."actix"."0.7.9" or {});
  };
  features_.actix."0.7.9" = deps: f: updateFeatures f (rec {
    actix = fold recursiveUpdate {} [
      { "0.7.9"."resolver" =
        (f.actix."0.7.9"."resolver" or false) ||
        (f.actix."0.7.9".default or false) ||
        (actix."0.7.9"."default" or false); }
      { "0.7.9"."signal" =
        (f.actix."0.7.9"."signal" or false) ||
        (f.actix."0.7.9".default or false) ||
        (actix."0.7.9"."default" or false); }
      { "0.7.9"."tokio-signal" =
        (f.actix."0.7.9"."tokio-signal" or false) ||
        (f.actix."0.7.9".signal or false) ||
        (actix."0.7.9"."signal" or false); }
      { "0.7.9"."trust-dns-proto" =
        (f.actix."0.7.9"."trust-dns-proto" or false) ||
        (f.actix."0.7.9".resolver or false) ||
        (actix."0.7.9"."resolver" or false); }
      { "0.7.9"."trust-dns-resolver" =
        (f.actix."0.7.9"."trust-dns-resolver" or false) ||
        (f.actix."0.7.9".resolver or false) ||
        (actix."0.7.9"."resolver" or false); }
      { "0.7.9".default = (f.actix."0.7.9".default or true); }
    ];
    actix_derive."${deps.actix."0.7.9".actix_derive}".default = true;
    bitflags."${deps.actix."0.7.9".bitflags}".default = true;
    bytes."${deps.actix."0.7.9".bytes}".default = true;
    crossbeam_channel."${deps.actix."0.7.9".crossbeam_channel}".default = true;
    failure."${deps.actix."0.7.9".failure}".default = true;
    fnv."${deps.actix."0.7.9".fnv}".default = true;
    futures."${deps.actix."0.7.9".futures}".default = true;
    libc."${deps.actix."0.7.9".libc}".default = true;
    log."${deps.actix."0.7.9".log}".default = true;
    parking_lot."${deps.actix."0.7.9".parking_lot}".default = true;
    smallvec."${deps.actix."0.7.9".smallvec}".default = true;
    tokio."${deps.actix."0.7.9".tokio}".default = true;
    tokio_codec."${deps.actix."0.7.9".tokio_codec}".default = true;
    tokio_executor."${deps.actix."0.7.9".tokio_executor}".default = true;
    tokio_io."${deps.actix."0.7.9".tokio_io}".default = true;
    tokio_reactor."${deps.actix."0.7.9".tokio_reactor}".default = true;
    tokio_signal."${deps.actix."0.7.9".tokio_signal}".default = true;
    tokio_tcp."${deps.actix."0.7.9".tokio_tcp}".default = true;
    tokio_timer."${deps.actix."0.7.9".tokio_timer}".default = true;
    trust_dns_proto."${deps.actix."0.7.9".trust_dns_proto}".default = true;
    trust_dns_resolver."${deps.actix."0.7.9".trust_dns_resolver}".default = true;
    uuid = fold recursiveUpdate {} [
      { "${deps.actix."0.7.9".uuid}"."v4" = true; }
      { "${deps.actix."0.7.9".uuid}".default = true; }
    ];
  }) [
    (features_.actix_derive."${deps."actix"."0.7.9"."actix_derive"}" deps)
    (features_.bitflags."${deps."actix"."0.7.9"."bitflags"}" deps)
    (features_.bytes."${deps."actix"."0.7.9"."bytes"}" deps)
    (features_.crossbeam_channel."${deps."actix"."0.7.9"."crossbeam_channel"}" deps)
    (features_.failure."${deps."actix"."0.7.9"."failure"}" deps)
    (features_.fnv."${deps."actix"."0.7.9"."fnv"}" deps)
    (features_.futures."${deps."actix"."0.7.9"."futures"}" deps)
    (features_.log."${deps."actix"."0.7.9"."log"}" deps)
    (features_.parking_lot."${deps."actix"."0.7.9"."parking_lot"}" deps)
    (features_.smallvec."${deps."actix"."0.7.9"."smallvec"}" deps)
    (features_.tokio."${deps."actix"."0.7.9"."tokio"}" deps)
    (features_.tokio_codec."${deps."actix"."0.7.9"."tokio_codec"}" deps)
    (features_.tokio_executor."${deps."actix"."0.7.9"."tokio_executor"}" deps)
    (features_.tokio_io."${deps."actix"."0.7.9"."tokio_io"}" deps)
    (features_.tokio_reactor."${deps."actix"."0.7.9"."tokio_reactor"}" deps)
    (features_.tokio_signal."${deps."actix"."0.7.9"."tokio_signal"}" deps)
    (features_.tokio_tcp."${deps."actix"."0.7.9"."tokio_tcp"}" deps)
    (features_.tokio_timer."${deps."actix"."0.7.9"."tokio_timer"}" deps)
    (features_.trust_dns_proto."${deps."actix"."0.7.9"."trust_dns_proto"}" deps)
    (features_.trust_dns_resolver."${deps."actix"."0.7.9"."trust_dns_resolver"}" deps)
    (features_.uuid."${deps."actix"."0.7.9"."uuid"}" deps)
    (features_.libc."${deps."actix"."0.7.9"."libc"}" deps)
  ];


# end
# actix-net-0.2.6

  crates.actix_net."0.2.6" = deps: { features?(features_.actix_net."0.2.6" deps {}) }: buildRustCrate {
    crateName = "actix-net";
    version = "0.2.6";
    description = "Actix net - framework for the compisible network services for Rust (experimental)";
    authors = [ "Nikolay Kim <fafhrd91@gmail.com>" ];
    sha256 = "0axmqrq0iykv52ql9gqp152dyb8mr6yzhgaw7ipvnvba50zmdx8i";
    libPath = "src/lib.rs";
    libName = "actix_net";
    dependencies = mapFeatures features ([
      (crates."actix"."${deps."actix_net"."0.2.6"."actix"}" deps)
      (crates."bytes"."${deps."actix_net"."0.2.6"."bytes"}" deps)
      (crates."futures"."${deps."actix_net"."0.2.6"."futures"}" deps)
      (crates."log"."${deps."actix_net"."0.2.6"."log"}" deps)
      (crates."mio"."${deps."actix_net"."0.2.6"."mio"}" deps)
      (crates."net2"."${deps."actix_net"."0.2.6"."net2"}" deps)
      (crates."num_cpus"."${deps."actix_net"."0.2.6"."num_cpus"}" deps)
      (crates."slab"."${deps."actix_net"."0.2.6"."slab"}" deps)
      (crates."tokio"."${deps."actix_net"."0.2.6"."tokio"}" deps)
      (crates."tokio_codec"."${deps."actix_net"."0.2.6"."tokio_codec"}" deps)
      (crates."tokio_current_thread"."${deps."actix_net"."0.2.6"."tokio_current_thread"}" deps)
      (crates."tokio_io"."${deps."actix_net"."0.2.6"."tokio_io"}" deps)
      (crates."tokio_reactor"."${deps."actix_net"."0.2.6"."tokio_reactor"}" deps)
      (crates."tokio_tcp"."${deps."actix_net"."0.2.6"."tokio_tcp"}" deps)
      (crates."tokio_timer"."${deps."actix_net"."0.2.6"."tokio_timer"}" deps)
      (crates."tower_service"."${deps."actix_net"."0.2.6"."tower_service"}" deps)
      (crates."trust_dns_resolver"."${deps."actix_net"."0.2.6"."trust_dns_resolver"}" deps)
    ]);
    features = mkFeatures (features."actix_net"."0.2.6" or {});
  };
  features_.actix_net."0.2.6" = deps: f: updateFeatures f (rec {
    actix."${deps.actix_net."0.2.6".actix}".default = true;
    actix_net = fold recursiveUpdate {} [
      { "0.2.6"."native-tls" =
        (f.actix_net."0.2.6"."native-tls" or false) ||
        (f.actix_net."0.2.6".tls or false) ||
        (actix_net."0.2.6"."tls" or false); }
      { "0.2.6"."openssl" =
        (f.actix_net."0.2.6"."openssl" or false) ||
        (f.actix_net."0.2.6".ssl or false) ||
        (actix_net."0.2.6"."ssl" or false); }
      { "0.2.6"."rustls" =
        (f.actix_net."0.2.6"."rustls" or false) ||
        (f.actix_net."0.2.6".rust-tls or false) ||
        (actix_net."0.2.6"."rust-tls" or false); }
      { "0.2.6"."tokio-openssl" =
        (f.actix_net."0.2.6"."tokio-openssl" or false) ||
        (f.actix_net."0.2.6".ssl or false) ||
        (actix_net."0.2.6"."ssl" or false); }
      { "0.2.6"."tokio-rustls" =
        (f.actix_net."0.2.6"."tokio-rustls" or false) ||
        (f.actix_net."0.2.6".rust-tls or false) ||
        (actix_net."0.2.6"."rust-tls" or false); }
      { "0.2.6"."webpki" =
        (f.actix_net."0.2.6"."webpki" or false) ||
        (f.actix_net."0.2.6".rust-tls or false) ||
        (actix_net."0.2.6"."rust-tls" or false); }
      { "0.2.6"."webpki-roots" =
        (f.actix_net."0.2.6"."webpki-roots" or false) ||
        (f.actix_net."0.2.6".rust-tls or false) ||
        (actix_net."0.2.6"."rust-tls" or false); }
      { "0.2.6".default = (f.actix_net."0.2.6".default or true); }
    ];
    bytes."${deps.actix_net."0.2.6".bytes}".default = true;
    futures."${deps.actix_net."0.2.6".futures}".default = true;
    log."${deps.actix_net."0.2.6".log}".default = true;
    mio."${deps.actix_net."0.2.6".mio}".default = true;
    net2."${deps.actix_net."0.2.6".net2}".default = true;
    num_cpus."${deps.actix_net."0.2.6".num_cpus}".default = true;
    slab."${deps.actix_net."0.2.6".slab}".default = true;
    tokio."${deps.actix_net."0.2.6".tokio}".default = true;
    tokio_codec."${deps.actix_net."0.2.6".tokio_codec}".default = true;
    tokio_current_thread."${deps.actix_net."0.2.6".tokio_current_thread}".default = true;
    tokio_io."${deps.actix_net."0.2.6".tokio_io}".default = true;
    tokio_reactor."${deps.actix_net."0.2.6".tokio_reactor}".default = true;
    tokio_tcp."${deps.actix_net."0.2.6".tokio_tcp}".default = true;
    tokio_timer."${deps.actix_net."0.2.6".tokio_timer}".default = true;
    tower_service."${deps.actix_net."0.2.6".tower_service}".default = true;
    trust_dns_resolver."${deps.actix_net."0.2.6".trust_dns_resolver}".default = true;
  }) [
    (features_.actix."${deps."actix_net"."0.2.6"."actix"}" deps)
    (features_.bytes."${deps."actix_net"."0.2.6"."bytes"}" deps)
    (features_.futures."${deps."actix_net"."0.2.6"."futures"}" deps)
    (features_.log."${deps."actix_net"."0.2.6"."log"}" deps)
    (features_.mio."${deps."actix_net"."0.2.6"."mio"}" deps)
    (features_.net2."${deps."actix_net"."0.2.6"."net2"}" deps)
    (features_.num_cpus."${deps."actix_net"."0.2.6"."num_cpus"}" deps)
    (features_.slab."${deps."actix_net"."0.2.6"."slab"}" deps)
    (features_.tokio."${deps."actix_net"."0.2.6"."tokio"}" deps)
    (features_.tokio_codec."${deps."actix_net"."0.2.6"."tokio_codec"}" deps)
    (features_.tokio_current_thread."${deps."actix_net"."0.2.6"."tokio_current_thread"}" deps)
    (features_.tokio_io."${deps."actix_net"."0.2.6"."tokio_io"}" deps)
    (features_.tokio_reactor."${deps."actix_net"."0.2.6"."tokio_reactor"}" deps)
    (features_.tokio_tcp."${deps."actix_net"."0.2.6"."tokio_tcp"}" deps)
    (features_.tokio_timer."${deps."actix_net"."0.2.6"."tokio_timer"}" deps)
    (features_.tower_service."${deps."actix_net"."0.2.6"."tower_service"}" deps)
    (features_.trust_dns_resolver."${deps."actix_net"."0.2.6"."trust_dns_resolver"}" deps)
  ];


# end
# actix-web-0.7.19

  crates.actix_web."0.7.19" = deps: { features?(features_.actix_web."0.7.19" deps {}) }: buildRustCrate {
    crateName = "actix-web";
    version = "0.7.19";
    description = "Actix web is a simple, pragmatic and extremely fast web framework for Rust.";
    authors = [ "Nikolay Kim <fafhrd91@gmail.com>" ];
    sha256 = "1m4bw84108j141w79y7shcf0adn4m00kzcmylp723pmsr20l5fb6";
    libPath = "src/lib.rs";
    libName = "actix_web";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."actix"."${deps."actix_web"."0.7.19"."actix"}" deps)
      (crates."actix_net"."${deps."actix_web"."0.7.19"."actix_net"}" deps)
      (crates."base64"."${deps."actix_web"."0.7.19"."base64"}" deps)
      (crates."bitflags"."${deps."actix_web"."0.7.19"."bitflags"}" deps)
      (crates."byteorder"."${deps."actix_web"."0.7.19"."byteorder"}" deps)
      (crates."bytes"."${deps."actix_web"."0.7.19"."bytes"}" deps)
      (crates."cookie"."${deps."actix_web"."0.7.19"."cookie"}" deps)
      (crates."encoding"."${deps."actix_web"."0.7.19"."encoding"}" deps)
      (crates."failure"."${deps."actix_web"."0.7.19"."failure"}" deps)
      (crates."futures"."${deps."actix_web"."0.7.19"."futures"}" deps)
      (crates."futures_cpupool"."${deps."actix_web"."0.7.19"."futures_cpupool"}" deps)
      (crates."h2"."${deps."actix_web"."0.7.19"."h2"}" deps)
      (crates."http"."${deps."actix_web"."0.7.19"."http"}" deps)
      (crates."httparse"."${deps."actix_web"."0.7.19"."httparse"}" deps)
      (crates."language_tags"."${deps."actix_web"."0.7.19"."language_tags"}" deps)
      (crates."lazy_static"."${deps."actix_web"."0.7.19"."lazy_static"}" deps)
      (crates."lazycell"."${deps."actix_web"."0.7.19"."lazycell"}" deps)
      (crates."log"."${deps."actix_web"."0.7.19"."log"}" deps)
      (crates."mime"."${deps."actix_web"."0.7.19"."mime"}" deps)
      (crates."mime_guess"."${deps."actix_web"."0.7.19"."mime_guess"}" deps)
      (crates."mio"."${deps."actix_web"."0.7.19"."mio"}" deps)
      (crates."net2"."${deps."actix_web"."0.7.19"."net2"}" deps)
      (crates."num_cpus"."${deps."actix_web"."0.7.19"."num_cpus"}" deps)
      (crates."parking_lot"."${deps."actix_web"."0.7.19"."parking_lot"}" deps)
      (crates."percent_encoding"."${deps."actix_web"."0.7.19"."percent_encoding"}" deps)
      (crates."rand"."${deps."actix_web"."0.7.19"."rand"}" deps)
      (crates."regex"."${deps."actix_web"."0.7.19"."regex"}" deps)
      (crates."serde"."${deps."actix_web"."0.7.19"."serde"}" deps)
      (crates."serde_json"."${deps."actix_web"."0.7.19"."serde_json"}" deps)
      (crates."serde_urlencoded"."${deps."actix_web"."0.7.19"."serde_urlencoded"}" deps)
      (crates."sha1"."${deps."actix_web"."0.7.19"."sha1"}" deps)
      (crates."slab"."${deps."actix_web"."0.7.19"."slab"}" deps)
      (crates."smallvec"."${deps."actix_web"."0.7.19"."smallvec"}" deps)
      (crates."time"."${deps."actix_web"."0.7.19"."time"}" deps)
      (crates."tokio"."${deps."actix_web"."0.7.19"."tokio"}" deps)
      (crates."tokio_current_thread"."${deps."actix_web"."0.7.19"."tokio_current_thread"}" deps)
      (crates."tokio_io"."${deps."actix_web"."0.7.19"."tokio_io"}" deps)
      (crates."tokio_reactor"."${deps."actix_web"."0.7.19"."tokio_reactor"}" deps)
      (crates."tokio_tcp"."${deps."actix_web"."0.7.19"."tokio_tcp"}" deps)
      (crates."tokio_timer"."${deps."actix_web"."0.7.19"."tokio_timer"}" deps)
      (crates."url"."${deps."actix_web"."0.7.19"."url"}" deps)
      (crates."v_htmlescape"."${deps."actix_web"."0.7.19"."v_htmlescape"}" deps)
    ]
      ++ (if features.actix_web."0.7.19".brotli2 or false then [ (crates.brotli2."${deps."actix_web"."0.7.19".brotli2}" deps) ] else [])
      ++ (if features.actix_web."0.7.19".flate2 or false then [ (crates.flate2."${deps."actix_web"."0.7.19".flate2}" deps) ] else []));

    buildDependencies = mapFeatures features ([
      (crates."version_check"."${deps."actix_web"."0.7.19"."version_check"}" deps)
    ]);
    features = mkFeatures (features."actix_web"."0.7.19" or {});
  };
  features_.actix_web."0.7.19" = deps: f: updateFeatures f (rec {
    actix."${deps.actix_web."0.7.19".actix}".default = true;
    actix_net = fold recursiveUpdate {} [
      { "${deps.actix_web."0.7.19".actix_net}"."cell" =
        (f.actix_net."${deps.actix_web."0.7.19".actix_net}"."cell" or false) ||
        (actix_web."0.7.19"."cell" or false) ||
        (f."actix_web"."0.7.19"."cell" or false); }
      { "${deps.actix_web."0.7.19".actix_net}"."rust-tls" =
        (f.actix_net."${deps.actix_web."0.7.19".actix_net}"."rust-tls" or false) ||
        (actix_web."0.7.19"."rust-tls" or false) ||
        (f."actix_web"."0.7.19"."rust-tls" or false); }
      { "${deps.actix_web."0.7.19".actix_net}"."ssl" =
        (f.actix_net."${deps.actix_web."0.7.19".actix_net}"."ssl" or false) ||
        (actix_web."0.7.19"."alpn" or false) ||
        (f."actix_web"."0.7.19"."alpn" or false) ||
        (actix_web."0.7.19"."ssl" or false) ||
        (f."actix_web"."0.7.19"."ssl" or false); }
      { "${deps.actix_web."0.7.19".actix_net}"."tls" =
        (f.actix_net."${deps.actix_web."0.7.19".actix_net}"."tls" or false) ||
        (actix_web."0.7.19"."tls" or false) ||
        (f."actix_web"."0.7.19"."tls" or false); }
      { "${deps.actix_web."0.7.19".actix_net}".default = true; }
    ];
    actix_web = fold recursiveUpdate {} [
      { "0.7.19"."brotli" =
        (f.actix_web."0.7.19"."brotli" or false) ||
        (f.actix_web."0.7.19".default or false) ||
        (actix_web."0.7.19"."default" or false); }
      { "0.7.19"."brotli2" =
        (f.actix_web."0.7.19"."brotli2" or false) ||
        (f.actix_web."0.7.19".brotli or false) ||
        (actix_web."0.7.19"."brotli" or false); }
      { "0.7.19"."cell" =
        (f.actix_web."0.7.19"."cell" or false) ||
        (f.actix_web."0.7.19".default or false) ||
        (actix_web."0.7.19"."default" or false); }
      { "0.7.19"."flate2-c" =
        (f.actix_web."0.7.19"."flate2-c" or false) ||
        (f.actix_web."0.7.19".default or false) ||
        (actix_web."0.7.19"."default" or false); }
      { "0.7.19"."native-tls" =
        (f.actix_web."0.7.19"."native-tls" or false) ||
        (f.actix_web."0.7.19".tls or false) ||
        (actix_web."0.7.19"."tls" or false); }
      { "0.7.19"."openssl" =
        (f.actix_web."0.7.19"."openssl" or false) ||
        (f.actix_web."0.7.19".alpn or false) ||
        (actix_web."0.7.19"."alpn" or false) ||
        (f.actix_web."0.7.19".ssl or false) ||
        (actix_web."0.7.19"."ssl" or false); }
      { "0.7.19"."rustls" =
        (f.actix_web."0.7.19"."rustls" or false) ||
        (f.actix_web."0.7.19".rust-tls or false) ||
        (actix_web."0.7.19"."rust-tls" or false); }
      { "0.7.19"."session" =
        (f.actix_web."0.7.19"."session" or false) ||
        (f.actix_web."0.7.19".default or false) ||
        (actix_web."0.7.19"."default" or false); }
      { "0.7.19"."tokio-openssl" =
        (f.actix_web."0.7.19"."tokio-openssl" or false) ||
        (f.actix_web."0.7.19".alpn or false) ||
        (actix_web."0.7.19"."alpn" or false) ||
        (f.actix_web."0.7.19".ssl or false) ||
        (actix_web."0.7.19"."ssl" or false); }
      { "0.7.19"."tokio-rustls" =
        (f.actix_web."0.7.19"."tokio-rustls" or false) ||
        (f.actix_web."0.7.19".rust-tls or false) ||
        (actix_web."0.7.19"."rust-tls" or false); }
      { "0.7.19"."tokio-tls" =
        (f.actix_web."0.7.19"."tokio-tls" or false) ||
        (f.actix_web."0.7.19".tls or false) ||
        (actix_web."0.7.19"."tls" or false); }
      { "0.7.19"."tokio-uds" =
        (f.actix_web."0.7.19"."tokio-uds" or false) ||
        (f.actix_web."0.7.19".uds or false) ||
        (actix_web."0.7.19"."uds" or false); }
      { "0.7.19"."webpki" =
        (f.actix_web."0.7.19"."webpki" or false) ||
        (f.actix_web."0.7.19".rust-tls or false) ||
        (actix_web."0.7.19"."rust-tls" or false); }
      { "0.7.19"."webpki-roots" =
        (f.actix_web."0.7.19"."webpki-roots" or false) ||
        (f.actix_web."0.7.19".rust-tls or false) ||
        (actix_web."0.7.19"."rust-tls" or false); }
      { "0.7.19".default = (f.actix_web."0.7.19".default or true); }
    ];
    base64."${deps.actix_web."0.7.19".base64}".default = true;
    bitflags."${deps.actix_web."0.7.19".bitflags}".default = true;
    brotli2."${deps.actix_web."0.7.19".brotli2}".default = true;
    byteorder."${deps.actix_web."0.7.19".byteorder}".default = true;
    bytes."${deps.actix_web."0.7.19".bytes}".default = true;
    cookie = fold recursiveUpdate {} [
      { "${deps.actix_web."0.7.19".cookie}"."percent-encode" = true; }
      { "${deps.actix_web."0.7.19".cookie}"."secure" =
        (f.cookie."${deps.actix_web."0.7.19".cookie}"."secure" or false) ||
        (actix_web."0.7.19"."session" or false) ||
        (f."actix_web"."0.7.19"."session" or false); }
      { "${deps.actix_web."0.7.19".cookie}".default = true; }
    ];
    encoding."${deps.actix_web."0.7.19".encoding}".default = true;
    failure."${deps.actix_web."0.7.19".failure}".default = true;
    flate2 = fold recursiveUpdate {} [
      { "${deps.actix_web."0.7.19".flate2}"."miniz-sys" =
        (f.flate2."${deps.actix_web."0.7.19".flate2}"."miniz-sys" or false) ||
        (actix_web."0.7.19"."flate2-c" or false) ||
        (f."actix_web"."0.7.19"."flate2-c" or false); }
      { "${deps.actix_web."0.7.19".flate2}"."rust_backend" =
        (f.flate2."${deps.actix_web."0.7.19".flate2}"."rust_backend" or false) ||
        (actix_web."0.7.19"."flate2-rust" or false) ||
        (f."actix_web"."0.7.19"."flate2-rust" or false); }
      { "${deps.actix_web."0.7.19".flate2}".default = (f.flate2."${deps.actix_web."0.7.19".flate2}".default or false); }
    ];
    futures."${deps.actix_web."0.7.19".futures}".default = true;
    futures_cpupool."${deps.actix_web."0.7.19".futures_cpupool}".default = true;
    h2."${deps.actix_web."0.7.19".h2}".default = true;
    http."${deps.actix_web."0.7.19".http}".default = true;
    httparse."${deps.actix_web."0.7.19".httparse}".default = true;
    language_tags."${deps.actix_web."0.7.19".language_tags}".default = true;
    lazy_static."${deps.actix_web."0.7.19".lazy_static}".default = true;
    lazycell."${deps.actix_web."0.7.19".lazycell}".default = true;
    log."${deps.actix_web."0.7.19".log}".default = true;
    mime."${deps.actix_web."0.7.19".mime}".default = true;
    mime_guess."${deps.actix_web."0.7.19".mime_guess}".default = true;
    mio."${deps.actix_web."0.7.19".mio}".default = true;
    net2."${deps.actix_web."0.7.19".net2}".default = true;
    num_cpus."${deps.actix_web."0.7.19".num_cpus}".default = true;
    parking_lot."${deps.actix_web."0.7.19".parking_lot}".default = true;
    percent_encoding."${deps.actix_web."0.7.19".percent_encoding}".default = true;
    rand."${deps.actix_web."0.7.19".rand}".default = true;
    regex."${deps.actix_web."0.7.19".regex}".default = true;
    serde."${deps.actix_web."0.7.19".serde}".default = true;
    serde_json."${deps.actix_web."0.7.19".serde_json}".default = true;
    serde_urlencoded."${deps.actix_web."0.7.19".serde_urlencoded}".default = true;
    sha1."${deps.actix_web."0.7.19".sha1}".default = true;
    slab."${deps.actix_web."0.7.19".slab}".default = true;
    smallvec."${deps.actix_web."0.7.19".smallvec}".default = true;
    time."${deps.actix_web."0.7.19".time}".default = true;
    tokio."${deps.actix_web."0.7.19".tokio}".default = true;
    tokio_current_thread."${deps.actix_web."0.7.19".tokio_current_thread}".default = true;
    tokio_io."${deps.actix_web."0.7.19".tokio_io}".default = true;
    tokio_reactor."${deps.actix_web."0.7.19".tokio_reactor}".default = true;
    tokio_tcp."${deps.actix_web."0.7.19".tokio_tcp}".default = true;
    tokio_timer."${deps.actix_web."0.7.19".tokio_timer}".default = true;
    url = fold recursiveUpdate {} [
      { "${deps.actix_web."0.7.19".url}"."query_encoding" = true; }
      { "${deps.actix_web."0.7.19".url}".default = true; }
    ];
    v_htmlescape."${deps.actix_web."0.7.19".v_htmlescape}".default = true;
    version_check."${deps.actix_web."0.7.19".version_check}".default = true;
  }) [
    (features_.actix."${deps."actix_web"."0.7.19"."actix"}" deps)
    (features_.actix_net."${deps."actix_web"."0.7.19"."actix_net"}" deps)
    (features_.base64."${deps."actix_web"."0.7.19"."base64"}" deps)
    (features_.bitflags."${deps."actix_web"."0.7.19"."bitflags"}" deps)
    (features_.brotli2."${deps."actix_web"."0.7.19"."brotli2"}" deps)
    (features_.byteorder."${deps."actix_web"."0.7.19"."byteorder"}" deps)
    (features_.bytes."${deps."actix_web"."0.7.19"."bytes"}" deps)
    (features_.cookie."${deps."actix_web"."0.7.19"."cookie"}" deps)
    (features_.encoding."${deps."actix_web"."0.7.19"."encoding"}" deps)
    (features_.failure."${deps."actix_web"."0.7.19"."failure"}" deps)
    (features_.flate2."${deps."actix_web"."0.7.19"."flate2"}" deps)
    (features_.futures."${deps."actix_web"."0.7.19"."futures"}" deps)
    (features_.futures_cpupool."${deps."actix_web"."0.7.19"."futures_cpupool"}" deps)
    (features_.h2."${deps."actix_web"."0.7.19"."h2"}" deps)
    (features_.http."${deps."actix_web"."0.7.19"."http"}" deps)
    (features_.httparse."${deps."actix_web"."0.7.19"."httparse"}" deps)
    (features_.language_tags."${deps."actix_web"."0.7.19"."language_tags"}" deps)
    (features_.lazy_static."${deps."actix_web"."0.7.19"."lazy_static"}" deps)
    (features_.lazycell."${deps."actix_web"."0.7.19"."lazycell"}" deps)
    (features_.log."${deps."actix_web"."0.7.19"."log"}" deps)
    (features_.mime."${deps."actix_web"."0.7.19"."mime"}" deps)
    (features_.mime_guess."${deps."actix_web"."0.7.19"."mime_guess"}" deps)
    (features_.mio."${deps."actix_web"."0.7.19"."mio"}" deps)
    (features_.net2."${deps."actix_web"."0.7.19"."net2"}" deps)
    (features_.num_cpus."${deps."actix_web"."0.7.19"."num_cpus"}" deps)
    (features_.parking_lot."${deps."actix_web"."0.7.19"."parking_lot"}" deps)
    (features_.percent_encoding."${deps."actix_web"."0.7.19"."percent_encoding"}" deps)
    (features_.rand."${deps."actix_web"."0.7.19"."rand"}" deps)
    (features_.regex."${deps."actix_web"."0.7.19"."regex"}" deps)
    (features_.serde."${deps."actix_web"."0.7.19"."serde"}" deps)
    (features_.serde_json."${deps."actix_web"."0.7.19"."serde_json"}" deps)
    (features_.serde_urlencoded."${deps."actix_web"."0.7.19"."serde_urlencoded"}" deps)
    (features_.sha1."${deps."actix_web"."0.7.19"."sha1"}" deps)
    (features_.slab."${deps."actix_web"."0.7.19"."slab"}" deps)
    (features_.smallvec."${deps."actix_web"."0.7.19"."smallvec"}" deps)
    (features_.time."${deps."actix_web"."0.7.19"."time"}" deps)
    (features_.tokio."${deps."actix_web"."0.7.19"."tokio"}" deps)
    (features_.tokio_current_thread."${deps."actix_web"."0.7.19"."tokio_current_thread"}" deps)
    (features_.tokio_io."${deps."actix_web"."0.7.19"."tokio_io"}" deps)
    (features_.tokio_reactor."${deps."actix_web"."0.7.19"."tokio_reactor"}" deps)
    (features_.tokio_tcp."${deps."actix_web"."0.7.19"."tokio_tcp"}" deps)
    (features_.tokio_timer."${deps."actix_web"."0.7.19"."tokio_timer"}" deps)
    (features_.url."${deps."actix_web"."0.7.19"."url"}" deps)
    (features_.v_htmlescape."${deps."actix_web"."0.7.19"."v_htmlescape"}" deps)
    (features_.version_check."${deps."actix_web"."0.7.19"."version_check"}" deps)
  ];


# end
# actix_derive-0.3.2

  crates.actix_derive."0.3.2" = deps: { features?(features_.actix_derive."0.3.2" deps {}) }: buildRustCrate {
    crateName = "actix_derive";
    version = "0.3.2";
    description = "Actor framework for Rust";
    authors = [ "Callym <hi@callym.com>" "Nikolay Kim <fafhrd91@gmail.com>" ];
    sha256 = "0ya7sq7h90nmnjh04ikmx4n4ah5rhpljhwi8iyckbzraigvnzblr";
    procMacro = true;
    dependencies = mapFeatures features ([
      (crates."proc_macro2"."${deps."actix_derive"."0.3.2"."proc_macro2"}" deps)
      (crates."quote"."${deps."actix_derive"."0.3.2"."quote"}" deps)
      (crates."syn"."${deps."actix_derive"."0.3.2"."syn"}" deps)
    ]);
  };
  features_.actix_derive."0.3.2" = deps: f: updateFeatures f (rec {
    actix_derive."0.3.2".default = (f.actix_derive."0.3.2".default or true);
    proc_macro2."${deps.actix_derive."0.3.2".proc_macro2}".default = true;
    quote."${deps.actix_derive."0.3.2".quote}".default = true;
    syn = fold recursiveUpdate {} [
      { "${deps.actix_derive."0.3.2".syn}"."full" = true; }
      { "${deps.actix_derive."0.3.2".syn}".default = true; }
    ];
  }) [
    (features_.proc_macro2."${deps."actix_derive"."0.3.2"."proc_macro2"}" deps)
    (features_.quote."${deps."actix_derive"."0.3.2"."quote"}" deps)
    (features_.syn."${deps."actix_derive"."0.3.2"."syn"}" deps)
  ];


# end
# adler32-1.0.3

  crates.adler32."1.0.3" = deps: { features?(features_.adler32."1.0.3" deps {}) }: buildRustCrate {
    crateName = "adler32";
    version = "1.0.3";
    description = "Minimal Adler32 implementation for Rust.";
    authors = [ "Remi Rampin <remirampin@gmail.com>" ];
    sha256 = "1z3mvjgw02mbqk98kizzibrca01d5wfkpazsrp3vkkv3i56pn6fb";
  };
  features_.adler32."1.0.3" = deps: f: updateFeatures f (rec {
    adler32."1.0.3".default = (f.adler32."1.0.3".default or true);
  }) [];


# end
# aho-corasick-0.7.3

  crates.aho_corasick."0.7.3" = deps: { features?(features_.aho_corasick."0.7.3" deps {}) }: buildRustCrate {
    crateName = "aho-corasick";
    version = "0.7.3";
    description = "Fast multiple substring searching.";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" ];
    sha256 = "0dn42fbdms4brigqphxrvzbjd1s4knyjlzky30kgvpnrcl4sqqdv";
    libName = "aho_corasick";
    dependencies = mapFeatures features ([
      (crates."memchr"."${deps."aho_corasick"."0.7.3"."memchr"}" deps)
    ]);
    features = mkFeatures (features."aho_corasick"."0.7.3" or {});
  };
  features_.aho_corasick."0.7.3" = deps: f: updateFeatures f (rec {
    aho_corasick = fold recursiveUpdate {} [
      { "0.7.3"."std" =
        (f.aho_corasick."0.7.3"."std" or false) ||
        (f.aho_corasick."0.7.3".default or false) ||
        (aho_corasick."0.7.3"."default" or false); }
      { "0.7.3".default = (f.aho_corasick."0.7.3".default or true); }
    ];
    memchr = fold recursiveUpdate {} [
      { "${deps.aho_corasick."0.7.3".memchr}"."use_std" =
        (f.memchr."${deps.aho_corasick."0.7.3".memchr}"."use_std" or false) ||
        (aho_corasick."0.7.3"."std" or false) ||
        (f."aho_corasick"."0.7.3"."std" or false); }
      { "${deps.aho_corasick."0.7.3".memchr}".default = (f.memchr."${deps.aho_corasick."0.7.3".memchr}".default or false); }
    ];
  }) [
    (features_.memchr."${deps."aho_corasick"."0.7.3"."memchr"}" deps)
  ];


# end
# ansi_term-0.11.0

  crates.ansi_term."0.11.0" = deps: { features?(features_.ansi_term."0.11.0" deps {}) }: buildRustCrate {
    crateName = "ansi_term";
    version = "0.11.0";
    description = "Library for ANSI terminal colours and styles (bold, underline)";
    authors = [ "ogham@bsago.me" "Ryan Scheel (Havvy) <ryan.havvy@gmail.com>" "Josh Triplett <josh@joshtriplett.org>" ];
    sha256 = "08fk0p2xvkqpmz3zlrwnf6l8sj2vngw464rvzspzp31sbgxbwm4v";
    dependencies = (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."ansi_term"."0.11.0"."winapi"}" deps)
    ]) else []);
  };
  features_.ansi_term."0.11.0" = deps: f: updateFeatures f (rec {
    ansi_term."0.11.0".default = (f.ansi_term."0.11.0".default or true);
    winapi = fold recursiveUpdate {} [
      { "${deps.ansi_term."0.11.0".winapi}"."consoleapi" = true; }
      { "${deps.ansi_term."0.11.0".winapi}"."errhandlingapi" = true; }
      { "${deps.ansi_term."0.11.0".winapi}"."processenv" = true; }
      { "${deps.ansi_term."0.11.0".winapi}".default = true; }
    ];
  }) [
    (features_.winapi."${deps."ansi_term"."0.11.0"."winapi"}" deps)
  ];


# end
# arc-swap-0.3.11

  crates.arc_swap."0.3.11" = deps: { features?(features_.arc_swap."0.3.11" deps {}) }: buildRustCrate {
    crateName = "arc-swap";
    version = "0.3.11";
    description = "Atomically swappable Arc";
    authors = [ "Michal 'vorner' Vaner <vorner@vorner.cz>" ];
    sha256 = "0svh0bj0b89y4vni5pqa37qgwkya3gycjizlwg0bqkq30z5smfpf";
  };
  features_.arc_swap."0.3.11" = deps: f: updateFeatures f (rec {
    arc_swap."0.3.11".default = (f.arc_swap."0.3.11".default or true);
  }) [];


# end
# arrayvec-0.4.10

  crates.arrayvec."0.4.10" = deps: { features?(features_.arrayvec."0.4.10" deps {}) }: buildRustCrate {
    crateName = "arrayvec";
    version = "0.4.10";
    description = "A vector with fixed capacity, backed by an array (it can be stored on the stack too). Implements fixed capacity ArrayVec and ArrayString.";
    authors = [ "bluss" ];
    sha256 = "0qbh825i59w5wfdysqdkiwbwkrsy7lgbd4pwbyb8pxx8wc36iny8";
    dependencies = mapFeatures features ([
      (crates."nodrop"."${deps."arrayvec"."0.4.10"."nodrop"}" deps)
    ]);
    features = mkFeatures (features."arrayvec"."0.4.10" or {});
  };
  features_.arrayvec."0.4.10" = deps: f: updateFeatures f (rec {
    arrayvec = fold recursiveUpdate {} [
      { "0.4.10"."serde" =
        (f.arrayvec."0.4.10"."serde" or false) ||
        (f.arrayvec."0.4.10".serde-1 or false) ||
        (arrayvec."0.4.10"."serde-1" or false); }
      { "0.4.10"."std" =
        (f.arrayvec."0.4.10"."std" or false) ||
        (f.arrayvec."0.4.10".default or false) ||
        (arrayvec."0.4.10"."default" or false); }
      { "0.4.10".default = (f.arrayvec."0.4.10".default or true); }
    ];
    nodrop."${deps.arrayvec."0.4.10".nodrop}".default = (f.nodrop."${deps.arrayvec."0.4.10".nodrop}".default or false);
  }) [
    (features_.nodrop."${deps."arrayvec"."0.4.10"."nodrop"}" deps)
  ];


# end
# atty-0.2.11

  crates.atty."0.2.11" = deps: { features?(features_.atty."0.2.11" deps {}) }: buildRustCrate {
    crateName = "atty";
    version = "0.2.11";
    description = "A simple interface for querying atty";
    authors = [ "softprops <d.tangren@gmail.com>" ];
    sha256 = "0by1bj2km9jxi4i4g76zzi76fc2rcm9934jpnyrqd95zw344pb20";
    dependencies = (if kernel == "redox" then mapFeatures features ([
      (crates."termion"."${deps."atty"."0.2.11"."termion"}" deps)
    ]) else [])
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."atty"."0.2.11"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."atty"."0.2.11"."winapi"}" deps)
    ]) else []);
  };
  features_.atty."0.2.11" = deps: f: updateFeatures f (rec {
    atty."0.2.11".default = (f.atty."0.2.11".default or true);
    libc."${deps.atty."0.2.11".libc}".default = (f.libc."${deps.atty."0.2.11".libc}".default or false);
    termion."${deps.atty."0.2.11".termion}".default = true;
    winapi = fold recursiveUpdate {} [
      { "${deps.atty."0.2.11".winapi}"."consoleapi" = true; }
      { "${deps.atty."0.2.11".winapi}"."minwinbase" = true; }
      { "${deps.atty."0.2.11".winapi}"."minwindef" = true; }
      { "${deps.atty."0.2.11".winapi}"."processenv" = true; }
      { "${deps.atty."0.2.11".winapi}"."winbase" = true; }
      { "${deps.atty."0.2.11".winapi}".default = true; }
    ];
  }) [
    (features_.termion."${deps."atty"."0.2.11"."termion"}" deps)
    (features_.libc."${deps."atty"."0.2.11"."libc"}" deps)
    (features_.winapi."${deps."atty"."0.2.11"."winapi"}" deps)
  ];


# end
# autocfg-0.1.2

  crates.autocfg."0.1.2" = deps: { features?(features_.autocfg."0.1.2" deps {}) }: buildRustCrate {
    crateName = "autocfg";
    version = "0.1.2";
    description = "Automatic cfg for Rust compiler features";
    authors = [ "Josh Stone <cuviper@gmail.com>" ];
    sha256 = "0dv81dwnp1al3j4ffz007yrjv4w1c7hw09gnf0xs3icxiw6qqfs3";
  };
  features_.autocfg."0.1.2" = deps: f: updateFeatures f (rec {
    autocfg."0.1.2".default = (f.autocfg."0.1.2".default or true);
  }) [];


# end
# backtrace-0.3.15

  crates.backtrace."0.3.15" = deps: { features?(features_.backtrace."0.3.15" deps {}) }: buildRustCrate {
    crateName = "backtrace";
    version = "0.3.15";
    description = "A library to acquire a stack trace (backtrace) at runtime in a Rust program.\n";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" "The Rust Project Developers" ];
    sha256 = "0qgbc07aq9kfixv29s60xx666lmdpgmf27a78fwjlhnfzhqvkn0p";
    dependencies = mapFeatures features ([
      (crates."cfg_if"."${deps."backtrace"."0.3.15"."cfg_if"}" deps)
      (crates."rustc_demangle"."${deps."backtrace"."0.3.15"."rustc_demangle"}" deps)
    ])
      ++ (if (kernel == "linux" || kernel == "darwin") && !(kernel == "fuchsia") && !(kernel == "emscripten") && !(kernel == "darwin") && !(kernel == "ios") then mapFeatures features ([
    ]
      ++ (if features.backtrace."0.3.15".backtrace-sys or false then [ (crates.backtrace_sys."${deps."backtrace"."0.3.15".backtrace_sys}" deps) ] else [])) else [])
      ++ (if (kernel == "linux" || kernel == "darwin") || abi == "sgx" then mapFeatures features ([
      (crates."libc"."${deps."backtrace"."0.3.15"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."backtrace"."0.3.15"."winapi"}" deps)
    ]) else []);

    buildDependencies = mapFeatures features ([
      (crates."autocfg"."${deps."backtrace"."0.3.15"."autocfg"}" deps)
    ]);
    features = mkFeatures (features."backtrace"."0.3.15" or {});
  };
  features_.backtrace."0.3.15" = deps: f: updateFeatures f (rec {
    autocfg."${deps.backtrace."0.3.15".autocfg}".default = true;
    backtrace = fold recursiveUpdate {} [
      { "0.3.15"."addr2line" =
        (f.backtrace."0.3.15"."addr2line" or false) ||
        (f.backtrace."0.3.15".gimli-symbolize or false) ||
        (backtrace."0.3.15"."gimli-symbolize" or false); }
      { "0.3.15"."backtrace-sys" =
        (f.backtrace."0.3.15"."backtrace-sys" or false) ||
        (f.backtrace."0.3.15".libbacktrace or false) ||
        (backtrace."0.3.15"."libbacktrace" or false); }
      { "0.3.15"."coresymbolication" =
        (f.backtrace."0.3.15"."coresymbolication" or false) ||
        (f.backtrace."0.3.15".default or false) ||
        (backtrace."0.3.15"."default" or false); }
      { "0.3.15"."dbghelp" =
        (f.backtrace."0.3.15"."dbghelp" or false) ||
        (f.backtrace."0.3.15".default or false) ||
        (backtrace."0.3.15"."default" or false); }
      { "0.3.15"."dladdr" =
        (f.backtrace."0.3.15"."dladdr" or false) ||
        (f.backtrace."0.3.15".default or false) ||
        (backtrace."0.3.15"."default" or false); }
      { "0.3.15"."findshlibs" =
        (f.backtrace."0.3.15"."findshlibs" or false) ||
        (f.backtrace."0.3.15".gimli-symbolize or false) ||
        (backtrace."0.3.15"."gimli-symbolize" or false); }
      { "0.3.15"."gimli" =
        (f.backtrace."0.3.15"."gimli" or false) ||
        (f.backtrace."0.3.15".gimli-symbolize or false) ||
        (backtrace."0.3.15"."gimli-symbolize" or false); }
      { "0.3.15"."libbacktrace" =
        (f.backtrace."0.3.15"."libbacktrace" or false) ||
        (f.backtrace."0.3.15".default or false) ||
        (backtrace."0.3.15"."default" or false); }
      { "0.3.15"."libunwind" =
        (f.backtrace."0.3.15"."libunwind" or false) ||
        (f.backtrace."0.3.15".default or false) ||
        (backtrace."0.3.15"."default" or false); }
      { "0.3.15"."memmap" =
        (f.backtrace."0.3.15"."memmap" or false) ||
        (f.backtrace."0.3.15".gimli-symbolize or false) ||
        (backtrace."0.3.15"."gimli-symbolize" or false); }
      { "0.3.15"."object" =
        (f.backtrace."0.3.15"."object" or false) ||
        (f.backtrace."0.3.15".gimli-symbolize or false) ||
        (backtrace."0.3.15"."gimli-symbolize" or false); }
      { "0.3.15"."rustc-serialize" =
        (f.backtrace."0.3.15"."rustc-serialize" or false) ||
        (f.backtrace."0.3.15".serialize-rustc or false) ||
        (backtrace."0.3.15"."serialize-rustc" or false); }
      { "0.3.15"."serde" =
        (f.backtrace."0.3.15"."serde" or false) ||
        (f.backtrace."0.3.15".serialize-serde or false) ||
        (backtrace."0.3.15"."serialize-serde" or false); }
      { "0.3.15"."serde_derive" =
        (f.backtrace."0.3.15"."serde_derive" or false) ||
        (f.backtrace."0.3.15".serialize-serde or false) ||
        (backtrace."0.3.15"."serialize-serde" or false); }
      { "0.3.15"."std" =
        (f.backtrace."0.3.15"."std" or false) ||
        (f.backtrace."0.3.15".default or false) ||
        (backtrace."0.3.15"."default" or false) ||
        (f.backtrace."0.3.15".libbacktrace or false) ||
        (backtrace."0.3.15"."libbacktrace" or false); }
      { "0.3.15".default = (f.backtrace."0.3.15".default or true); }
    ];
    backtrace_sys."${deps.backtrace."0.3.15".backtrace_sys}".default = true;
    cfg_if."${deps.backtrace."0.3.15".cfg_if}".default = true;
    libc."${deps.backtrace."0.3.15".libc}".default = (f.libc."${deps.backtrace."0.3.15".libc}".default or false);
    rustc_demangle."${deps.backtrace."0.3.15".rustc_demangle}".default = true;
    winapi = fold recursiveUpdate {} [
      { "${deps.backtrace."0.3.15".winapi}"."dbghelp" = true; }
      { "${deps.backtrace."0.3.15".winapi}"."minwindef" = true; }
      { "${deps.backtrace."0.3.15".winapi}"."processthreadsapi" = true; }
      { "${deps.backtrace."0.3.15".winapi}"."winnt" = true; }
      { "${deps.backtrace."0.3.15".winapi}".default = true; }
    ];
  }) [
    (features_.cfg_if."${deps."backtrace"."0.3.15"."cfg_if"}" deps)
    (features_.rustc_demangle."${deps."backtrace"."0.3.15"."rustc_demangle"}" deps)
    (features_.autocfg."${deps."backtrace"."0.3.15"."autocfg"}" deps)
    (features_.backtrace_sys."${deps."backtrace"."0.3.15"."backtrace_sys"}" deps)
    (features_.libc."${deps."backtrace"."0.3.15"."libc"}" deps)
    (features_.winapi."${deps."backtrace"."0.3.15"."winapi"}" deps)
  ];


# end
# backtrace-sys-0.1.28

  crates.backtrace_sys."0.1.28" = deps: { features?(features_.backtrace_sys."0.1.28" deps {}) }: buildRustCrate {
    crateName = "backtrace-sys";
    version = "0.1.28";
    description = "Bindings to the libbacktrace gcc library\n";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "1bbw8chs0wskxwzz7f3yy7mjqhyqj8lslq8pcjw1rbd2g23c34xl";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."libc"."${deps."backtrace_sys"."0.1.28"."libc"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."cc"."${deps."backtrace_sys"."0.1.28"."cc"}" deps)
    ]);
  };
  features_.backtrace_sys."0.1.28" = deps: f: updateFeatures f (rec {
    backtrace_sys."0.1.28".default = (f.backtrace_sys."0.1.28".default or true);
    cc."${deps.backtrace_sys."0.1.28".cc}".default = true;
    libc."${deps.backtrace_sys."0.1.28".libc}".default = (f.libc."${deps.backtrace_sys."0.1.28".libc}".default or false);
  }) [
    (features_.libc."${deps."backtrace_sys"."0.1.28"."libc"}" deps)
    (features_.cc."${deps."backtrace_sys"."0.1.28"."cc"}" deps)
  ];


# end
# base64-0.9.3

  crates.base64."0.9.3" = deps: { features?(features_.base64."0.9.3" deps {}) }: buildRustCrate {
    crateName = "base64";
    version = "0.9.3";
    description = "encodes and decodes base64 as bytes or utf8";
    authors = [ "Alice Maz <alice@alicemaz.com>" "Marshall Pierce <marshall@mpierce.org>" ];
    sha256 = "11hhz8ln4zbpn2h2gm9fbbb9j254wrd4fpmddlyah2rrnqsmmqkd";
    dependencies = mapFeatures features ([
      (crates."byteorder"."${deps."base64"."0.9.3"."byteorder"}" deps)
      (crates."safemem"."${deps."base64"."0.9.3"."safemem"}" deps)
    ]);
  };
  features_.base64."0.9.3" = deps: f: updateFeatures f (rec {
    base64."0.9.3".default = (f.base64."0.9.3".default or true);
    byteorder."${deps.base64."0.9.3".byteorder}".default = true;
    safemem."${deps.base64."0.9.3".safemem}".default = true;
  }) [
    (features_.byteorder."${deps."base64"."0.9.3"."byteorder"}" deps)
    (features_.safemem."${deps."base64"."0.9.3"."safemem"}" deps)
  ];


# end
# base64-0.10.1

  crates.base64."0.10.1" = deps: { features?(features_.base64."0.10.1" deps {}) }: buildRustCrate {
    crateName = "base64";
    version = "0.10.1";
    description = "encodes and decodes base64 as bytes or utf8";
    authors = [ "Alice Maz <alice@alicemaz.com>" "Marshall Pierce <marshall@mpierce.org>" ];
    sha256 = "1zz3jq619hahla1f70ra38818b5n8cp4iilij81i90jq6z7hlfhg";
    dependencies = mapFeatures features ([
      (crates."byteorder"."${deps."base64"."0.10.1"."byteorder"}" deps)
    ]);
  };
  features_.base64."0.10.1" = deps: f: updateFeatures f (rec {
    base64."0.10.1".default = (f.base64."0.10.1".default or true);
    byteorder."${deps.base64."0.10.1".byteorder}".default = true;
  }) [
    (features_.byteorder."${deps."base64"."0.10.1"."byteorder"}" deps)
  ];


# end
# bindgen-0.42.3

  crates.bindgen."0.42.3" = deps: { features?(features_.bindgen."0.42.3" deps {}) }: buildRustCrate {
    crateName = "bindgen";
    version = "0.42.3";
    description = "Automatically generates Rust FFI bindings to C and C++ libraries.";
    authors = [ "Jyun-Yan You <jyyou.tw@gmail.com>" "Emilio Cobos Álvarez <emilio@crisal.io>" "Nick Fitzgerald <fitzgen@gmail.com>" "The Servo project developers" ];
    sha256 = "14ca84wnz4jr4080n2nisz6ckm9wipff57acylzmqlxrnw80qx7s";
    libPath = "src/lib.rs";
    crateBin =
      [{  name = "bindgen";  path = "src/main.rs"; }];
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."bitflags"."${deps."bindgen"."0.42.3"."bitflags"}" deps)
      (crates."cexpr"."${deps."bindgen"."0.42.3"."cexpr"}" deps)
      (crates."cfg_if"."${deps."bindgen"."0.42.3"."cfg_if"}" deps)
      (crates."clang_sys"."${deps."bindgen"."0.42.3"."clang_sys"}" deps)
      (crates."clap"."${deps."bindgen"."0.42.3"."clap"}" deps)
      (crates."lazy_static"."${deps."bindgen"."0.42.3"."lazy_static"}" deps)
      (crates."peeking_take_while"."${deps."bindgen"."0.42.3"."peeking_take_while"}" deps)
      (crates."proc_macro2"."${deps."bindgen"."0.42.3"."proc_macro2"}" deps)
      (crates."quote"."${deps."bindgen"."0.42.3"."quote"}" deps)
      (crates."regex"."${deps."bindgen"."0.42.3"."regex"}" deps)
      (crates."which"."${deps."bindgen"."0.42.3"."which"}" deps)
    ]
      ++ (if features.bindgen."0.42.3".env_logger or false then [ (crates.env_logger."${deps."bindgen"."0.42.3".env_logger}" deps) ] else [])
      ++ (if features.bindgen."0.42.3".log or false then [ (crates.log."${deps."bindgen"."0.42.3".log}" deps) ] else []));
    features = mkFeatures (features."bindgen"."0.42.3" or {});
  };
  features_.bindgen."0.42.3" = deps: f: updateFeatures f (rec {
    bindgen = fold recursiveUpdate {} [
      { "0.42.3"."env_logger" =
        (f.bindgen."0.42.3"."env_logger" or false) ||
        (f.bindgen."0.42.3".logging or false) ||
        (bindgen."0.42.3"."logging" or false); }
      { "0.42.3"."log" =
        (f.bindgen."0.42.3"."log" or false) ||
        (f.bindgen."0.42.3".logging or false) ||
        (bindgen."0.42.3"."logging" or false); }
      { "0.42.3"."logging" =
        (f.bindgen."0.42.3"."logging" or false) ||
        (f.bindgen."0.42.3".default or false) ||
        (bindgen."0.42.3"."default" or false); }
      { "0.42.3".default = (f.bindgen."0.42.3".default or true); }
    ];
    bitflags."${deps.bindgen."0.42.3".bitflags}".default = true;
    cexpr."${deps.bindgen."0.42.3".cexpr}".default = true;
    cfg_if."${deps.bindgen."0.42.3".cfg_if}".default = true;
    clang_sys = fold recursiveUpdate {} [
      { "${deps.bindgen."0.42.3".clang_sys}"."clang_6_0" = true; }
      { "${deps.bindgen."0.42.3".clang_sys}"."runtime" = true; }
      { "${deps.bindgen."0.42.3".clang_sys}".default = true; }
    ];
    clap."${deps.bindgen."0.42.3".clap}".default = true;
    env_logger."${deps.bindgen."0.42.3".env_logger}".default = true;
    lazy_static."${deps.bindgen."0.42.3".lazy_static}".default = true;
    log."${deps.bindgen."0.42.3".log}".default = true;
    peeking_take_while."${deps.bindgen."0.42.3".peeking_take_while}".default = true;
    proc_macro2."${deps.bindgen."0.42.3".proc_macro2}".default = (f.proc_macro2."${deps.bindgen."0.42.3".proc_macro2}".default or false);
    quote."${deps.bindgen."0.42.3".quote}".default = (f.quote."${deps.bindgen."0.42.3".quote}".default or false);
    regex."${deps.bindgen."0.42.3".regex}".default = true;
    which."${deps.bindgen."0.42.3".which}".default = true;
  }) [
    (features_.bitflags."${deps."bindgen"."0.42.3"."bitflags"}" deps)
    (features_.cexpr."${deps."bindgen"."0.42.3"."cexpr"}" deps)
    (features_.cfg_if."${deps."bindgen"."0.42.3"."cfg_if"}" deps)
    (features_.clang_sys."${deps."bindgen"."0.42.3"."clang_sys"}" deps)
    (features_.clap."${deps."bindgen"."0.42.3"."clap"}" deps)
    (features_.env_logger."${deps."bindgen"."0.42.3"."env_logger"}" deps)
    (features_.lazy_static."${deps."bindgen"."0.42.3"."lazy_static"}" deps)
    (features_.log."${deps."bindgen"."0.42.3"."log"}" deps)
    (features_.peeking_take_while."${deps."bindgen"."0.42.3"."peeking_take_while"}" deps)
    (features_.proc_macro2."${deps."bindgen"."0.42.3"."proc_macro2"}" deps)
    (features_.quote."${deps."bindgen"."0.42.3"."quote"}" deps)
    (features_.regex."${deps."bindgen"."0.42.3"."regex"}" deps)
    (features_.which."${deps."bindgen"."0.42.3"."which"}" deps)
  ];


# end
# bitflags-1.0.5

  crates.bitflags."1.0.5" = deps: { features?(features_.bitflags."1.0.5" deps {}) }: buildRustCrate {
    crateName = "bitflags";
    version = "1.0.5";
    description = "A macro to generate structures which behave like bitflags.\n";
    authors = [ "The Rust Project Developers" ];
    sha256 = "0brvi70yflsqa8q6myqjpqmmqa0ng00mi4hpnfinc2y52sv76cwg";
    build = "build.rs";
    features = mkFeatures (features."bitflags"."1.0.5" or {});
  };
  features_.bitflags."1.0.5" = deps: f: updateFeatures f (rec {
    bitflags."1.0.5".default = (f.bitflags."1.0.5".default or true);
  }) [];


# end
# brotli-sys-0.3.2

  crates.brotli_sys."0.3.2" = deps: { features?(features_.brotli_sys."0.3.2" deps {}) }: buildRustCrate {
    crateName = "brotli-sys";
    version = "0.3.2";
    description = "Raw bindings to libbrotli\n";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "0b68xckd06a5gvdykimgr5f0f2whrhj0lwqq6scy0viaargqkdnl";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."libc"."${deps."brotli_sys"."0.3.2"."libc"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."cc"."${deps."brotli_sys"."0.3.2"."cc"}" deps)
    ]);
  };
  features_.brotli_sys."0.3.2" = deps: f: updateFeatures f (rec {
    brotli_sys."0.3.2".default = (f.brotli_sys."0.3.2".default or true);
    cc."${deps.brotli_sys."0.3.2".cc}".default = true;
    libc."${deps.brotli_sys."0.3.2".libc}".default = true;
  }) [
    (features_.libc."${deps."brotli_sys"."0.3.2"."libc"}" deps)
    (features_.cc."${deps."brotli_sys"."0.3.2"."cc"}" deps)
  ];


# end
# brotli2-0.3.2

  crates.brotli2."0.3.2" = deps: { features?(features_.brotli2."0.3.2" deps {}) }: buildRustCrate {
    crateName = "brotli2";
    version = "0.3.2";
    description = "Bindings to libbrotli to provide brotli decompression and compression to Rust\n";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "1daqrhn50rr8k03h7dd2zkjc0qn2c45q6hrmi642fnz0y5rfwm5y";
    dependencies = mapFeatures features ([
      (crates."brotli_sys"."${deps."brotli2"."0.3.2"."brotli_sys"}" deps)
      (crates."libc"."${deps."brotli2"."0.3.2"."libc"}" deps)
    ]);
  };
  features_.brotli2."0.3.2" = deps: f: updateFeatures f (rec {
    brotli2."0.3.2".default = (f.brotli2."0.3.2".default or true);
    brotli_sys."${deps.brotli2."0.3.2".brotli_sys}".default = true;
    libc."${deps.brotli2."0.3.2".libc}".default = true;
  }) [
    (features_.brotli_sys."${deps."brotli2"."0.3.2"."brotli_sys"}" deps)
    (features_.libc."${deps."brotli2"."0.3.2"."libc"}" deps)
  ];


# end
# build_const-0.2.1

  crates.build_const."0.2.1" = deps: { features?(features_.build_const."0.2.1" deps {}) }: buildRustCrate {
    crateName = "build_const";
    version = "0.2.1";
    description = "library for creating importable constants from build.rs or a script";
    authors = [ "Garrett Berg <vitiral@gmail.com>" ];
    sha256 = "15249xzi3qlm72p4glxgavwyq70fx2sp4df6ii0sdlrixrrp77pl";
    features = mkFeatures (features."build_const"."0.2.1" or {});
  };
  features_.build_const."0.2.1" = deps: f: updateFeatures f (rec {
    build_const = fold recursiveUpdate {} [
      { "0.2.1"."std" =
        (f.build_const."0.2.1"."std" or false) ||
        (f.build_const."0.2.1".default or false) ||
        (build_const."0.2.1"."default" or false); }
      { "0.2.1".default = (f.build_const."0.2.1".default or true); }
    ];
  }) [];


# end
# byteorder-1.3.1

  crates.byteorder."1.3.1" = deps: { features?(features_.byteorder."1.3.1" deps {}) }: buildRustCrate {
    crateName = "byteorder";
    version = "1.3.1";
    description = "Library for reading/writing numbers in big-endian and little-endian.";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" ];
    sha256 = "1dd46l7fvmxfq90kh6ip1ghsxzzcdybac8f0mh2jivsdv9vy8k4w";
    build = "build.rs";
    features = mkFeatures (features."byteorder"."1.3.1" or {});
  };
  features_.byteorder."1.3.1" = deps: f: updateFeatures f (rec {
    byteorder = fold recursiveUpdate {} [
      { "1.3.1"."std" =
        (f.byteorder."1.3.1"."std" or false) ||
        (f.byteorder."1.3.1".default or false) ||
        (byteorder."1.3.1"."default" or false); }
      { "1.3.1".default = (f.byteorder."1.3.1".default or true); }
    ];
  }) [];


# end
# bytes-0.4.12

  crates.bytes."0.4.12" = deps: { features?(features_.bytes."0.4.12" deps {}) }: buildRustCrate {
    crateName = "bytes";
    version = "0.4.12";
    description = "Types and traits for working with bytes";
    authors = [ "Carl Lerche <me@carllerche.com>" ];
    sha256 = "0cw577vll9qp0h3l1sy24anr5mcnd5j26q9q7nw4f0mddssvfphf";
    dependencies = mapFeatures features ([
      (crates."byteorder"."${deps."bytes"."0.4.12"."byteorder"}" deps)
      (crates."iovec"."${deps."bytes"."0.4.12"."iovec"}" deps)
    ]);
    features = mkFeatures (features."bytes"."0.4.12" or {});
  };
  features_.bytes."0.4.12" = deps: f: updateFeatures f (rec {
    byteorder = fold recursiveUpdate {} [
      { "${deps.bytes."0.4.12".byteorder}"."i128" =
        (f.byteorder."${deps.bytes."0.4.12".byteorder}"."i128" or false) ||
        (bytes."0.4.12"."i128" or false) ||
        (f."bytes"."0.4.12"."i128" or false); }
      { "${deps.bytes."0.4.12".byteorder}".default = true; }
    ];
    bytes."0.4.12".default = (f.bytes."0.4.12".default or true);
    iovec."${deps.bytes."0.4.12".iovec}".default = true;
  }) [
    (features_.byteorder."${deps."bytes"."0.4.12"."byteorder"}" deps)
    (features_.iovec."${deps."bytes"."0.4.12"."iovec"}" deps)
  ];


# end
# cc-1.0.36

  crates.cc."1.0.36" = deps: { features?(features_.cc."1.0.36" deps {}) }: buildRustCrate {
    crateName = "cc";
    version = "1.0.36";
    description = "A build-time dependency for Cargo build scripts to assist in invoking the native\nC compiler to compile native C code into a static archive to be linked into Rust\ncode.\n";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "0yk9f8fcsp9qk00qbj8idsnjv29v5arp3w5awgggf5kg571djjx7";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."cc"."1.0.36" or {});
  };
  features_.cc."1.0.36" = deps: f: updateFeatures f (rec {
    cc = fold recursiveUpdate {} [
      { "1.0.36"."rayon" =
        (f.cc."1.0.36"."rayon" or false) ||
        (f.cc."1.0.36".parallel or false) ||
        (cc."1.0.36"."parallel" or false); }
      { "1.0.36".default = (f.cc."1.0.36".default or true); }
    ];
  }) [];


# end
# cexpr-0.3.5

  crates.cexpr."0.3.5" = deps: { features?(features_.cexpr."0.3.5" deps {}) }: buildRustCrate {
    crateName = "cexpr";
    version = "0.3.5";
    description = "A C expression parser and evaluator";
    authors = [ "Jethro Beekman <jethro@jbeekman.nl>" ];
    sha256 = "1aianwjm81d0k23aam5wpj1gzjild6wqq8qbkyjhd5qvrxz5z18p";
    dependencies = mapFeatures features ([
      (crates."nom"."${deps."cexpr"."0.3.5"."nom"}" deps)
    ]);
  };
  features_.cexpr."0.3.5" = deps: f: updateFeatures f (rec {
    cexpr."0.3.5".default = (f.cexpr."0.3.5".default or true);
    nom = fold recursiveUpdate {} [
      { "${deps.cexpr."0.3.5".nom}"."verbose-errors" = true; }
      { "${deps.cexpr."0.3.5".nom}".default = true; }
    ];
  }) [
    (features_.nom."${deps."cexpr"."0.3.5"."nom"}" deps)
  ];


# end
# cfg-if-0.1.7

  crates.cfg_if."0.1.7" = deps: { features?(features_.cfg_if."0.1.7" deps {}) }: buildRustCrate {
    crateName = "cfg-if";
    version = "0.1.7";
    description = "A macro to ergonomically define an item depending on a large number of #[cfg]\nparameters. Structured like an if-else chain, the first matching branch is the\nitem that gets emitted.\n";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "13gvcx1dxjq4mpmpj26hpg3yc97qffkx2zi58ykr1dwr8q2biiig";
  };
  features_.cfg_if."0.1.7" = deps: f: updateFeatures f (rec {
    cfg_if."0.1.7".default = (f.cfg_if."0.1.7".default or true);
  }) [];


# end
# clang-sys-0.26.4

  crates.clang_sys."0.26.4" = deps: { features?(features_.clang_sys."0.26.4" deps {}) }: buildRustCrate {
    crateName = "clang-sys";
    version = "0.26.4";
    description = "Rust bindings for libclang.";
    authors = [ "Kyle Mayes <kyle@mayeses.com>" ];
    sha256 = "097hhblr4yhkj22i5zjc635mmqp3vfz1jbrsv4nc061ws1nz4brx";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."glob"."${deps."clang_sys"."0.26.4"."glob"}" deps)
      (crates."libc"."${deps."clang_sys"."0.26.4"."libc"}" deps)
    ]
      ++ (if features.clang_sys."0.26.4".libloading or false then [ (crates.libloading."${deps."clang_sys"."0.26.4".libloading}" deps) ] else []));

    buildDependencies = mapFeatures features ([
      (crates."glob"."${deps."clang_sys"."0.26.4"."glob"}" deps)
    ]);
    features = mkFeatures (features."clang_sys"."0.26.4" or {});
  };
  features_.clang_sys."0.26.4" = deps: f: updateFeatures f (rec {
    clang_sys = fold recursiveUpdate {} [
      { "0.26.4"."gte_clang_3_6" =
        (f.clang_sys."0.26.4"."gte_clang_3_6" or false) ||
        (f.clang_sys."0.26.4".clang_3_6 or false) ||
        (clang_sys."0.26.4"."clang_3_6" or false) ||
        (f.clang_sys."0.26.4".clang_3_7 or false) ||
        (clang_sys."0.26.4"."clang_3_7" or false) ||
        (f.clang_sys."0.26.4".clang_3_8 or false) ||
        (clang_sys."0.26.4"."clang_3_8" or false) ||
        (f.clang_sys."0.26.4".clang_3_9 or false) ||
        (clang_sys."0.26.4"."clang_3_9" or false) ||
        (f.clang_sys."0.26.4".clang_4_0 or false) ||
        (clang_sys."0.26.4"."clang_4_0" or false) ||
        (f.clang_sys."0.26.4".clang_5_0 or false) ||
        (clang_sys."0.26.4"."clang_5_0" or false) ||
        (f.clang_sys."0.26.4".clang_6_0 or false) ||
        (clang_sys."0.26.4"."clang_6_0" or false) ||
        (f.clang_sys."0.26.4".clang_7_0 or false) ||
        (clang_sys."0.26.4"."clang_7_0" or false); }
      { "0.26.4"."gte_clang_3_7" =
        (f.clang_sys."0.26.4"."gte_clang_3_7" or false) ||
        (f.clang_sys."0.26.4".clang_3_7 or false) ||
        (clang_sys."0.26.4"."clang_3_7" or false) ||
        (f.clang_sys."0.26.4".clang_3_8 or false) ||
        (clang_sys."0.26.4"."clang_3_8" or false) ||
        (f.clang_sys."0.26.4".clang_3_9 or false) ||
        (clang_sys."0.26.4"."clang_3_9" or false) ||
        (f.clang_sys."0.26.4".clang_4_0 or false) ||
        (clang_sys."0.26.4"."clang_4_0" or false) ||
        (f.clang_sys."0.26.4".clang_5_0 or false) ||
        (clang_sys."0.26.4"."clang_5_0" or false) ||
        (f.clang_sys."0.26.4".clang_6_0 or false) ||
        (clang_sys."0.26.4"."clang_6_0" or false) ||
        (f.clang_sys."0.26.4".clang_7_0 or false) ||
        (clang_sys."0.26.4"."clang_7_0" or false); }
      { "0.26.4"."gte_clang_3_8" =
        (f.clang_sys."0.26.4"."gte_clang_3_8" or false) ||
        (f.clang_sys."0.26.4".clang_3_8 or false) ||
        (clang_sys."0.26.4"."clang_3_8" or false) ||
        (f.clang_sys."0.26.4".clang_3_9 or false) ||
        (clang_sys."0.26.4"."clang_3_9" or false) ||
        (f.clang_sys."0.26.4".clang_4_0 or false) ||
        (clang_sys."0.26.4"."clang_4_0" or false) ||
        (f.clang_sys."0.26.4".clang_5_0 or false) ||
        (clang_sys."0.26.4"."clang_5_0" or false) ||
        (f.clang_sys."0.26.4".clang_6_0 or false) ||
        (clang_sys."0.26.4"."clang_6_0" or false) ||
        (f.clang_sys."0.26.4".clang_7_0 or false) ||
        (clang_sys."0.26.4"."clang_7_0" or false); }
      { "0.26.4"."gte_clang_3_9" =
        (f.clang_sys."0.26.4"."gte_clang_3_9" or false) ||
        (f.clang_sys."0.26.4".clang_3_9 or false) ||
        (clang_sys."0.26.4"."clang_3_9" or false) ||
        (f.clang_sys."0.26.4".clang_4_0 or false) ||
        (clang_sys."0.26.4"."clang_4_0" or false) ||
        (f.clang_sys."0.26.4".clang_5_0 or false) ||
        (clang_sys."0.26.4"."clang_5_0" or false) ||
        (f.clang_sys."0.26.4".clang_6_0 or false) ||
        (clang_sys."0.26.4"."clang_6_0" or false) ||
        (f.clang_sys."0.26.4".clang_7_0 or false) ||
        (clang_sys."0.26.4"."clang_7_0" or false); }
      { "0.26.4"."gte_clang_4_0" =
        (f.clang_sys."0.26.4"."gte_clang_4_0" or false) ||
        (f.clang_sys."0.26.4".clang_4_0 or false) ||
        (clang_sys."0.26.4"."clang_4_0" or false) ||
        (f.clang_sys."0.26.4".clang_5_0 or false) ||
        (clang_sys."0.26.4"."clang_5_0" or false) ||
        (f.clang_sys."0.26.4".clang_6_0 or false) ||
        (clang_sys."0.26.4"."clang_6_0" or false) ||
        (f.clang_sys."0.26.4".clang_7_0 or false) ||
        (clang_sys."0.26.4"."clang_7_0" or false); }
      { "0.26.4"."gte_clang_5_0" =
        (f.clang_sys."0.26.4"."gte_clang_5_0" or false) ||
        (f.clang_sys."0.26.4".clang_5_0 or false) ||
        (clang_sys."0.26.4"."clang_5_0" or false) ||
        (f.clang_sys."0.26.4".clang_6_0 or false) ||
        (clang_sys."0.26.4"."clang_6_0" or false) ||
        (f.clang_sys."0.26.4".clang_7_0 or false) ||
        (clang_sys."0.26.4"."clang_7_0" or false); }
      { "0.26.4"."gte_clang_6_0" =
        (f.clang_sys."0.26.4"."gte_clang_6_0" or false) ||
        (f.clang_sys."0.26.4".clang_6_0 or false) ||
        (clang_sys."0.26.4"."clang_6_0" or false) ||
        (f.clang_sys."0.26.4".clang_7_0 or false) ||
        (clang_sys."0.26.4"."clang_7_0" or false); }
      { "0.26.4"."gte_clang_7_0" =
        (f.clang_sys."0.26.4"."gte_clang_7_0" or false) ||
        (f.clang_sys."0.26.4".clang_7_0 or false) ||
        (clang_sys."0.26.4"."clang_7_0" or false); }
      { "0.26.4"."libloading" =
        (f.clang_sys."0.26.4"."libloading" or false) ||
        (f.clang_sys."0.26.4".runtime or false) ||
        (clang_sys."0.26.4"."runtime" or false); }
      { "0.26.4".default = (f.clang_sys."0.26.4".default or true); }
    ];
    glob."${deps.clang_sys."0.26.4".glob}".default = true;
    libc."${deps.clang_sys."0.26.4".libc}".default = (f.libc."${deps.clang_sys."0.26.4".libc}".default or false);
    libloading."${deps.clang_sys."0.26.4".libloading}".default = true;
  }) [
    (features_.glob."${deps."clang_sys"."0.26.4"."glob"}" deps)
    (features_.libc."${deps."clang_sys"."0.26.4"."libc"}" deps)
    (features_.libloading."${deps."clang_sys"."0.26.4"."libloading"}" deps)
    (features_.glob."${deps."clang_sys"."0.26.4"."glob"}" deps)
  ];


# end
# clap-2.33.0

  crates.clap."2.33.0" = deps: { features?(features_.clap."2.33.0" deps {}) }: buildRustCrate {
    crateName = "clap";
    version = "2.33.0";
    description = "A simple to use, efficient, and full-featured Command Line Argument Parser\n";
    authors = [ "Kevin K. <kbknapp@gmail.com>" ];
    sha256 = "054n9ngh6pkknpmd4acgdsp40iw6f5jzq8a4h2b76gnbvk6p5xjh";
    dependencies = mapFeatures features ([
      (crates."bitflags"."${deps."clap"."2.33.0"."bitflags"}" deps)
      (crates."textwrap"."${deps."clap"."2.33.0"."textwrap"}" deps)
      (crates."unicode_width"."${deps."clap"."2.33.0"."unicode_width"}" deps)
    ]
      ++ (if features.clap."2.33.0".atty or false then [ (crates.atty."${deps."clap"."2.33.0".atty}" deps) ] else [])
      ++ (if features.clap."2.33.0".strsim or false then [ (crates.strsim."${deps."clap"."2.33.0".strsim}" deps) ] else [])
      ++ (if features.clap."2.33.0".vec_map or false then [ (crates.vec_map."${deps."clap"."2.33.0".vec_map}" deps) ] else []))
      ++ (if !(kernel == "windows") then mapFeatures features ([
    ]
      ++ (if features.clap."2.33.0".ansi_term or false then [ (crates.ansi_term."${deps."clap"."2.33.0".ansi_term}" deps) ] else [])) else []);
    features = mkFeatures (features."clap"."2.33.0" or {});
  };
  features_.clap."2.33.0" = deps: f: updateFeatures f (rec {
    ansi_term."${deps.clap."2.33.0".ansi_term}".default = true;
    atty."${deps.clap."2.33.0".atty}".default = true;
    bitflags."${deps.clap."2.33.0".bitflags}".default = true;
    clap = fold recursiveUpdate {} [
      { "2.33.0"."ansi_term" =
        (f.clap."2.33.0"."ansi_term" or false) ||
        (f.clap."2.33.0".color or false) ||
        (clap."2.33.0"."color" or false); }
      { "2.33.0"."atty" =
        (f.clap."2.33.0"."atty" or false) ||
        (f.clap."2.33.0".color or false) ||
        (clap."2.33.0"."color" or false); }
      { "2.33.0"."clippy" =
        (f.clap."2.33.0"."clippy" or false) ||
        (f.clap."2.33.0".lints or false) ||
        (clap."2.33.0"."lints" or false); }
      { "2.33.0"."color" =
        (f.clap."2.33.0"."color" or false) ||
        (f.clap."2.33.0".default or false) ||
        (clap."2.33.0"."default" or false); }
      { "2.33.0"."strsim" =
        (f.clap."2.33.0"."strsim" or false) ||
        (f.clap."2.33.0".suggestions or false) ||
        (clap."2.33.0"."suggestions" or false); }
      { "2.33.0"."suggestions" =
        (f.clap."2.33.0"."suggestions" or false) ||
        (f.clap."2.33.0".default or false) ||
        (clap."2.33.0"."default" or false); }
      { "2.33.0"."term_size" =
        (f.clap."2.33.0"."term_size" or false) ||
        (f.clap."2.33.0".wrap_help or false) ||
        (clap."2.33.0"."wrap_help" or false); }
      { "2.33.0"."vec_map" =
        (f.clap."2.33.0"."vec_map" or false) ||
        (f.clap."2.33.0".default or false) ||
        (clap."2.33.0"."default" or false); }
      { "2.33.0"."yaml" =
        (f.clap."2.33.0"."yaml" or false) ||
        (f.clap."2.33.0".doc or false) ||
        (clap."2.33.0"."doc" or false); }
      { "2.33.0"."yaml-rust" =
        (f.clap."2.33.0"."yaml-rust" or false) ||
        (f.clap."2.33.0".yaml or false) ||
        (clap."2.33.0"."yaml" or false); }
      { "2.33.0".default = (f.clap."2.33.0".default or true); }
    ];
    strsim."${deps.clap."2.33.0".strsim}".default = true;
    textwrap = fold recursiveUpdate {} [
      { "${deps.clap."2.33.0".textwrap}"."term_size" =
        (f.textwrap."${deps.clap."2.33.0".textwrap}"."term_size" or false) ||
        (clap."2.33.0"."wrap_help" or false) ||
        (f."clap"."2.33.0"."wrap_help" or false); }
      { "${deps.clap."2.33.0".textwrap}".default = true; }
    ];
    unicode_width."${deps.clap."2.33.0".unicode_width}".default = true;
    vec_map."${deps.clap."2.33.0".vec_map}".default = true;
  }) [
    (features_.atty."${deps."clap"."2.33.0"."atty"}" deps)
    (features_.bitflags."${deps."clap"."2.33.0"."bitflags"}" deps)
    (features_.strsim."${deps."clap"."2.33.0"."strsim"}" deps)
    (features_.textwrap."${deps."clap"."2.33.0"."textwrap"}" deps)
    (features_.unicode_width."${deps."clap"."2.33.0"."unicode_width"}" deps)
    (features_.vec_map."${deps."clap"."2.33.0"."vec_map"}" deps)
    (features_.ansi_term."${deps."clap"."2.33.0"."ansi_term"}" deps)
  ];


# end
# cloudabi-0.0.3

  crates.cloudabi."0.0.3" = deps: { features?(features_.cloudabi."0.0.3" deps {}) }: buildRustCrate {
    crateName = "cloudabi";
    version = "0.0.3";
    description = "Low level interface to CloudABI. Contains all syscalls and related types.";
    authors = [ "Nuxi (https://nuxi.nl/) and contributors" ];
    sha256 = "1z9lby5sr6vslfd14d6igk03s7awf91mxpsfmsp3prxbxlk0x7h5";
    libPath = "cloudabi.rs";
    dependencies = mapFeatures features ([
    ]
      ++ (if features.cloudabi."0.0.3".bitflags or false then [ (crates.bitflags."${deps."cloudabi"."0.0.3".bitflags}" deps) ] else []));
    features = mkFeatures (features."cloudabi"."0.0.3" or {});
  };
  features_.cloudabi."0.0.3" = deps: f: updateFeatures f (rec {
    bitflags."${deps.cloudabi."0.0.3".bitflags}".default = true;
    cloudabi = fold recursiveUpdate {} [
      { "0.0.3"."bitflags" =
        (f.cloudabi."0.0.3"."bitflags" or false) ||
        (f.cloudabi."0.0.3".default or false) ||
        (cloudabi."0.0.3"."default" or false); }
      { "0.0.3".default = (f.cloudabi."0.0.3".default or true); }
    ];
  }) [
    (features_.bitflags."${deps."cloudabi"."0.0.3"."bitflags"}" deps)
  ];


# end
# cookie-0.11.1

  crates.cookie."0.11.1" = deps: { features?(features_.cookie."0.11.1" deps {}) }: buildRustCrate {
    crateName = "cookie";
    version = "0.11.1";
    description = "Crate for parsing HTTP cookie headers and managing a cookie jar. Supports signed\nand private (encrypted + signed) jars.\n";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" "Sergio Benitez <sb@sergio.bz>" ];
    sha256 = "0crs2ph9kb7kmxmr3mgy6wwdqns32sfdcjws7f8km9qvrsdx40pk";
    dependencies = mapFeatures features ([
      (crates."time"."${deps."cookie"."0.11.1"."time"}" deps)
    ]
      ++ (if features.cookie."0.11.1".base64 or false then [ (crates.base64."${deps."cookie"."0.11.1".base64}" deps) ] else [])
      ++ (if features.cookie."0.11.1".ring or false then [ (crates.ring."${deps."cookie"."0.11.1".ring}" deps) ] else [])
      ++ (if features.cookie."0.11.1".url or false then [ (crates.url."${deps."cookie"."0.11.1".url}" deps) ] else []));
    features = mkFeatures (features."cookie"."0.11.1" or {});
  };
  features_.cookie."0.11.1" = deps: f: updateFeatures f (rec {
    base64."${deps.cookie."0.11.1".base64}".default = true;
    cookie = fold recursiveUpdate {} [
      { "0.11.1"."base64" =
        (f.cookie."0.11.1"."base64" or false) ||
        (f.cookie."0.11.1".secure or false) ||
        (cookie."0.11.1"."secure" or false); }
      { "0.11.1"."ring" =
        (f.cookie."0.11.1"."ring" or false) ||
        (f.cookie."0.11.1".secure or false) ||
        (cookie."0.11.1"."secure" or false); }
      { "0.11.1"."url" =
        (f.cookie."0.11.1"."url" or false) ||
        (f.cookie."0.11.1".percent-encode or false) ||
        (cookie."0.11.1"."percent-encode" or false); }
      { "0.11.1".default = (f.cookie."0.11.1".default or true); }
    ];
    ring."${deps.cookie."0.11.1".ring}".default = true;
    time."${deps.cookie."0.11.1".time}".default = true;
    url."${deps.cookie."0.11.1".url}".default = true;
  }) [
    (features_.base64."${deps."cookie"."0.11.1"."base64"}" deps)
    (features_.ring."${deps."cookie"."0.11.1"."ring"}" deps)
    (features_.time."${deps."cookie"."0.11.1"."time"}" deps)
    (features_.url."${deps."cookie"."0.11.1"."url"}" deps)
  ];


# end
# cookie_store-0.5.1

  crates.cookie_store."0.5.1" = deps: { features?(features_.cookie_store."0.5.1" deps {}) }: buildRustCrate {
    crateName = "cookie_store";
    version = "0.5.1";
    description = "Implementation of Cookie storage and retrieval per [RFC6265](http://tools.ietf.org/html/rfc6265)";
    authors = [ "patrick.fernie@gmail.com" ];
    edition = "2018";
    sha256 = "0yabmdfg3w7lga9ywq3bl05fr0v19h2h7p7d9aki5j0p7wizw6v1";
    dependencies = mapFeatures features ([
      (crates."cookie"."${deps."cookie_store"."0.5.1"."cookie"}" deps)
      (crates."failure"."${deps."cookie_store"."0.5.1"."failure"}" deps)
      (crates."failure_derive"."${deps."cookie_store"."0.5.1"."failure_derive"}" deps)
      (crates."idna"."${deps."cookie_store"."0.5.1"."idna"}" deps)
      (crates."log"."${deps."cookie_store"."0.5.1"."log"}" deps)
      (crates."publicsuffix"."${deps."cookie_store"."0.5.1"."publicsuffix"}" deps)
      (crates."serde"."${deps."cookie_store"."0.5.1"."serde"}" deps)
      (crates."serde_derive"."${deps."cookie_store"."0.5.1"."serde_derive"}" deps)
      (crates."serde_json"."${deps."cookie_store"."0.5.1"."serde_json"}" deps)
      (crates."time"."${deps."cookie_store"."0.5.1"."time"}" deps)
      (crates."try_from"."${deps."cookie_store"."0.5.1"."try_from"}" deps)
      (crates."url"."${deps."cookie_store"."0.5.1"."url"}" deps)
    ]);
  };
  features_.cookie_store."0.5.1" = deps: f: updateFeatures f (rec {
    cookie = fold recursiveUpdate {} [
      { "${deps.cookie_store."0.5.1".cookie}"."percent-encode" = true; }
      { "${deps.cookie_store."0.5.1".cookie}".default = true; }
    ];
    cookie_store."0.5.1".default = (f.cookie_store."0.5.1".default or true);
    failure."${deps.cookie_store."0.5.1".failure}".default = true;
    failure_derive."${deps.cookie_store."0.5.1".failure_derive}".default = true;
    idna."${deps.cookie_store."0.5.1".idna}".default = true;
    log."${deps.cookie_store."0.5.1".log}".default = true;
    publicsuffix."${deps.cookie_store."0.5.1".publicsuffix}".default = (f.publicsuffix."${deps.cookie_store."0.5.1".publicsuffix}".default or false);
    serde."${deps.cookie_store."0.5.1".serde}".default = true;
    serde_derive."${deps.cookie_store."0.5.1".serde_derive}".default = true;
    serde_json."${deps.cookie_store."0.5.1".serde_json}".default = true;
    time."${deps.cookie_store."0.5.1".time}".default = true;
    try_from."${deps.cookie_store."0.5.1".try_from}".default = true;
    url."${deps.cookie_store."0.5.1".url}".default = true;
  }) [
    (features_.cookie."${deps."cookie_store"."0.5.1"."cookie"}" deps)
    (features_.failure."${deps."cookie_store"."0.5.1"."failure"}" deps)
    (features_.failure_derive."${deps."cookie_store"."0.5.1"."failure_derive"}" deps)
    (features_.idna."${deps."cookie_store"."0.5.1"."idna"}" deps)
    (features_.log."${deps."cookie_store"."0.5.1"."log"}" deps)
    (features_.publicsuffix."${deps."cookie_store"."0.5.1"."publicsuffix"}" deps)
    (features_.serde."${deps."cookie_store"."0.5.1"."serde"}" deps)
    (features_.serde_derive."${deps."cookie_store"."0.5.1"."serde_derive"}" deps)
    (features_.serde_json."${deps."cookie_store"."0.5.1"."serde_json"}" deps)
    (features_.time."${deps."cookie_store"."0.5.1"."time"}" deps)
    (features_.try_from."${deps."cookie_store"."0.5.1"."try_from"}" deps)
    (features_.url."${deps."cookie_store"."0.5.1"."url"}" deps)
  ];


# end
# core-foundation-0.6.4

  crates.core_foundation."0.6.4" = deps: { features?(features_.core_foundation."0.6.4" deps {}) }: buildRustCrate {
    crateName = "core-foundation";
    version = "0.6.4";
    description = "Bindings to Core Foundation for macOS";
    authors = [ "The Servo Project Developers" ];
    sha256 = "1kabsqxh01m6l2b1gz8wgn0d1k6fyczww9kaks0sbmsz5g78ngzx";
    dependencies = mapFeatures features ([
      (crates."core_foundation_sys"."${deps."core_foundation"."0.6.4"."core_foundation_sys"}" deps)
      (crates."libc"."${deps."core_foundation"."0.6.4"."libc"}" deps)
    ]);
    features = mkFeatures (features."core_foundation"."0.6.4" or {});
  };
  features_.core_foundation."0.6.4" = deps: f: updateFeatures f (rec {
    core_foundation = fold recursiveUpdate {} [
      { "0.6.4"."chrono" =
        (f.core_foundation."0.6.4"."chrono" or false) ||
        (f.core_foundation."0.6.4".with-chrono or false) ||
        (core_foundation."0.6.4"."with-chrono" or false); }
      { "0.6.4"."uuid" =
        (f.core_foundation."0.6.4"."uuid" or false) ||
        (f.core_foundation."0.6.4".with-uuid or false) ||
        (core_foundation."0.6.4"."with-uuid" or false); }
      { "0.6.4".default = (f.core_foundation."0.6.4".default or true); }
    ];
    core_foundation_sys = fold recursiveUpdate {} [
      { "${deps.core_foundation."0.6.4".core_foundation_sys}"."mac_os_10_7_support" =
        (f.core_foundation_sys."${deps.core_foundation."0.6.4".core_foundation_sys}"."mac_os_10_7_support" or false) ||
        (core_foundation."0.6.4"."mac_os_10_7_support" or false) ||
        (f."core_foundation"."0.6.4"."mac_os_10_7_support" or false); }
      { "${deps.core_foundation."0.6.4".core_foundation_sys}"."mac_os_10_8_features" =
        (f.core_foundation_sys."${deps.core_foundation."0.6.4".core_foundation_sys}"."mac_os_10_8_features" or false) ||
        (core_foundation."0.6.4"."mac_os_10_8_features" or false) ||
        (f."core_foundation"."0.6.4"."mac_os_10_8_features" or false); }
      { "${deps.core_foundation."0.6.4".core_foundation_sys}".default = true; }
    ];
    libc."${deps.core_foundation."0.6.4".libc}".default = true;
  }) [
    (features_.core_foundation_sys."${deps."core_foundation"."0.6.4"."core_foundation_sys"}" deps)
    (features_.libc."${deps."core_foundation"."0.6.4"."libc"}" deps)
  ];


# end
# core-foundation-sys-0.6.2

  crates.core_foundation_sys."0.6.2" = deps: { features?(features_.core_foundation_sys."0.6.2" deps {}) }: buildRustCrate {
    crateName = "core-foundation-sys";
    version = "0.6.2";
    description = "Bindings to Core Foundation for OS X";
    authors = [ "The Servo Project Developers" ];
    sha256 = "1n2v6wlqkmqwhl7k6y50irx51p37xb0fcm3njbman82gnyq8di2c";
    build = "build.rs";
    features = mkFeatures (features."core_foundation_sys"."0.6.2" or {});
  };
  features_.core_foundation_sys."0.6.2" = deps: f: updateFeatures f (rec {
    core_foundation_sys."0.6.2".default = (f.core_foundation_sys."0.6.2".default or true);
  }) [];


# end
# crc-1.8.1

  crates.crc."1.8.1" = deps: { features?(features_.crc."1.8.1" deps {}) }: buildRustCrate {
    crateName = "crc";
    version = "1.8.1";
    description = "Rust implementation of CRC(16, 32, 64) with support of various standards";
    authors = [ "Rui Hu <code@mrhooray.com>" ];
    sha256 = "00m9jjqrddp3bqyanvyxv0hf6s56bx1wy51vcdcxg4n2jdhg109s";

    buildDependencies = mapFeatures features ([
      (crates."build_const"."${deps."crc"."1.8.1"."build_const"}" deps)
    ]);
    features = mkFeatures (features."crc"."1.8.1" or {});
  };
  features_.crc."1.8.1" = deps: f: updateFeatures f (rec {
    build_const."${deps.crc."1.8.1".build_const}".default = true;
    crc = fold recursiveUpdate {} [
      { "1.8.1"."std" =
        (f.crc."1.8.1"."std" or false) ||
        (f.crc."1.8.1".default or false) ||
        (crc."1.8.1"."default" or false); }
      { "1.8.1".default = (f.crc."1.8.1".default or true); }
    ];
  }) [
    (features_.build_const."${deps."crc"."1.8.1"."build_const"}" deps)
  ];


# end
# crc32fast-1.2.0

  crates.crc32fast."1.2.0" = deps: { features?(features_.crc32fast."1.2.0" deps {}) }: buildRustCrate {
    crateName = "crc32fast";
    version = "1.2.0";
    description = "Fast, SIMD-accelerated CRC32 (IEEE) checksum computation";
    authors = [ "Sam Rijs <srijs@airpost.net>" "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "1mx88ndqln6vzg7hjhjp8b7g0qggpqggsjrlsdqrfsrbpdzffcn8";
    dependencies = mapFeatures features ([
      (crates."cfg_if"."${deps."crc32fast"."1.2.0"."cfg_if"}" deps)
    ]);
    features = mkFeatures (features."crc32fast"."1.2.0" or {});
  };
  features_.crc32fast."1.2.0" = deps: f: updateFeatures f (rec {
    cfg_if."${deps.crc32fast."1.2.0".cfg_if}".default = true;
    crc32fast = fold recursiveUpdate {} [
      { "1.2.0"."std" =
        (f.crc32fast."1.2.0"."std" or false) ||
        (f.crc32fast."1.2.0".default or false) ||
        (crc32fast."1.2.0"."default" or false); }
      { "1.2.0".default = (f.crc32fast."1.2.0".default or true); }
    ];
  }) [
    (features_.cfg_if."${deps."crc32fast"."1.2.0"."cfg_if"}" deps)
  ];


# end
# crossbeam-channel-0.3.8

  crates.crossbeam_channel."0.3.8" = deps: { features?(features_.crossbeam_channel."0.3.8" deps {}) }: buildRustCrate {
    crateName = "crossbeam-channel";
    version = "0.3.8";
    description = "Multi-producer multi-consumer channels for message passing";
    authors = [ "The Crossbeam Project Developers" ];
    sha256 = "0apm8why2qsgr8ykh9x677kc9ml7qp71mvirfkdzdn4c1jyqyyzm";
    dependencies = mapFeatures features ([
      (crates."crossbeam_utils"."${deps."crossbeam_channel"."0.3.8"."crossbeam_utils"}" deps)
      (crates."smallvec"."${deps."crossbeam_channel"."0.3.8"."smallvec"}" deps)
    ]);
  };
  features_.crossbeam_channel."0.3.8" = deps: f: updateFeatures f (rec {
    crossbeam_channel."0.3.8".default = (f.crossbeam_channel."0.3.8".default or true);
    crossbeam_utils."${deps.crossbeam_channel."0.3.8".crossbeam_utils}".default = true;
    smallvec."${deps.crossbeam_channel."0.3.8".smallvec}".default = true;
  }) [
    (features_.crossbeam_utils."${deps."crossbeam_channel"."0.3.8"."crossbeam_utils"}" deps)
    (features_.smallvec."${deps."crossbeam_channel"."0.3.8"."smallvec"}" deps)
  ];


# end
# crossbeam-deque-0.7.1

  crates.crossbeam_deque."0.7.1" = deps: { features?(features_.crossbeam_deque."0.7.1" deps {}) }: buildRustCrate {
    crateName = "crossbeam-deque";
    version = "0.7.1";
    description = "Concurrent work-stealing deque";
    authors = [ "The Crossbeam Project Developers" ];
    sha256 = "11l7idrx3diksrxbaa13f9h9i6f3456qq3647f3kglxfjmz9bm8s";
    dependencies = mapFeatures features ([
      (crates."crossbeam_epoch"."${deps."crossbeam_deque"."0.7.1"."crossbeam_epoch"}" deps)
      (crates."crossbeam_utils"."${deps."crossbeam_deque"."0.7.1"."crossbeam_utils"}" deps)
    ]);
  };
  features_.crossbeam_deque."0.7.1" = deps: f: updateFeatures f (rec {
    crossbeam_deque."0.7.1".default = (f.crossbeam_deque."0.7.1".default or true);
    crossbeam_epoch."${deps.crossbeam_deque."0.7.1".crossbeam_epoch}".default = true;
    crossbeam_utils."${deps.crossbeam_deque."0.7.1".crossbeam_utils}".default = true;
  }) [
    (features_.crossbeam_epoch."${deps."crossbeam_deque"."0.7.1"."crossbeam_epoch"}" deps)
    (features_.crossbeam_utils."${deps."crossbeam_deque"."0.7.1"."crossbeam_utils"}" deps)
  ];


# end
# crossbeam-epoch-0.7.1

  crates.crossbeam_epoch."0.7.1" = deps: { features?(features_.crossbeam_epoch."0.7.1" deps {}) }: buildRustCrate {
    crateName = "crossbeam-epoch";
    version = "0.7.1";
    description = "Epoch-based garbage collection";
    authors = [ "The Crossbeam Project Developers" ];
    sha256 = "1n2p8rqsg0g8dws6kvjgi5jsbnd42l45dklnzc8vihjcxa6712bg";
    dependencies = mapFeatures features ([
      (crates."arrayvec"."${deps."crossbeam_epoch"."0.7.1"."arrayvec"}" deps)
      (crates."cfg_if"."${deps."crossbeam_epoch"."0.7.1"."cfg_if"}" deps)
      (crates."crossbeam_utils"."${deps."crossbeam_epoch"."0.7.1"."crossbeam_utils"}" deps)
      (crates."memoffset"."${deps."crossbeam_epoch"."0.7.1"."memoffset"}" deps)
      (crates."scopeguard"."${deps."crossbeam_epoch"."0.7.1"."scopeguard"}" deps)
    ]
      ++ (if features.crossbeam_epoch."0.7.1".lazy_static or false then [ (crates.lazy_static."${deps."crossbeam_epoch"."0.7.1".lazy_static}" deps) ] else []));
    features = mkFeatures (features."crossbeam_epoch"."0.7.1" or {});
  };
  features_.crossbeam_epoch."0.7.1" = deps: f: updateFeatures f (rec {
    arrayvec = fold recursiveUpdate {} [
      { "${deps.crossbeam_epoch."0.7.1".arrayvec}"."use_union" =
        (f.arrayvec."${deps.crossbeam_epoch."0.7.1".arrayvec}"."use_union" or false) ||
        (crossbeam_epoch."0.7.1"."nightly" or false) ||
        (f."crossbeam_epoch"."0.7.1"."nightly" or false); }
      { "${deps.crossbeam_epoch."0.7.1".arrayvec}".default = (f.arrayvec."${deps.crossbeam_epoch."0.7.1".arrayvec}".default or false); }
    ];
    cfg_if."${deps.crossbeam_epoch."0.7.1".cfg_if}".default = true;
    crossbeam_epoch = fold recursiveUpdate {} [
      { "0.7.1"."lazy_static" =
        (f.crossbeam_epoch."0.7.1"."lazy_static" or false) ||
        (f.crossbeam_epoch."0.7.1".std or false) ||
        (crossbeam_epoch."0.7.1"."std" or false); }
      { "0.7.1"."std" =
        (f.crossbeam_epoch."0.7.1"."std" or false) ||
        (f.crossbeam_epoch."0.7.1".default or false) ||
        (crossbeam_epoch."0.7.1"."default" or false); }
      { "0.7.1".default = (f.crossbeam_epoch."0.7.1".default or true); }
    ];
    crossbeam_utils = fold recursiveUpdate {} [
      { "${deps.crossbeam_epoch."0.7.1".crossbeam_utils}"."nightly" =
        (f.crossbeam_utils."${deps.crossbeam_epoch."0.7.1".crossbeam_utils}"."nightly" or false) ||
        (crossbeam_epoch."0.7.1"."nightly" or false) ||
        (f."crossbeam_epoch"."0.7.1"."nightly" or false); }
      { "${deps.crossbeam_epoch."0.7.1".crossbeam_utils}"."std" =
        (f.crossbeam_utils."${deps.crossbeam_epoch."0.7.1".crossbeam_utils}"."std" or false) ||
        (crossbeam_epoch."0.7.1"."std" or false) ||
        (f."crossbeam_epoch"."0.7.1"."std" or false); }
      { "${deps.crossbeam_epoch."0.7.1".crossbeam_utils}".default = (f.crossbeam_utils."${deps.crossbeam_epoch."0.7.1".crossbeam_utils}".default or false); }
    ];
    lazy_static."${deps.crossbeam_epoch."0.7.1".lazy_static}".default = true;
    memoffset."${deps.crossbeam_epoch."0.7.1".memoffset}".default = true;
    scopeguard."${deps.crossbeam_epoch."0.7.1".scopeguard}".default = (f.scopeguard."${deps.crossbeam_epoch."0.7.1".scopeguard}".default or false);
  }) [
    (features_.arrayvec."${deps."crossbeam_epoch"."0.7.1"."arrayvec"}" deps)
    (features_.cfg_if."${deps."crossbeam_epoch"."0.7.1"."cfg_if"}" deps)
    (features_.crossbeam_utils."${deps."crossbeam_epoch"."0.7.1"."crossbeam_utils"}" deps)
    (features_.lazy_static."${deps."crossbeam_epoch"."0.7.1"."lazy_static"}" deps)
    (features_.memoffset."${deps."crossbeam_epoch"."0.7.1"."memoffset"}" deps)
    (features_.scopeguard."${deps."crossbeam_epoch"."0.7.1"."scopeguard"}" deps)
  ];


# end
# crossbeam-queue-0.1.2

  crates.crossbeam_queue."0.1.2" = deps: { features?(features_.crossbeam_queue."0.1.2" deps {}) }: buildRustCrate {
    crateName = "crossbeam-queue";
    version = "0.1.2";
    description = "Concurrent queues";
    authors = [ "The Crossbeam Project Developers" ];
    sha256 = "1hannzr5w6j5061kg5iba4fzi6f2xpqv7bkcspfq17y1i8g0mzjj";
    dependencies = mapFeatures features ([
      (crates."crossbeam_utils"."${deps."crossbeam_queue"."0.1.2"."crossbeam_utils"}" deps)
    ]);
  };
  features_.crossbeam_queue."0.1.2" = deps: f: updateFeatures f (rec {
    crossbeam_queue."0.1.2".default = (f.crossbeam_queue."0.1.2".default or true);
    crossbeam_utils."${deps.crossbeam_queue."0.1.2".crossbeam_utils}".default = true;
  }) [
    (features_.crossbeam_utils."${deps."crossbeam_queue"."0.1.2"."crossbeam_utils"}" deps)
  ];


# end
# crossbeam-utils-0.6.5

  crates.crossbeam_utils."0.6.5" = deps: { features?(features_.crossbeam_utils."0.6.5" deps {}) }: buildRustCrate {
    crateName = "crossbeam-utils";
    version = "0.6.5";
    description = "Utilities for concurrent programming";
    authors = [ "The Crossbeam Project Developers" ];
    sha256 = "1z7wgcl9d22r2x6769r5945rnwf3jqfrrmb16q7kzk292r1d4rdg";
    dependencies = mapFeatures features ([
      (crates."cfg_if"."${deps."crossbeam_utils"."0.6.5"."cfg_if"}" deps)
    ]
      ++ (if features.crossbeam_utils."0.6.5".lazy_static or false then [ (crates.lazy_static."${deps."crossbeam_utils"."0.6.5".lazy_static}" deps) ] else []));
    features = mkFeatures (features."crossbeam_utils"."0.6.5" or {});
  };
  features_.crossbeam_utils."0.6.5" = deps: f: updateFeatures f (rec {
    cfg_if."${deps.crossbeam_utils."0.6.5".cfg_if}".default = true;
    crossbeam_utils = fold recursiveUpdate {} [
      { "0.6.5"."lazy_static" =
        (f.crossbeam_utils."0.6.5"."lazy_static" or false) ||
        (f.crossbeam_utils."0.6.5".std or false) ||
        (crossbeam_utils."0.6.5"."std" or false); }
      { "0.6.5"."std" =
        (f.crossbeam_utils."0.6.5"."std" or false) ||
        (f.crossbeam_utils."0.6.5".default or false) ||
        (crossbeam_utils."0.6.5"."default" or false); }
      { "0.6.5".default = (f.crossbeam_utils."0.6.5".default or true); }
    ];
    lazy_static."${deps.crossbeam_utils."0.6.5".lazy_static}".default = true;
  }) [
    (features_.cfg_if."${deps."crossbeam_utils"."0.6.5"."cfg_if"}" deps)
    (features_.lazy_static."${deps."crossbeam_utils"."0.6.5"."lazy_static"}" deps)
  ];


# end
# dtoa-0.4.4

  crates.dtoa."0.4.4" = deps: { features?(features_.dtoa."0.4.4" deps {}) }: buildRustCrate {
    crateName = "dtoa";
    version = "0.4.4";
    description = "Fast functions for printing floating-point primitives to an io::Write";
    authors = [ "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "1nbq72nc2kp8lbx6i1ml5ird5c0cy4i6dvm7wfydybmanw4m07xz";
  };
  features_.dtoa."0.4.4" = deps: f: updateFeatures f (rec {
    dtoa."0.4.4".default = (f.dtoa."0.4.4".default or true);
  }) [];


# end
# encoding-0.2.33

  crates.encoding."0.2.33" = deps: { features?(features_.encoding."0.2.33" deps {}) }: buildRustCrate {
    crateName = "encoding";
    version = "0.2.33";
    description = "Character encoding support for Rust";
    authors = [ "Kang Seonghoon <public+rust@mearie.org>" ];
    sha256 = "16ls6avhv5ll28zajl5q1jbiz1g80c4ygnw13zzqmij14wsp5329";
    dependencies = mapFeatures features ([
      (crates."encoding_index_japanese"."${deps."encoding"."0.2.33"."encoding_index_japanese"}" deps)
      (crates."encoding_index_korean"."${deps."encoding"."0.2.33"."encoding_index_korean"}" deps)
      (crates."encoding_index_simpchinese"."${deps."encoding"."0.2.33"."encoding_index_simpchinese"}" deps)
      (crates."encoding_index_singlebyte"."${deps."encoding"."0.2.33"."encoding_index_singlebyte"}" deps)
      (crates."encoding_index_tradchinese"."${deps."encoding"."0.2.33"."encoding_index_tradchinese"}" deps)
    ]);
  };
  features_.encoding."0.2.33" = deps: f: updateFeatures f (rec {
    encoding."0.2.33".default = (f.encoding."0.2.33".default or true);
    encoding_index_japanese."${deps.encoding."0.2.33".encoding_index_japanese}".default = true;
    encoding_index_korean."${deps.encoding."0.2.33".encoding_index_korean}".default = true;
    encoding_index_simpchinese."${deps.encoding."0.2.33".encoding_index_simpchinese}".default = true;
    encoding_index_singlebyte."${deps.encoding."0.2.33".encoding_index_singlebyte}".default = true;
    encoding_index_tradchinese."${deps.encoding."0.2.33".encoding_index_tradchinese}".default = true;
  }) [
    (features_.encoding_index_japanese."${deps."encoding"."0.2.33"."encoding_index_japanese"}" deps)
    (features_.encoding_index_korean."${deps."encoding"."0.2.33"."encoding_index_korean"}" deps)
    (features_.encoding_index_simpchinese."${deps."encoding"."0.2.33"."encoding_index_simpchinese"}" deps)
    (features_.encoding_index_singlebyte."${deps."encoding"."0.2.33"."encoding_index_singlebyte"}" deps)
    (features_.encoding_index_tradchinese."${deps."encoding"."0.2.33"."encoding_index_tradchinese"}" deps)
  ];


# end
# encoding-index-japanese-1.20141219.5

  crates.encoding_index_japanese."1.20141219.5" = deps: { features?(features_.encoding_index_japanese."1.20141219.5" deps {}) }: buildRustCrate {
    crateName = "encoding-index-japanese";
    version = "1.20141219.5";
    description = "Index tables for Japanese character encodings";
    authors = [ "Kang Seonghoon <public+rust@mearie.org>" ];
    sha256 = "1pmfaabps0x6v6cd4fbk9ssykhkmc799dma2y78fhk7gvyr5gyl4";
    libPath = "lib.rs";
    libName = "encoding_index_japanese";
    dependencies = mapFeatures features ([
      (crates."encoding_index_tests"."${deps."encoding_index_japanese"."1.20141219.5"."encoding_index_tests"}" deps)
    ]);
  };
  features_.encoding_index_japanese."1.20141219.5" = deps: f: updateFeatures f (rec {
    encoding_index_japanese."1.20141219.5".default = (f.encoding_index_japanese."1.20141219.5".default or true);
    encoding_index_tests."${deps.encoding_index_japanese."1.20141219.5".encoding_index_tests}".default = true;
  }) [
    (features_.encoding_index_tests."${deps."encoding_index_japanese"."1.20141219.5"."encoding_index_tests"}" deps)
  ];


# end
# encoding-index-korean-1.20141219.5

  crates.encoding_index_korean."1.20141219.5" = deps: { features?(features_.encoding_index_korean."1.20141219.5" deps {}) }: buildRustCrate {
    crateName = "encoding-index-korean";
    version = "1.20141219.5";
    description = "Index tables for Korean character encodings";
    authors = [ "Kang Seonghoon <public+rust@mearie.org>" ];
    sha256 = "1b756n7gcilkx07y7zjrikcg0b8v8yd6mw8w01ji8sp3k1cabcf2";
    libPath = "lib.rs";
    libName = "encoding_index_korean";
    dependencies = mapFeatures features ([
      (crates."encoding_index_tests"."${deps."encoding_index_korean"."1.20141219.5"."encoding_index_tests"}" deps)
    ]);
  };
  features_.encoding_index_korean."1.20141219.5" = deps: f: updateFeatures f (rec {
    encoding_index_korean."1.20141219.5".default = (f.encoding_index_korean."1.20141219.5".default or true);
    encoding_index_tests."${deps.encoding_index_korean."1.20141219.5".encoding_index_tests}".default = true;
  }) [
    (features_.encoding_index_tests."${deps."encoding_index_korean"."1.20141219.5"."encoding_index_tests"}" deps)
  ];


# end
# encoding-index-simpchinese-1.20141219.5

  crates.encoding_index_simpchinese."1.20141219.5" = deps: { features?(features_.encoding_index_simpchinese."1.20141219.5" deps {}) }: buildRustCrate {
    crateName = "encoding-index-simpchinese";
    version = "1.20141219.5";
    description = "Index tables for simplified Chinese character encodings";
    authors = [ "Kang Seonghoon <public+rust@mearie.org>" ];
    sha256 = "0rb4xd8cqymhqffqqxdk18mf9n354vs50ar66jrysb1z6ymcvvpy";
    libPath = "lib.rs";
    libName = "encoding_index_simpchinese";
    dependencies = mapFeatures features ([
      (crates."encoding_index_tests"."${deps."encoding_index_simpchinese"."1.20141219.5"."encoding_index_tests"}" deps)
    ]);
  };
  features_.encoding_index_simpchinese."1.20141219.5" = deps: f: updateFeatures f (rec {
    encoding_index_simpchinese."1.20141219.5".default = (f.encoding_index_simpchinese."1.20141219.5".default or true);
    encoding_index_tests."${deps.encoding_index_simpchinese."1.20141219.5".encoding_index_tests}".default = true;
  }) [
    (features_.encoding_index_tests."${deps."encoding_index_simpchinese"."1.20141219.5"."encoding_index_tests"}" deps)
  ];


# end
# encoding-index-singlebyte-1.20141219.5

  crates.encoding_index_singlebyte."1.20141219.5" = deps: { features?(features_.encoding_index_singlebyte."1.20141219.5" deps {}) }: buildRustCrate {
    crateName = "encoding-index-singlebyte";
    version = "1.20141219.5";
    description = "Index tables for various single-byte character encodings";
    authors = [ "Kang Seonghoon <public+rust@mearie.org>" ];
    sha256 = "07df3jrfwfmzi2s352lvcpvy5dqpy2s45d2xx2dz1x7zh3q5284d";
    libPath = "lib.rs";
    libName = "encoding_index_singlebyte";
    dependencies = mapFeatures features ([
      (crates."encoding_index_tests"."${deps."encoding_index_singlebyte"."1.20141219.5"."encoding_index_tests"}" deps)
    ]);
  };
  features_.encoding_index_singlebyte."1.20141219.5" = deps: f: updateFeatures f (rec {
    encoding_index_singlebyte."1.20141219.5".default = (f.encoding_index_singlebyte."1.20141219.5".default or true);
    encoding_index_tests."${deps.encoding_index_singlebyte."1.20141219.5".encoding_index_tests}".default = true;
  }) [
    (features_.encoding_index_tests."${deps."encoding_index_singlebyte"."1.20141219.5"."encoding_index_tests"}" deps)
  ];


# end
# encoding-index-tradchinese-1.20141219.5

  crates.encoding_index_tradchinese."1.20141219.5" = deps: { features?(features_.encoding_index_tradchinese."1.20141219.5" deps {}) }: buildRustCrate {
    crateName = "encoding-index-tradchinese";
    version = "1.20141219.5";
    description = "Index tables for traditional Chinese character encodings";
    authors = [ "Kang Seonghoon <public+rust@mearie.org>" ];
    sha256 = "0lb12nbv29cy41gx26yz3v4kfi8h1xbn1ppja8szgqi2zm1wlywn";
    libPath = "lib.rs";
    libName = "encoding_index_tradchinese";
    dependencies = mapFeatures features ([
      (crates."encoding_index_tests"."${deps."encoding_index_tradchinese"."1.20141219.5"."encoding_index_tests"}" deps)
    ]);
  };
  features_.encoding_index_tradchinese."1.20141219.5" = deps: f: updateFeatures f (rec {
    encoding_index_tests."${deps.encoding_index_tradchinese."1.20141219.5".encoding_index_tests}".default = true;
    encoding_index_tradchinese."1.20141219.5".default = (f.encoding_index_tradchinese."1.20141219.5".default or true);
  }) [
    (features_.encoding_index_tests."${deps."encoding_index_tradchinese"."1.20141219.5"."encoding_index_tests"}" deps)
  ];


# end
# encoding_index_tests-0.1.4

  crates.encoding_index_tests."0.1.4" = deps: { features?(features_.encoding_index_tests."0.1.4" deps {}) }: buildRustCrate {
    crateName = "encoding_index_tests";
    version = "0.1.4";
    description = "Helper macros used to test index tables for character encodings";
    authors = [ "Kang Seonghoon <public+rust@mearie.org>" ];
    sha256 = "0z09kwh4z76q00cfr081rgjbnai4s2maq2vk88lgrq9d6bkf93f6";
    libPath = "index_tests.rs";
  };
  features_.encoding_index_tests."0.1.4" = deps: f: updateFeatures f (rec {
    encoding_index_tests."0.1.4".default = (f.encoding_index_tests."0.1.4".default or true);
  }) [];


# end
# encoding_rs-0.8.17

  crates.encoding_rs."0.8.17" = deps: { features?(features_.encoding_rs."0.8.17" deps {}) }: buildRustCrate {
    crateName = "encoding_rs";
    version = "0.8.17";
    description = "A Gecko-oriented implementation of the Encoding Standard";
    authors = [ "Henri Sivonen <hsivonen@hsivonen.fi>" ];
    sha256 = "0p8afcx1flzr1sz2ja2gvn9c000mb8k7ysy5vv0ia3khac3i30li";
    dependencies = mapFeatures features ([
      (crates."cfg_if"."${deps."encoding_rs"."0.8.17"."cfg_if"}" deps)
    ]);
    features = mkFeatures (features."encoding_rs"."0.8.17" or {});
  };
  features_.encoding_rs."0.8.17" = deps: f: updateFeatures f (rec {
    cfg_if."${deps.encoding_rs."0.8.17".cfg_if}".default = true;
    encoding_rs = fold recursiveUpdate {} [
      { "0.8.17"."fast-big5-hanzi-encode" =
        (f.encoding_rs."0.8.17"."fast-big5-hanzi-encode" or false) ||
        (f.encoding_rs."0.8.17".fast-legacy-encode or false) ||
        (encoding_rs."0.8.17"."fast-legacy-encode" or false); }
      { "0.8.17"."fast-gb-hanzi-encode" =
        (f.encoding_rs."0.8.17"."fast-gb-hanzi-encode" or false) ||
        (f.encoding_rs."0.8.17".fast-legacy-encode or false) ||
        (encoding_rs."0.8.17"."fast-legacy-encode" or false); }
      { "0.8.17"."fast-hangul-encode" =
        (f.encoding_rs."0.8.17"."fast-hangul-encode" or false) ||
        (f.encoding_rs."0.8.17".fast-legacy-encode or false) ||
        (encoding_rs."0.8.17"."fast-legacy-encode" or false); }
      { "0.8.17"."fast-hanja-encode" =
        (f.encoding_rs."0.8.17"."fast-hanja-encode" or false) ||
        (f.encoding_rs."0.8.17".fast-legacy-encode or false) ||
        (encoding_rs."0.8.17"."fast-legacy-encode" or false); }
      { "0.8.17"."fast-kanji-encode" =
        (f.encoding_rs."0.8.17"."fast-kanji-encode" or false) ||
        (f.encoding_rs."0.8.17".fast-legacy-encode or false) ||
        (encoding_rs."0.8.17"."fast-legacy-encode" or false); }
      { "0.8.17"."packed_simd" =
        (f.encoding_rs."0.8.17"."packed_simd" or false) ||
        (f.encoding_rs."0.8.17".simd-accel or false) ||
        (encoding_rs."0.8.17"."simd-accel" or false); }
      { "0.8.17".default = (f.encoding_rs."0.8.17".default or true); }
    ];
  }) [
    (features_.cfg_if."${deps."encoding_rs"."0.8.17"."cfg_if"}" deps)
  ];


# end
# env_logger-0.5.13

  crates.env_logger."0.5.13" = deps: { features?(features_.env_logger."0.5.13" deps {}) }: buildRustCrate {
    crateName = "env_logger";
    version = "0.5.13";
    description = "A logging implementation for `log` which is configured via an environment\nvariable.\n";
    authors = [ "The Rust Project Developers" ];
    sha256 = "1q6vylngcz4bn088b4hvsl879l8yz1k2bma75waljb5p4h4kbb72";
    dependencies = mapFeatures features ([
      (crates."atty"."${deps."env_logger"."0.5.13"."atty"}" deps)
      (crates."humantime"."${deps."env_logger"."0.5.13"."humantime"}" deps)
      (crates."log"."${deps."env_logger"."0.5.13"."log"}" deps)
      (crates."termcolor"."${deps."env_logger"."0.5.13"."termcolor"}" deps)
    ]
      ++ (if features.env_logger."0.5.13".regex or false then [ (crates.regex."${deps."env_logger"."0.5.13".regex}" deps) ] else []));
    features = mkFeatures (features."env_logger"."0.5.13" or {});
  };
  features_.env_logger."0.5.13" = deps: f: updateFeatures f (rec {
    atty."${deps.env_logger."0.5.13".atty}".default = true;
    env_logger = fold recursiveUpdate {} [
      { "0.5.13"."regex" =
        (f.env_logger."0.5.13"."regex" or false) ||
        (f.env_logger."0.5.13".default or false) ||
        (env_logger."0.5.13"."default" or false); }
      { "0.5.13".default = (f.env_logger."0.5.13".default or true); }
    ];
    humantime."${deps.env_logger."0.5.13".humantime}".default = true;
    log = fold recursiveUpdate {} [
      { "${deps.env_logger."0.5.13".log}"."std" = true; }
      { "${deps.env_logger."0.5.13".log}".default = true; }
    ];
    regex."${deps.env_logger."0.5.13".regex}".default = true;
    termcolor."${deps.env_logger."0.5.13".termcolor}".default = true;
  }) [
    (features_.atty."${deps."env_logger"."0.5.13"."atty"}" deps)
    (features_.humantime."${deps."env_logger"."0.5.13"."humantime"}" deps)
    (features_.log."${deps."env_logger"."0.5.13"."log"}" deps)
    (features_.regex."${deps."env_logger"."0.5.13"."regex"}" deps)
    (features_.termcolor."${deps."env_logger"."0.5.13"."termcolor"}" deps)
  ];


# end
# env_logger-0.6.1

  crates.env_logger."0.6.1" = deps: { features?(features_.env_logger."0.6.1" deps {}) }: buildRustCrate {
    crateName = "env_logger";
    version = "0.6.1";
    description = "A logging implementation for `log` which is configured via an environment\nvariable.\n";
    authors = [ "The Rust Project Developers" ];
    sha256 = "1d02i2yaqpnmbgw42pf0hd56ddd9jr4zq5yypbmfvc8rs13x0jql";
    dependencies = mapFeatures features ([
      (crates."log"."${deps."env_logger"."0.6.1"."log"}" deps)
    ]
      ++ (if features.env_logger."0.6.1".atty or false then [ (crates.atty."${deps."env_logger"."0.6.1".atty}" deps) ] else [])
      ++ (if features.env_logger."0.6.1".humantime or false then [ (crates.humantime."${deps."env_logger"."0.6.1".humantime}" deps) ] else [])
      ++ (if features.env_logger."0.6.1".regex or false then [ (crates.regex."${deps."env_logger"."0.6.1".regex}" deps) ] else [])
      ++ (if features.env_logger."0.6.1".termcolor or false then [ (crates.termcolor."${deps."env_logger"."0.6.1".termcolor}" deps) ] else []));
    features = mkFeatures (features."env_logger"."0.6.1" or {});
  };
  features_.env_logger."0.6.1" = deps: f: updateFeatures f (rec {
    atty."${deps.env_logger."0.6.1".atty}".default = true;
    env_logger = fold recursiveUpdate {} [
      { "0.6.1"."atty" =
        (f.env_logger."0.6.1"."atty" or false) ||
        (f.env_logger."0.6.1".default or false) ||
        (env_logger."0.6.1"."default" or false); }
      { "0.6.1"."humantime" =
        (f.env_logger."0.6.1"."humantime" or false) ||
        (f.env_logger."0.6.1".default or false) ||
        (env_logger."0.6.1"."default" or false); }
      { "0.6.1"."regex" =
        (f.env_logger."0.6.1"."regex" or false) ||
        (f.env_logger."0.6.1".default or false) ||
        (env_logger."0.6.1"."default" or false); }
      { "0.6.1"."termcolor" =
        (f.env_logger."0.6.1"."termcolor" or false) ||
        (f.env_logger."0.6.1".default or false) ||
        (env_logger."0.6.1"."default" or false); }
      { "0.6.1".default = (f.env_logger."0.6.1".default or true); }
    ];
    humantime."${deps.env_logger."0.6.1".humantime}".default = true;
    log = fold recursiveUpdate {} [
      { "${deps.env_logger."0.6.1".log}"."std" = true; }
      { "${deps.env_logger."0.6.1".log}".default = true; }
    ];
    regex."${deps.env_logger."0.6.1".regex}".default = true;
    termcolor."${deps.env_logger."0.6.1".termcolor}".default = true;
  }) [
    (features_.atty."${deps."env_logger"."0.6.1"."atty"}" deps)
    (features_.humantime."${deps."env_logger"."0.6.1"."humantime"}" deps)
    (features_.log."${deps."env_logger"."0.6.1"."log"}" deps)
    (features_.regex."${deps."env_logger"."0.6.1"."regex"}" deps)
    (features_.termcolor."${deps."env_logger"."0.6.1"."termcolor"}" deps)
  ];


# end
# error-chain-0.8.1

  crates.error_chain."0.8.1" = deps: { features?(features_.error_chain."0.8.1" deps {}) }: buildRustCrate {
    crateName = "error-chain";
    version = "0.8.1";
    description = "Yet another error boilerplate library.";
    authors = [ "Brian Anderson <banderson@mozilla.com>" "Paul Colomiets <paul@colomiets.name>" "Colin Kiegel <kiegel@gmx.de>" "Yamakaky <yamakaky@yamaworld.fr>" ];
    sha256 = "0jaipqr2l2v84raynz3bvb0vnzysk7515j3mnb9i7g1qqprg2waq";
    dependencies = mapFeatures features ([
    ]
      ++ (if features.error_chain."0.8.1".backtrace or false then [ (crates.backtrace."${deps."error_chain"."0.8.1".backtrace}" deps) ] else []));
    features = mkFeatures (features."error_chain"."0.8.1" or {});
  };
  features_.error_chain."0.8.1" = deps: f: updateFeatures f (rec {
    backtrace."${deps.error_chain."0.8.1".backtrace}".default = true;
    error_chain = fold recursiveUpdate {} [
      { "0.8.1"."backtrace" =
        (f.error_chain."0.8.1"."backtrace" or false) ||
        (f.error_chain."0.8.1".default or false) ||
        (error_chain."0.8.1"."default" or false); }
      { "0.8.1"."example_generated" =
        (f.error_chain."0.8.1"."example_generated" or false) ||
        (f.error_chain."0.8.1".default or false) ||
        (error_chain."0.8.1"."default" or false); }
      { "0.8.1".default = (f.error_chain."0.8.1".default or true); }
    ];
  }) [
    (features_.backtrace."${deps."error_chain"."0.8.1"."backtrace"}" deps)
  ];


# end
# error-chain-0.12.0

  crates.error_chain."0.12.0" = deps: { features?(features_.error_chain."0.12.0" deps {}) }: buildRustCrate {
    crateName = "error-chain";
    version = "0.12.0";
    description = "Yet another error boilerplate library.";
    authors = [ "Brian Anderson <banderson@mozilla.com>" "Paul Colomiets <paul@colomiets.name>" "Colin Kiegel <kiegel@gmx.de>" "Yamakaky <yamakaky@yamaworld.fr>" ];
    sha256 = "1m6wk1r6wqg1mn69bxxvk5k081cb4xy6bfhsxb99rv408x9wjcnl";
    dependencies = mapFeatures features ([
    ]
      ++ (if features.error_chain."0.12.0".backtrace or false then [ (crates.backtrace."${deps."error_chain"."0.12.0".backtrace}" deps) ] else []));
    features = mkFeatures (features."error_chain"."0.12.0" or {});
  };
  features_.error_chain."0.12.0" = deps: f: updateFeatures f (rec {
    backtrace."${deps.error_chain."0.12.0".backtrace}".default = true;
    error_chain = fold recursiveUpdate {} [
      { "0.12.0"."backtrace" =
        (f.error_chain."0.12.0"."backtrace" or false) ||
        (f.error_chain."0.12.0".default or false) ||
        (error_chain."0.12.0"."default" or false); }
      { "0.12.0"."example_generated" =
        (f.error_chain."0.12.0"."example_generated" or false) ||
        (f.error_chain."0.12.0".default or false) ||
        (error_chain."0.12.0"."default" or false); }
      { "0.12.0".default = (f.error_chain."0.12.0".default or true); }
    ];
  }) [
    (features_.backtrace."${deps."error_chain"."0.12.0"."backtrace"}" deps)
  ];


# end
# failure-0.1.5

  crates.failure."0.1.5" = deps: { features?(features_.failure."0.1.5" deps {}) }: buildRustCrate {
    crateName = "failure";
    version = "0.1.5";
    description = "Experimental error handling abstraction.";
    authors = [ "Without Boats <boats@mozilla.com>" ];
    sha256 = "1msaj1c0fg12dzyf4fhxqlx1gfx41lj2smdjmkc9hkrgajk2g3kx";
    dependencies = mapFeatures features ([
    ]
      ++ (if features.failure."0.1.5".backtrace or false then [ (crates.backtrace."${deps."failure"."0.1.5".backtrace}" deps) ] else [])
      ++ (if features.failure."0.1.5".failure_derive or false then [ (crates.failure_derive."${deps."failure"."0.1.5".failure_derive}" deps) ] else []));
    features = mkFeatures (features."failure"."0.1.5" or {});
  };
  features_.failure."0.1.5" = deps: f: updateFeatures f (rec {
    backtrace."${deps.failure."0.1.5".backtrace}".default = true;
    failure = fold recursiveUpdate {} [
      { "0.1.5"."backtrace" =
        (f.failure."0.1.5"."backtrace" or false) ||
        (f.failure."0.1.5".std or false) ||
        (failure."0.1.5"."std" or false); }
      { "0.1.5"."derive" =
        (f.failure."0.1.5"."derive" or false) ||
        (f.failure."0.1.5".default or false) ||
        (failure."0.1.5"."default" or false); }
      { "0.1.5"."failure_derive" =
        (f.failure."0.1.5"."failure_derive" or false) ||
        (f.failure."0.1.5".derive or false) ||
        (failure."0.1.5"."derive" or false); }
      { "0.1.5"."std" =
        (f.failure."0.1.5"."std" or false) ||
        (f.failure."0.1.5".default or false) ||
        (failure."0.1.5"."default" or false); }
      { "0.1.5".default = (f.failure."0.1.5".default or true); }
    ];
    failure_derive."${deps.failure."0.1.5".failure_derive}".default = true;
  }) [
    (features_.backtrace."${deps."failure"."0.1.5"."backtrace"}" deps)
    (features_.failure_derive."${deps."failure"."0.1.5"."failure_derive"}" deps)
  ];


# end
# failure_derive-0.1.5

  crates.failure_derive."0.1.5" = deps: { features?(features_.failure_derive."0.1.5" deps {}) }: buildRustCrate {
    crateName = "failure_derive";
    version = "0.1.5";
    description = "derives for the failure crate";
    authors = [ "Without Boats <woboats@gmail.com>" ];
    sha256 = "1wzk484b87r4qszcvdl2bkniv5ls4r2f2dshz7hmgiv6z4ln12g0";
    procMacro = true;
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."proc_macro2"."${deps."failure_derive"."0.1.5"."proc_macro2"}" deps)
      (crates."quote"."${deps."failure_derive"."0.1.5"."quote"}" deps)
      (crates."syn"."${deps."failure_derive"."0.1.5"."syn"}" deps)
      (crates."synstructure"."${deps."failure_derive"."0.1.5"."synstructure"}" deps)
    ]);
    features = mkFeatures (features."failure_derive"."0.1.5" or {});
  };
  features_.failure_derive."0.1.5" = deps: f: updateFeatures f (rec {
    failure_derive."0.1.5".default = (f.failure_derive."0.1.5".default or true);
    proc_macro2."${deps.failure_derive."0.1.5".proc_macro2}".default = true;
    quote."${deps.failure_derive."0.1.5".quote}".default = true;
    syn."${deps.failure_derive."0.1.5".syn}".default = true;
    synstructure."${deps.failure_derive."0.1.5".synstructure}".default = true;
  }) [
    (features_.proc_macro2."${deps."failure_derive"."0.1.5"."proc_macro2"}" deps)
    (features_.quote."${deps."failure_derive"."0.1.5"."quote"}" deps)
    (features_.syn."${deps."failure_derive"."0.1.5"."syn"}" deps)
    (features_.synstructure."${deps."failure_derive"."0.1.5"."synstructure"}" deps)
  ];


# end
# flate2-1.0.7

  crates.flate2."1.0.7" = deps: { features?(features_.flate2."1.0.7" deps {}) }: buildRustCrate {
    crateName = "flate2";
    version = "1.0.7";
    description = "Bindings to miniz.c for DEFLATE compression and decompression exposed as\nReader/Writer streams. Contains bindings for zlib, deflate, and gzip-based\nstreams.\n";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "012vi948sap09hm1nmd228fqn7i5kp6wfb9zlz0m8ysq5if1s9mc";
    dependencies = mapFeatures features ([
      (crates."crc32fast"."${deps."flate2"."1.0.7"."crc32fast"}" deps)
      (crates."libc"."${deps."flate2"."1.0.7"."libc"}" deps)
    ]
      ++ (if features.flate2."1.0.7".miniz-sys or false then [ (crates.miniz_sys."${deps."flate2"."1.0.7".miniz_sys}" deps) ] else [])
      ++ (if features.flate2."1.0.7".miniz_oxide_c_api or false then [ (crates.miniz_oxide_c_api."${deps."flate2"."1.0.7".miniz_oxide_c_api}" deps) ] else []))
      ++ (if cpu == "wasm32" && !(kernel == "emscripten") then mapFeatures features ([
      (crates."miniz_oxide_c_api"."${deps."flate2"."1.0.7"."miniz_oxide_c_api"}" deps)
    ]) else []);
    features = mkFeatures (features."flate2"."1.0.7" or {});
  };
  features_.flate2."1.0.7" = deps: f: updateFeatures f (rec {
    crc32fast."${deps.flate2."1.0.7".crc32fast}".default = true;
    flate2 = fold recursiveUpdate {} [
      { "1.0.7"."futures" =
        (f.flate2."1.0.7"."futures" or false) ||
        (f.flate2."1.0.7".tokio or false) ||
        (flate2."1.0.7"."tokio" or false); }
      { "1.0.7"."libz-sys" =
        (f.flate2."1.0.7"."libz-sys" or false) ||
        (f.flate2."1.0.7".zlib or false) ||
        (flate2."1.0.7"."zlib" or false); }
      { "1.0.7"."miniz-sys" =
        (f.flate2."1.0.7"."miniz-sys" or false) ||
        (f.flate2."1.0.7".default or false) ||
        (flate2."1.0.7"."default" or false); }
      { "1.0.7"."miniz_oxide_c_api" =
        (f.flate2."1.0.7"."miniz_oxide_c_api" or false) ||
        (f.flate2."1.0.7".rust_backend or false) ||
        (flate2."1.0.7"."rust_backend" or false); }
      { "1.0.7"."tokio-io" =
        (f.flate2."1.0.7"."tokio-io" or false) ||
        (f.flate2."1.0.7".tokio or false) ||
        (flate2."1.0.7"."tokio" or false); }
      { "1.0.7".default = (f.flate2."1.0.7".default or true); }
    ];
    libc."${deps.flate2."1.0.7".libc}".default = true;
    miniz_oxide_c_api = fold recursiveUpdate {} [
      { "${deps.flate2."1.0.7".miniz_oxide_c_api}"."no_c_export" =
        (f.miniz_oxide_c_api."${deps.flate2."1.0.7".miniz_oxide_c_api}"."no_c_export" or false) ||
        true ||
        true; }
      { "${deps.flate2."1.0.7".miniz_oxide_c_api}".default = true; }
    ];
    miniz_sys."${deps.flate2."1.0.7".miniz_sys}".default = true;
  }) [
    (features_.crc32fast."${deps."flate2"."1.0.7"."crc32fast"}" deps)
    (features_.libc."${deps."flate2"."1.0.7"."libc"}" deps)
    (features_.miniz_sys."${deps."flate2"."1.0.7"."miniz_sys"}" deps)
    (features_.miniz_oxide_c_api."${deps."flate2"."1.0.7"."miniz_oxide_c_api"}" deps)
    (features_.miniz_oxide_c_api."${deps."flate2"."1.0.7"."miniz_oxide_c_api"}" deps)
  ];


# end
# fnv-1.0.6

  crates.fnv."1.0.6" = deps: { features?(features_.fnv."1.0.6" deps {}) }: buildRustCrate {
    crateName = "fnv";
    version = "1.0.6";
    description = "Fowler–Noll–Vo hash function";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "128mlh23y3gg6ag5h8iiqlcbl59smisdzraqy88ldrf75kbw27ip";
    libPath = "lib.rs";
  };
  features_.fnv."1.0.6" = deps: f: updateFeatures f (rec {
    fnv."1.0.6".default = (f.fnv."1.0.6".default or true);
  }) [];


# end
# foreign-types-0.3.2

  crates.foreign_types."0.3.2" = deps: { features?(features_.foreign_types."0.3.2" deps {}) }: buildRustCrate {
    crateName = "foreign-types";
    version = "0.3.2";
    description = "A framework for Rust wrappers over C APIs";
    authors = [ "Steven Fackler <sfackler@gmail.com>" ];
    sha256 = "105n8sp2djb1s5lzrw04p7ss3dchr5qa3canmynx396nh3vwm2p8";
    dependencies = mapFeatures features ([
      (crates."foreign_types_shared"."${deps."foreign_types"."0.3.2"."foreign_types_shared"}" deps)
    ]);
  };
  features_.foreign_types."0.3.2" = deps: f: updateFeatures f (rec {
    foreign_types."0.3.2".default = (f.foreign_types."0.3.2".default or true);
    foreign_types_shared."${deps.foreign_types."0.3.2".foreign_types_shared}".default = true;
  }) [
    (features_.foreign_types_shared."${deps."foreign_types"."0.3.2"."foreign_types_shared"}" deps)
  ];


# end
# foreign-types-shared-0.1.1

  crates.foreign_types_shared."0.1.1" = deps: { features?(features_.foreign_types_shared."0.1.1" deps {}) }: buildRustCrate {
    crateName = "foreign-types-shared";
    version = "0.1.1";
    description = "An internal crate used by foreign-types";
    authors = [ "Steven Fackler <sfackler@gmail.com>" ];
    sha256 = "0b6cnvqbflws8dxywk4589vgbz80049lz4x1g9dfy4s1ppd3g4z5";
  };
  features_.foreign_types_shared."0.1.1" = deps: f: updateFeatures f (rec {
    foreign_types_shared."0.1.1".default = (f.foreign_types_shared."0.1.1".default or true);
  }) [];


# end
# fuchsia-cprng-0.1.1

  crates.fuchsia_cprng."0.1.1" = deps: { features?(features_.fuchsia_cprng."0.1.1" deps {}) }: buildRustCrate {
    crateName = "fuchsia-cprng";
    version = "0.1.1";
    description = "Rust crate for the Fuchsia cryptographically secure pseudorandom number generator";
    authors = [ "Erick Tryzelaar <etryzelaar@google.com>" ];
    edition = "2018";
    sha256 = "07apwv9dj716yjlcj29p94vkqn5zmfh7hlrqvrjx3wzshphc95h9";
  };
  features_.fuchsia_cprng."0.1.1" = deps: f: updateFeatures f (rec {
    fuchsia_cprng."0.1.1".default = (f.fuchsia_cprng."0.1.1".default or true);
  }) [];


# end
# fuchsia-zircon-0.3.3

  crates.fuchsia_zircon."0.3.3" = deps: { features?(features_.fuchsia_zircon."0.3.3" deps {}) }: buildRustCrate {
    crateName = "fuchsia-zircon";
    version = "0.3.3";
    description = "Rust bindings for the Zircon kernel";
    authors = [ "Raph Levien <raph@google.com>" ];
    sha256 = "0jrf4shb1699r4la8z358vri8318w4mdi6qzfqy30p2ymjlca4gk";
    dependencies = mapFeatures features ([
      (crates."bitflags"."${deps."fuchsia_zircon"."0.3.3"."bitflags"}" deps)
      (crates."fuchsia_zircon_sys"."${deps."fuchsia_zircon"."0.3.3"."fuchsia_zircon_sys"}" deps)
    ]);
  };
  features_.fuchsia_zircon."0.3.3" = deps: f: updateFeatures f (rec {
    bitflags."${deps.fuchsia_zircon."0.3.3".bitflags}".default = true;
    fuchsia_zircon."0.3.3".default = (f.fuchsia_zircon."0.3.3".default or true);
    fuchsia_zircon_sys."${deps.fuchsia_zircon."0.3.3".fuchsia_zircon_sys}".default = true;
  }) [
    (features_.bitflags."${deps."fuchsia_zircon"."0.3.3"."bitflags"}" deps)
    (features_.fuchsia_zircon_sys."${deps."fuchsia_zircon"."0.3.3"."fuchsia_zircon_sys"}" deps)
  ];


# end
# fuchsia-zircon-sys-0.3.3

  crates.fuchsia_zircon_sys."0.3.3" = deps: { features?(features_.fuchsia_zircon_sys."0.3.3" deps {}) }: buildRustCrate {
    crateName = "fuchsia-zircon-sys";
    version = "0.3.3";
    description = "Low-level Rust bindings for the Zircon kernel";
    authors = [ "Raph Levien <raph@google.com>" ];
    sha256 = "08jp1zxrm9jbrr6l26bjal4dbm8bxfy57ickdgibsqxr1n9j3hf5";
  };
  features_.fuchsia_zircon_sys."0.3.3" = deps: f: updateFeatures f (rec {
    fuchsia_zircon_sys."0.3.3".default = (f.fuchsia_zircon_sys."0.3.3".default or true);
  }) [];


# end
# futures-0.1.26

  crates.futures."0.1.26" = deps: { features?(features_.futures."0.1.26" deps {}) }: buildRustCrate {
    crateName = "futures";
    version = "0.1.26";
    description = "An implementation of futures and streams featuring zero allocations,\ncomposability, and iterator-like interfaces.\n";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "0b2v05xp3pq0idw743824ilgl9mfn6bf0sf9zm98g07zz4hqzpzs";
    features = mkFeatures (features."futures"."0.1.26" or {});
  };
  features_.futures."0.1.26" = deps: f: updateFeatures f (rec {
    futures = fold recursiveUpdate {} [
      { "0.1.26"."use_std" =
        (f.futures."0.1.26"."use_std" or false) ||
        (f.futures."0.1.26".default or false) ||
        (futures."0.1.26"."default" or false); }
      { "0.1.26"."with-deprecated" =
        (f.futures."0.1.26"."with-deprecated" or false) ||
        (f.futures."0.1.26".default or false) ||
        (futures."0.1.26"."default" or false); }
      { "0.1.26".default = (f.futures."0.1.26".default or true); }
    ];
  }) [];


# end
# futures-cpupool-0.1.8

  crates.futures_cpupool."0.1.8" = deps: { features?(features_.futures_cpupool."0.1.8" deps {}) }: buildRustCrate {
    crateName = "futures-cpupool";
    version = "0.1.8";
    description = "An implementation of thread pools which hand out futures to the results of the\ncomputation on the threads themselves.\n";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "0ficd31n5ljiixy6x0vjglhq4fp0v1p4qzxm3v6ymsrb3z080l5c";
    dependencies = mapFeatures features ([
      (crates."futures"."${deps."futures_cpupool"."0.1.8"."futures"}" deps)
      (crates."num_cpus"."${deps."futures_cpupool"."0.1.8"."num_cpus"}" deps)
    ]);
    features = mkFeatures (features."futures_cpupool"."0.1.8" or {});
  };
  features_.futures_cpupool."0.1.8" = deps: f: updateFeatures f (rec {
    futures = fold recursiveUpdate {} [
      { "${deps.futures_cpupool."0.1.8".futures}"."use_std" = true; }
      { "${deps.futures_cpupool."0.1.8".futures}"."with-deprecated" =
        (f.futures."${deps.futures_cpupool."0.1.8".futures}"."with-deprecated" or false) ||
        (futures_cpupool."0.1.8"."with-deprecated" or false) ||
        (f."futures_cpupool"."0.1.8"."with-deprecated" or false); }
      { "${deps.futures_cpupool."0.1.8".futures}".default = (f.futures."${deps.futures_cpupool."0.1.8".futures}".default or false); }
    ];
    futures_cpupool = fold recursiveUpdate {} [
      { "0.1.8"."with-deprecated" =
        (f.futures_cpupool."0.1.8"."with-deprecated" or false) ||
        (f.futures_cpupool."0.1.8".default or false) ||
        (futures_cpupool."0.1.8"."default" or false); }
      { "0.1.8".default = (f.futures_cpupool."0.1.8".default or true); }
    ];
    num_cpus."${deps.futures_cpupool."0.1.8".num_cpus}".default = true;
  }) [
    (features_.futures."${deps."futures_cpupool"."0.1.8"."futures"}" deps)
    (features_.num_cpus."${deps."futures_cpupool"."0.1.8"."num_cpus"}" deps)
  ];


# end
# glob-0.2.11

  crates.glob."0.2.11" = deps: { features?(features_.glob."0.2.11" deps {}) }: buildRustCrate {
    crateName = "glob";
    version = "0.2.11";
    description = "Support for matching file paths against Unix shell style patterns.\n";
    authors = [ "The Rust Project Developers" ];
    sha256 = "104389jjxs8r2f5cc9p0axhjmndgln60ih5x4f00ccgg9d3zarlf";
  };
  features_.glob."0.2.11" = deps: f: updateFeatures f (rec {
    glob."0.2.11".default = (f.glob."0.2.11".default or true);
  }) [];


# end
# h2-0.1.18

  crates.h2."0.1.18" = deps: { features?(features_.h2."0.1.18" deps {}) }: buildRustCrate {
    crateName = "h2";
    version = "0.1.18";
    description = "An HTTP/2.0 client and server";
    authors = [ "Carl Lerche <me@carllerche.com>" ];
    sha256 = "1i8hwjwmvlh0qblpl6fgbp47fjklwzji3j205y91x4fbvx62k8il";
    dependencies = mapFeatures features ([
      (crates."byteorder"."${deps."h2"."0.1.18"."byteorder"}" deps)
      (crates."bytes"."${deps."h2"."0.1.18"."bytes"}" deps)
      (crates."fnv"."${deps."h2"."0.1.18"."fnv"}" deps)
      (crates."futures"."${deps."h2"."0.1.18"."futures"}" deps)
      (crates."http"."${deps."h2"."0.1.18"."http"}" deps)
      (crates."indexmap"."${deps."h2"."0.1.18"."indexmap"}" deps)
      (crates."log"."${deps."h2"."0.1.18"."log"}" deps)
      (crates."slab"."${deps."h2"."0.1.18"."slab"}" deps)
      (crates."string"."${deps."h2"."0.1.18"."string"}" deps)
      (crates."tokio_io"."${deps."h2"."0.1.18"."tokio_io"}" deps)
    ]);
    features = mkFeatures (features."h2"."0.1.18" or {});
  };
  features_.h2."0.1.18" = deps: f: updateFeatures f (rec {
    byteorder."${deps.h2."0.1.18".byteorder}".default = true;
    bytes."${deps.h2."0.1.18".bytes}".default = true;
    fnv."${deps.h2."0.1.18".fnv}".default = true;
    futures."${deps.h2."0.1.18".futures}".default = true;
    h2."0.1.18".default = (f.h2."0.1.18".default or true);
    http."${deps.h2."0.1.18".http}".default = true;
    indexmap."${deps.h2."0.1.18".indexmap}".default = true;
    log."${deps.h2."0.1.18".log}".default = true;
    slab."${deps.h2."0.1.18".slab}".default = true;
    string."${deps.h2."0.1.18".string}".default = true;
    tokio_io."${deps.h2."0.1.18".tokio_io}".default = true;
  }) [
    (features_.byteorder."${deps."h2"."0.1.18"."byteorder"}" deps)
    (features_.bytes."${deps."h2"."0.1.18"."bytes"}" deps)
    (features_.fnv."${deps."h2"."0.1.18"."fnv"}" deps)
    (features_.futures."${deps."h2"."0.1.18"."futures"}" deps)
    (features_.http."${deps."h2"."0.1.18"."http"}" deps)
    (features_.indexmap."${deps."h2"."0.1.18"."indexmap"}" deps)
    (features_.log."${deps."h2"."0.1.18"."log"}" deps)
    (features_.slab."${deps."h2"."0.1.18"."slab"}" deps)
    (features_.string."${deps."h2"."0.1.18"."string"}" deps)
    (features_.tokio_io."${deps."h2"."0.1.18"."tokio_io"}" deps)
  ];


# end
# hostname-0.1.5

  crates.hostname."0.1.5" = deps: { features?(features_.hostname."0.1.5" deps {}) }: buildRustCrate {
    crateName = "hostname";
    version = "0.1.5";
    description = "Get hostname. Compatible with windows and linux, redox.";
    authors = [ "fengcen <fengcen.love@gmail.com>" ];
    sha256 = "1383lcnzmiqm0bz0i0h33rvbl5ma125ca5lfnx4qzx1dzdz0wl2a";
    libPath = "src/lib.rs";
    dependencies = (if (kernel == "linux" || kernel == "darwin") || kernel == "redox" then mapFeatures features ([
      (crates."libc"."${deps."hostname"."0.1.5"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winutil"."${deps."hostname"."0.1.5"."winutil"}" deps)
    ]) else []);
    features = mkFeatures (features."hostname"."0.1.5" or {});
  };
  features_.hostname."0.1.5" = deps: f: updateFeatures f (rec {
    hostname."0.1.5".default = (f.hostname."0.1.5".default or true);
    libc."${deps.hostname."0.1.5".libc}".default = true;
    winutil."${deps.hostname."0.1.5".winutil}".default = true;
  }) [
    (features_.libc."${deps."hostname"."0.1.5"."libc"}" deps)
    (features_.winutil."${deps."hostname"."0.1.5"."winutil"}" deps)
  ];


# end
# http-0.1.17

  crates.http."0.1.17" = deps: { features?(features_.http."0.1.17" deps {}) }: buildRustCrate {
    crateName = "http";
    version = "0.1.17";
    description = "A set of types for representing HTTP requests and responses.\n";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" "Carl Lerche <me@carllerche.com>" "Sean McArthur <sean@seanmonstar.com>" ];
    sha256 = "0q71wgggg1h5kjyg1gb4m70g3ian9qwrkx2b9wwvfyafrkmjpg9c";
    dependencies = mapFeatures features ([
      (crates."bytes"."${deps."http"."0.1.17"."bytes"}" deps)
      (crates."fnv"."${deps."http"."0.1.17"."fnv"}" deps)
      (crates."itoa"."${deps."http"."0.1.17"."itoa"}" deps)
    ]);
  };
  features_.http."0.1.17" = deps: f: updateFeatures f (rec {
    bytes."${deps.http."0.1.17".bytes}".default = true;
    fnv."${deps.http."0.1.17".fnv}".default = true;
    http."0.1.17".default = (f.http."0.1.17".default or true);
    itoa."${deps.http."0.1.17".itoa}".default = true;
  }) [
    (features_.bytes."${deps."http"."0.1.17"."bytes"}" deps)
    (features_.fnv."${deps."http"."0.1.17"."fnv"}" deps)
    (features_.itoa."${deps."http"."0.1.17"."itoa"}" deps)
  ];


# end
# httparse-1.3.3

  crates.httparse."1.3.3" = deps: { features?(features_.httparse."1.3.3" deps {}) }: buildRustCrate {
    crateName = "httparse";
    version = "1.3.3";
    description = "A tiny, safe, speedy, zero-copy HTTP/1.x parser.";
    authors = [ "Sean McArthur <sean@seanmonstar.com>" ];
    sha256 = "1jymxy4bl0mzgp2dx0pzqzbr72sw5jmr5sjqiry4xr88z4z9qlyx";
    build = "build.rs";
    features = mkFeatures (features."httparse"."1.3.3" or {});
  };
  features_.httparse."1.3.3" = deps: f: updateFeatures f (rec {
    httparse = fold recursiveUpdate {} [
      { "1.3.3"."std" =
        (f.httparse."1.3.3"."std" or false) ||
        (f.httparse."1.3.3".default or false) ||
        (httparse."1.3.3"."default" or false); }
      { "1.3.3".default = (f.httparse."1.3.3".default or true); }
    ];
  }) [];


# end
# humantime-1.2.0

  crates.humantime."1.2.0" = deps: { features?(features_.humantime."1.2.0" deps {}) }: buildRustCrate {
    crateName = "humantime";
    version = "1.2.0";
    description = "    A parser and formatter for std::time::{Duration, SystemTime}\n";
    authors = [ "Paul Colomiets <paul@colomiets.name>" ];
    sha256 = "0wlcxzz2mhq0brkfbjb12hc6jm17bgm8m6pdgblw4qjwmf26aw28";
    libPath = "src/lib.rs";
    dependencies = mapFeatures features ([
      (crates."quick_error"."${deps."humantime"."1.2.0"."quick_error"}" deps)
    ]);
  };
  features_.humantime."1.2.0" = deps: f: updateFeatures f (rec {
    humantime."1.2.0".default = (f.humantime."1.2.0".default or true);
    quick_error."${deps.humantime."1.2.0".quick_error}".default = true;
  }) [
    (features_.quick_error."${deps."humantime"."1.2.0"."quick_error"}" deps)
  ];


# end
# hyper-0.12.28

  crates.hyper."0.12.28" = deps: { features?(features_.hyper."0.12.28" deps {}) }: buildRustCrate {
    crateName = "hyper";
    version = "0.12.28";
    description = "A fast and correct HTTP library.";
    authors = [ "Sean McArthur <sean@seanmonstar.com>" ];
    sha256 = "0kzk4mgwxjxxz8g2ihlr6zqd1xyyxw3r8qqwza15jkymdaxl3b58";
    dependencies = mapFeatures features ([
      (crates."bytes"."${deps."hyper"."0.12.28"."bytes"}" deps)
      (crates."futures"."${deps."hyper"."0.12.28"."futures"}" deps)
      (crates."h2"."${deps."hyper"."0.12.28"."h2"}" deps)
      (crates."http"."${deps."hyper"."0.12.28"."http"}" deps)
      (crates."httparse"."${deps."hyper"."0.12.28"."httparse"}" deps)
      (crates."iovec"."${deps."hyper"."0.12.28"."iovec"}" deps)
      (crates."itoa"."${deps."hyper"."0.12.28"."itoa"}" deps)
      (crates."log"."${deps."hyper"."0.12.28"."log"}" deps)
      (crates."time"."${deps."hyper"."0.12.28"."time"}" deps)
      (crates."tokio_io"."${deps."hyper"."0.12.28"."tokio_io"}" deps)
      (crates."want"."${deps."hyper"."0.12.28"."want"}" deps)
    ]
      ++ (if features.hyper."0.12.28".futures-cpupool or false then [ (crates.futures_cpupool."${deps."hyper"."0.12.28".futures_cpupool}" deps) ] else [])
      ++ (if features.hyper."0.12.28".net2 or false then [ (crates.net2."${deps."hyper"."0.12.28".net2}" deps) ] else [])
      ++ (if features.hyper."0.12.28".tokio or false then [ (crates.tokio."${deps."hyper"."0.12.28".tokio}" deps) ] else [])
      ++ (if features.hyper."0.12.28".tokio-executor or false then [ (crates.tokio_executor."${deps."hyper"."0.12.28".tokio_executor}" deps) ] else [])
      ++ (if features.hyper."0.12.28".tokio-reactor or false then [ (crates.tokio_reactor."${deps."hyper"."0.12.28".tokio_reactor}" deps) ] else [])
      ++ (if features.hyper."0.12.28".tokio-tcp or false then [ (crates.tokio_tcp."${deps."hyper"."0.12.28".tokio_tcp}" deps) ] else [])
      ++ (if features.hyper."0.12.28".tokio-threadpool or false then [ (crates.tokio_threadpool."${deps."hyper"."0.12.28".tokio_threadpool}" deps) ] else [])
      ++ (if features.hyper."0.12.28".tokio-timer or false then [ (crates.tokio_timer."${deps."hyper"."0.12.28".tokio_timer}" deps) ] else []));

    buildDependencies = mapFeatures features ([
      (crates."rustc_version"."${deps."hyper"."0.12.28"."rustc_version"}" deps)
    ]);
    features = mkFeatures (features."hyper"."0.12.28" or {});
  };
  features_.hyper."0.12.28" = deps: f: updateFeatures f (rec {
    bytes."${deps.hyper."0.12.28".bytes}".default = true;
    futures."${deps.hyper."0.12.28".futures}".default = true;
    futures_cpupool."${deps.hyper."0.12.28".futures_cpupool}".default = true;
    h2."${deps.hyper."0.12.28".h2}".default = true;
    http."${deps.hyper."0.12.28".http}".default = true;
    httparse."${deps.hyper."0.12.28".httparse}".default = true;
    hyper = fold recursiveUpdate {} [
      { "0.12.28"."__internal_flaky_tests" =
        (f.hyper."0.12.28"."__internal_flaky_tests" or false) ||
        (f.hyper."0.12.28".default or false) ||
        (hyper."0.12.28"."default" or false); }
      { "0.12.28"."futures-cpupool" =
        (f.hyper."0.12.28"."futures-cpupool" or false) ||
        (f.hyper."0.12.28".runtime or false) ||
        (hyper."0.12.28"."runtime" or false); }
      { "0.12.28"."net2" =
        (f.hyper."0.12.28"."net2" or false) ||
        (f.hyper."0.12.28".runtime or false) ||
        (hyper."0.12.28"."runtime" or false); }
      { "0.12.28"."runtime" =
        (f.hyper."0.12.28"."runtime" or false) ||
        (f.hyper."0.12.28".default or false) ||
        (hyper."0.12.28"."default" or false); }
      { "0.12.28"."tokio" =
        (f.hyper."0.12.28"."tokio" or false) ||
        (f.hyper."0.12.28".runtime or false) ||
        (hyper."0.12.28"."runtime" or false); }
      { "0.12.28"."tokio-executor" =
        (f.hyper."0.12.28"."tokio-executor" or false) ||
        (f.hyper."0.12.28".runtime or false) ||
        (hyper."0.12.28"."runtime" or false); }
      { "0.12.28"."tokio-reactor" =
        (f.hyper."0.12.28"."tokio-reactor" or false) ||
        (f.hyper."0.12.28".runtime or false) ||
        (hyper."0.12.28"."runtime" or false); }
      { "0.12.28"."tokio-tcp" =
        (f.hyper."0.12.28"."tokio-tcp" or false) ||
        (f.hyper."0.12.28".runtime or false) ||
        (hyper."0.12.28"."runtime" or false); }
      { "0.12.28"."tokio-threadpool" =
        (f.hyper."0.12.28"."tokio-threadpool" or false) ||
        (f.hyper."0.12.28".runtime or false) ||
        (hyper."0.12.28"."runtime" or false); }
      { "0.12.28"."tokio-timer" =
        (f.hyper."0.12.28"."tokio-timer" or false) ||
        (f.hyper."0.12.28".runtime or false) ||
        (hyper."0.12.28"."runtime" or false); }
      { "0.12.28".default = (f.hyper."0.12.28".default or true); }
    ];
    iovec."${deps.hyper."0.12.28".iovec}".default = true;
    itoa."${deps.hyper."0.12.28".itoa}".default = true;
    log."${deps.hyper."0.12.28".log}".default = true;
    net2."${deps.hyper."0.12.28".net2}".default = true;
    rustc_version."${deps.hyper."0.12.28".rustc_version}".default = true;
    time."${deps.hyper."0.12.28".time}".default = true;
    tokio = fold recursiveUpdate {} [
      { "${deps.hyper."0.12.28".tokio}"."rt-full" = true; }
      { "${deps.hyper."0.12.28".tokio}".default = (f.tokio."${deps.hyper."0.12.28".tokio}".default or false); }
    ];
    tokio_executor."${deps.hyper."0.12.28".tokio_executor}".default = true;
    tokio_io."${deps.hyper."0.12.28".tokio_io}".default = true;
    tokio_reactor."${deps.hyper."0.12.28".tokio_reactor}".default = true;
    tokio_tcp."${deps.hyper."0.12.28".tokio_tcp}".default = true;
    tokio_threadpool."${deps.hyper."0.12.28".tokio_threadpool}".default = true;
    tokio_timer."${deps.hyper."0.12.28".tokio_timer}".default = true;
    want."${deps.hyper."0.12.28".want}".default = true;
  }) [
    (features_.bytes."${deps."hyper"."0.12.28"."bytes"}" deps)
    (features_.futures."${deps."hyper"."0.12.28"."futures"}" deps)
    (features_.futures_cpupool."${deps."hyper"."0.12.28"."futures_cpupool"}" deps)
    (features_.h2."${deps."hyper"."0.12.28"."h2"}" deps)
    (features_.http."${deps."hyper"."0.12.28"."http"}" deps)
    (features_.httparse."${deps."hyper"."0.12.28"."httparse"}" deps)
    (features_.iovec."${deps."hyper"."0.12.28"."iovec"}" deps)
    (features_.itoa."${deps."hyper"."0.12.28"."itoa"}" deps)
    (features_.log."${deps."hyper"."0.12.28"."log"}" deps)
    (features_.net2."${deps."hyper"."0.12.28"."net2"}" deps)
    (features_.time."${deps."hyper"."0.12.28"."time"}" deps)
    (features_.tokio."${deps."hyper"."0.12.28"."tokio"}" deps)
    (features_.tokio_executor."${deps."hyper"."0.12.28"."tokio_executor"}" deps)
    (features_.tokio_io."${deps."hyper"."0.12.28"."tokio_io"}" deps)
    (features_.tokio_reactor."${deps."hyper"."0.12.28"."tokio_reactor"}" deps)
    (features_.tokio_tcp."${deps."hyper"."0.12.28"."tokio_tcp"}" deps)
    (features_.tokio_threadpool."${deps."hyper"."0.12.28"."tokio_threadpool"}" deps)
    (features_.tokio_timer."${deps."hyper"."0.12.28"."tokio_timer"}" deps)
    (features_.want."${deps."hyper"."0.12.28"."want"}" deps)
    (features_.rustc_version."${deps."hyper"."0.12.28"."rustc_version"}" deps)
  ];


# end
# hyper-tls-0.3.2

  crates.hyper_tls."0.3.2" = deps: { features?(features_.hyper_tls."0.3.2" deps {}) }: buildRustCrate {
    crateName = "hyper-tls";
    version = "0.3.2";
    description = "Default TLS implementation for use with hyper";
    authors = [ "Sean McArthur <sean@seanmonstar.com>" ];
    sha256 = "01naqv4zxfj3vzwa5m56vh6l8kg8y8wp8qgc1pm883vsrawa7anx";
    dependencies = mapFeatures features ([
      (crates."bytes"."${deps."hyper_tls"."0.3.2"."bytes"}" deps)
      (crates."futures"."${deps."hyper_tls"."0.3.2"."futures"}" deps)
      (crates."hyper"."${deps."hyper_tls"."0.3.2"."hyper"}" deps)
      (crates."native_tls"."${deps."hyper_tls"."0.3.2"."native_tls"}" deps)
      (crates."tokio_io"."${deps."hyper_tls"."0.3.2"."tokio_io"}" deps)
    ]);
    features = mkFeatures (features."hyper_tls"."0.3.2" or {});
  };
  features_.hyper_tls."0.3.2" = deps: f: updateFeatures f (rec {
    bytes."${deps.hyper_tls."0.3.2".bytes}".default = true;
    futures."${deps.hyper_tls."0.3.2".futures}".default = true;
    hyper."${deps.hyper_tls."0.3.2".hyper}".default = true;
    hyper_tls."0.3.2".default = (f.hyper_tls."0.3.2".default or true);
    native_tls = fold recursiveUpdate {} [
      { "${deps.hyper_tls."0.3.2".native_tls}"."vendored" =
        (f.native_tls."${deps.hyper_tls."0.3.2".native_tls}"."vendored" or false) ||
        (hyper_tls."0.3.2"."vendored" or false) ||
        (f."hyper_tls"."0.3.2"."vendored" or false); }
      { "${deps.hyper_tls."0.3.2".native_tls}".default = true; }
    ];
    tokio_io."${deps.hyper_tls."0.3.2".tokio_io}".default = true;
  }) [
    (features_.bytes."${deps."hyper_tls"."0.3.2"."bytes"}" deps)
    (features_.futures."${deps."hyper_tls"."0.3.2"."futures"}" deps)
    (features_.hyper."${deps."hyper_tls"."0.3.2"."hyper"}" deps)
    (features_.native_tls."${deps."hyper_tls"."0.3.2"."native_tls"}" deps)
    (features_.tokio_io."${deps."hyper_tls"."0.3.2"."tokio_io"}" deps)
  ];


# end
# idna-0.1.5

  crates.idna."0.1.5" = deps: { features?(features_.idna."0.1.5" deps {}) }: buildRustCrate {
    crateName = "idna";
    version = "0.1.5";
    description = "IDNA (Internationalizing Domain Names in Applications) and Punycode.";
    authors = [ "The rust-url developers" ];
    sha256 = "1gwgl19rz5vzi67rrhamczhxy050f5ynx4ybabfapyalv7z1qmjy";
    dependencies = mapFeatures features ([
      (crates."matches"."${deps."idna"."0.1.5"."matches"}" deps)
      (crates."unicode_bidi"."${deps."idna"."0.1.5"."unicode_bidi"}" deps)
      (crates."unicode_normalization"."${deps."idna"."0.1.5"."unicode_normalization"}" deps)
    ]);
  };
  features_.idna."0.1.5" = deps: f: updateFeatures f (rec {
    idna."0.1.5".default = (f.idna."0.1.5".default or true);
    matches."${deps.idna."0.1.5".matches}".default = true;
    unicode_bidi."${deps.idna."0.1.5".unicode_bidi}".default = true;
    unicode_normalization."${deps.idna."0.1.5".unicode_normalization}".default = true;
  }) [
    (features_.matches."${deps."idna"."0.1.5"."matches"}" deps)
    (features_.unicode_bidi."${deps."idna"."0.1.5"."unicode_bidi"}" deps)
    (features_.unicode_normalization."${deps."idna"."0.1.5"."unicode_normalization"}" deps)
  ];


# end
# indexmap-1.0.2

  crates.indexmap."1.0.2" = deps: { features?(features_.indexmap."1.0.2" deps {}) }: buildRustCrate {
    crateName = "indexmap";
    version = "1.0.2";
    description = "A hash table with consistent order and fast iteration.\n\nThe indexmap is a hash table where the iteration order of the key-value\npairs is independent of the hash values of the keys. It has the usual\nhash table functionality, it preserves insertion order except after\nremovals, and it allows lookup of its elements by either hash table key\nor numerical index. A corresponding hash set type is also provided.\n\nThis crate was initially published under the name ordermap, but it was renamed to\nindexmap.\n";
    authors = [ "bluss" "Josh Stone <cuviper@gmail.com>" ];
    sha256 = "18a0cn5xy3a7wswxg5lwfg3j4sh5blk28ykw0ysgr486djd353gf";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."indexmap"."1.0.2" or {});
  };
  features_.indexmap."1.0.2" = deps: f: updateFeatures f (rec {
    indexmap = fold recursiveUpdate {} [
      { "1.0.2"."serde" =
        (f.indexmap."1.0.2"."serde" or false) ||
        (f.indexmap."1.0.2".serde-1 or false) ||
        (indexmap."1.0.2"."serde-1" or false); }
      { "1.0.2".default = (f.indexmap."1.0.2".default or true); }
    ];
  }) [];


# end
# iovec-0.1.2

  crates.iovec."0.1.2" = deps: { features?(features_.iovec."0.1.2" deps {}) }: buildRustCrate {
    crateName = "iovec";
    version = "0.1.2";
    description = "Portable buffer type for scatter/gather I/O operations\n";
    authors = [ "Carl Lerche <me@carllerche.com>" ];
    sha256 = "0vjymmb7wj4v4kza5jjn48fcdb85j3k37y7msjl3ifz0p9yiyp2r";
    dependencies = (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."iovec"."0.1.2"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."iovec"."0.1.2"."winapi"}" deps)
    ]) else []);
  };
  features_.iovec."0.1.2" = deps: f: updateFeatures f (rec {
    iovec."0.1.2".default = (f.iovec."0.1.2".default or true);
    libc."${deps.iovec."0.1.2".libc}".default = true;
    winapi."${deps.iovec."0.1.2".winapi}".default = true;
  }) [
    (features_.libc."${deps."iovec"."0.1.2"."libc"}" deps)
    (features_.winapi."${deps."iovec"."0.1.2"."winapi"}" deps)
  ];


# end
# ipconfig-0.1.9

  crates.ipconfig."0.1.9" = deps: { features?(features_.ipconfig."0.1.9" deps {}) }: buildRustCrate {
    crateName = "ipconfig";
    version = "0.1.9";
    description = "Get network adapters information and network configuration for windows.";
    authors = [ "Liran Ringel <liranringel@gmail.com>" ];
    sha256 = "12840nghfh3fzg3h272rq7ci267x0141nnn4yi6q4h81m41c7xmv";
    dependencies = (if kernel == "windows" then mapFeatures features ([
      (crates."error_chain"."${deps."ipconfig"."0.1.9"."error_chain"}" deps)
      (crates."socket2"."${deps."ipconfig"."0.1.9"."socket2"}" deps)
      (crates."widestring"."${deps."ipconfig"."0.1.9"."widestring"}" deps)
      (crates."winapi"."${deps."ipconfig"."0.1.9"."winapi"}" deps)
      (crates."winreg"."${deps."ipconfig"."0.1.9"."winreg"}" deps)
    ]) else []);
  };
  features_.ipconfig."0.1.9" = deps: f: updateFeatures f (rec {
    error_chain."${deps.ipconfig."0.1.9".error_chain}".default = true;
    ipconfig."0.1.9".default = (f.ipconfig."0.1.9".default or true);
    socket2."${deps.ipconfig."0.1.9".socket2}".default = true;
    widestring."${deps.ipconfig."0.1.9".widestring}".default = true;
    winapi."${deps.ipconfig."0.1.9".winapi}".default = true;
    winreg."${deps.ipconfig."0.1.9".winreg}".default = true;
  }) [
    (features_.error_chain."${deps."ipconfig"."0.1.9"."error_chain"}" deps)
    (features_.socket2."${deps."ipconfig"."0.1.9"."socket2"}" deps)
    (features_.widestring."${deps."ipconfig"."0.1.9"."widestring"}" deps)
    (features_.winapi."${deps."ipconfig"."0.1.9"."winapi"}" deps)
    (features_.winreg."${deps."ipconfig"."0.1.9"."winreg"}" deps)
  ];


# end
# itoa-0.4.4

  crates.itoa."0.4.4" = deps: { features?(features_.itoa."0.4.4" deps {}) }: buildRustCrate {
    crateName = "itoa";
    version = "0.4.4";
    description = "Fast functions for printing integer primitives to an io::Write";
    authors = [ "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "1fqc34xzzl2spfdawxd9awhzl0fwf1y6y4i94l8bq8rfrzd90awl";
    features = mkFeatures (features."itoa"."0.4.4" or {});
  };
  features_.itoa."0.4.4" = deps: f: updateFeatures f (rec {
    itoa = fold recursiveUpdate {} [
      { "0.4.4"."std" =
        (f.itoa."0.4.4"."std" or false) ||
        (f.itoa."0.4.4".default or false) ||
        (itoa."0.4.4"."default" or false); }
      { "0.4.4".default = (f.itoa."0.4.4".default or true); }
    ];
  }) [];


# end
# kernel32-sys-0.2.2

  crates.kernel32_sys."0.2.2" = deps: { features?(features_.kernel32_sys."0.2.2" deps {}) }: buildRustCrate {
    crateName = "kernel32-sys";
    version = "0.2.2";
    description = "Contains function definitions for the Windows API library kernel32. See winapi for types and constants.";
    authors = [ "Peter Atashian <retep998@gmail.com>" ];
    sha256 = "1lrw1hbinyvr6cp28g60z97w32w8vsk6pahk64pmrv2fmby8srfj";
    libName = "kernel32";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."winapi"."${deps."kernel32_sys"."0.2.2"."winapi"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."winapi_build"."${deps."kernel32_sys"."0.2.2"."winapi_build"}" deps)
    ]);
  };
  features_.kernel32_sys."0.2.2" = deps: f: updateFeatures f (rec {
    kernel32_sys."0.2.2".default = (f.kernel32_sys."0.2.2".default or true);
    winapi."${deps.kernel32_sys."0.2.2".winapi}".default = true;
    winapi_build."${deps.kernel32_sys."0.2.2".winapi_build}".default = true;
  }) [
    (features_.winapi."${deps."kernel32_sys"."0.2.2"."winapi"}" deps)
    (features_.winapi_build."${deps."kernel32_sys"."0.2.2"."winapi_build"}" deps)
  ];


# end
# language-tags-0.2.2

  crates.language_tags."0.2.2" = deps: { features?(features_.language_tags."0.2.2" deps {}) }: buildRustCrate {
    crateName = "language-tags";
    version = "0.2.2";
    description = "Language tags for Rust";
    authors = [ "Pyfisch <pyfisch@gmail.com>" ];
    sha256 = "1zkrdzsqzzc7509kd7nngdwrp461glm2g09kqpzaqksp82frjdvy";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."language_tags"."0.2.2" or {});
  };
  features_.language_tags."0.2.2" = deps: f: updateFeatures f (rec {
    language_tags = fold recursiveUpdate {} [
      { "0.2.2"."heapsize" =
        (f.language_tags."0.2.2"."heapsize" or false) ||
        (f.language_tags."0.2.2".heap_size or false) ||
        (language_tags."0.2.2"."heap_size" or false); }
      { "0.2.2"."heapsize_plugin" =
        (f.language_tags."0.2.2"."heapsize_plugin" or false) ||
        (f.language_tags."0.2.2".heap_size or false) ||
        (language_tags."0.2.2"."heap_size" or false); }
      { "0.2.2".default = (f.language_tags."0.2.2".default or true); }
    ];
  }) [];


# end
# lazy_static-1.3.0

  crates.lazy_static."1.3.0" = deps: { features?(features_.lazy_static."1.3.0" deps {}) }: buildRustCrate {
    crateName = "lazy_static";
    version = "1.3.0";
    description = "A macro for declaring lazily evaluated statics in Rust.";
    authors = [ "Marvin Löbel <loebel.marvin@gmail.com>" ];
    sha256 = "1vv47va18ydk7dx5paz88g3jy1d3lwbx6qpxkbj8gyfv770i4b1y";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."lazy_static"."1.3.0" or {});
  };
  features_.lazy_static."1.3.0" = deps: f: updateFeatures f (rec {
    lazy_static = fold recursiveUpdate {} [
      { "1.3.0"."spin" =
        (f.lazy_static."1.3.0"."spin" or false) ||
        (f.lazy_static."1.3.0".spin_no_std or false) ||
        (lazy_static."1.3.0"."spin_no_std" or false); }
      { "1.3.0".default = (f.lazy_static."1.3.0".default or true); }
    ];
  }) [];


# end
# lazycell-1.2.1

  crates.lazycell."1.2.1" = deps: { features?(features_.lazycell."1.2.1" deps {}) }: buildRustCrate {
    crateName = "lazycell";
    version = "1.2.1";
    description = "A library providing a lazily filled Cell struct";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" "Nikita Pekin <contact@nikitapek.in>" ];
    sha256 = "1m4h2q9rgxrgc7xjnws1x81lrb68jll8w3pykx1a9bhr29q2mcwm";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."lazycell"."1.2.1" or {});
  };
  features_.lazycell."1.2.1" = deps: f: updateFeatures f (rec {
    lazycell = fold recursiveUpdate {} [
      { "1.2.1"."clippy" =
        (f.lazycell."1.2.1"."clippy" or false) ||
        (f.lazycell."1.2.1".nightly-testing or false) ||
        (lazycell."1.2.1"."nightly-testing" or false); }
      { "1.2.1"."nightly" =
        (f.lazycell."1.2.1"."nightly" or false) ||
        (f.lazycell."1.2.1".nightly-testing or false) ||
        (lazycell."1.2.1"."nightly-testing" or false); }
      { "1.2.1".default = (f.lazycell."1.2.1".default or true); }
    ];
  }) [];


# end
# libc-0.2.54

  crates.libc."0.2.54" = deps: { features?(features_.libc."0.2.54" deps {}) }: buildRustCrate {
    crateName = "libc";
    version = "0.2.54";
    description = "Raw FFI bindings to platform libraries like libc.\n";
    authors = [ "The Rust Project Developers" ];
    sha256 = "11nrsbpmwcnfrjcds0wnicwwql3809nq6q6z00q920bdpryyaf58";
    build = "build.rs";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."libc"."0.2.54" or {});
  };
  features_.libc."0.2.54" = deps: f: updateFeatures f (rec {
    libc = fold recursiveUpdate {} [
      { "0.2.54"."align" =
        (f.libc."0.2.54"."align" or false) ||
        (f.libc."0.2.54".rustc-dep-of-std or false) ||
        (libc."0.2.54"."rustc-dep-of-std" or false); }
      { "0.2.54"."rustc-std-workspace-core" =
        (f.libc."0.2.54"."rustc-std-workspace-core" or false) ||
        (f.libc."0.2.54".rustc-dep-of-std or false) ||
        (libc."0.2.54"."rustc-dep-of-std" or false); }
      { "0.2.54"."use_std" =
        (f.libc."0.2.54"."use_std" or false) ||
        (f.libc."0.2.54".default or false) ||
        (libc."0.2.54"."default" or false); }
      { "0.2.54".default = (f.libc."0.2.54".default or true); }
    ];
  }) [];


# end
# libloading-0.5.0

  crates.libloading."0.5.0" = deps: { features?(features_.libloading."0.5.0" deps {}) }: buildRustCrate {
    crateName = "libloading";
    version = "0.5.0";
    description = "A safer binding to platform’s dynamic library loading utilities";
    authors = [ "Simonas Kazlauskas <libloading@kazlauskas.me>" ];
    sha256 = "11vzjaka1y979aril4ggwp33p35yz2isvx9m5w88r5sdcmq6iscn";
    build = "build.rs";
    dependencies = (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."libloading"."0.5.0"."winapi"}" deps)
    ]) else []);

    buildDependencies = mapFeatures features ([
      (crates."cc"."${deps."libloading"."0.5.0"."cc"}" deps)
    ]);
  };
  features_.libloading."0.5.0" = deps: f: updateFeatures f (rec {
    cc."${deps.libloading."0.5.0".cc}".default = true;
    libloading."0.5.0".default = (f.libloading."0.5.0".default or true);
    winapi = fold recursiveUpdate {} [
      { "${deps.libloading."0.5.0".winapi}"."errhandlingapi" = true; }
      { "${deps.libloading."0.5.0".winapi}"."libloaderapi" = true; }
      { "${deps.libloading."0.5.0".winapi}"."winerror" = true; }
      { "${deps.libloading."0.5.0".winapi}".default = true; }
    ];
  }) [
    (features_.cc."${deps."libloading"."0.5.0"."cc"}" deps)
    (features_.winapi."${deps."libloading"."0.5.0"."winapi"}" deps)
  ];


# end
# libnixstore-sys-0.1.0

  crates.libnixstore_sys."0.1.0" = deps: { features?(features_.libnixstore_sys."0.1.0" deps {}) }: buildRustCrate {
    crateName = "libnixstore-sys";
    version = "0.1.0";
    description = "Bindings to libnixstore-c";
    authors = [ "Andreas Rammhold <andreas@rammhold.de>" ];
    edition = "2018";
    sha256 = "0ich6hap5rg1whpk7gglbhm3iqdw9g60g3pksrai6img88s6v02g";
    libPath = "src/lib.rs";
    libName = "libnixstore_sys";
    crateBin =
      [{  name = "query_path_info";  path = "src/bin.rs"; }];

    buildDependencies = mapFeatures features ([
      (crates."bindgen"."${deps."libnixstore_sys"."0.1.0"."bindgen"}" deps)
      (crates."pkg_config"."${deps."libnixstore_sys"."0.1.0"."pkg_config"}" deps)
    ]);
  };
  features_.libnixstore_sys."0.1.0" = deps: f: updateFeatures f (rec {
    bindgen."${deps.libnixstore_sys."0.1.0".bindgen}".default = true;
    libnixstore_sys."0.1.0".default = (f.libnixstore_sys."0.1.0".default or true);
    pkg_config."${deps.libnixstore_sys."0.1.0".pkg_config}".default = true;
  }) [
    (features_.bindgen."${deps."libnixstore_sys"."0.1.0"."bindgen"}" deps)
    (features_.pkg_config."${deps."libnixstore_sys"."0.1.0"."pkg_config"}" deps)
  ];


# end
# linked-hash-map-0.5.2

  crates.linked_hash_map."0.5.2" = deps: { features?(features_.linked_hash_map."0.5.2" deps {}) }: buildRustCrate {
    crateName = "linked-hash-map";
    version = "0.5.2";
    description = "A HashMap wrapper that holds key-value pairs in insertion order";
    authors = [ "Stepan Koltsov <stepan.koltsov@gmail.com>" "Andrew Paseltiner <apaseltiner@gmail.com>" ];
    sha256 = "17bpcphlhrxknzvikmihiqm690wwyr0zridyilh1dlxgmrxng7pd";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."linked_hash_map"."0.5.2" or {});
  };
  features_.linked_hash_map."0.5.2" = deps: f: updateFeatures f (rec {
    linked_hash_map = fold recursiveUpdate {} [
      { "0.5.2"."heapsize" =
        (f.linked_hash_map."0.5.2"."heapsize" or false) ||
        (f.linked_hash_map."0.5.2".heapsize_impl or false) ||
        (linked_hash_map."0.5.2"."heapsize_impl" or false); }
      { "0.5.2"."serde" =
        (f.linked_hash_map."0.5.2"."serde" or false) ||
        (f.linked_hash_map."0.5.2".serde_impl or false) ||
        (linked_hash_map."0.5.2"."serde_impl" or false); }
      { "0.5.2"."serde_test" =
        (f.linked_hash_map."0.5.2"."serde_test" or false) ||
        (f.linked_hash_map."0.5.2".serde_impl or false) ||
        (linked_hash_map."0.5.2"."serde_impl" or false); }
      { "0.5.2".default = (f.linked_hash_map."0.5.2".default or true); }
    ];
  }) [];


# end
# lock_api-0.1.5

  crates.lock_api."0.1.5" = deps: { features?(features_.lock_api."0.1.5" deps {}) }: buildRustCrate {
    crateName = "lock_api";
    version = "0.1.5";
    description = "Wrappers to create fully-featured Mutex and RwLock types. Compatible with no_std.";
    authors = [ "Amanieu d'Antras <amanieu@gmail.com>" ];
    sha256 = "132sidr5hvjfkaqm3l95zpcpi8yk5ddd0g79zf1ad4v65sxirqqm";
    dependencies = mapFeatures features ([
      (crates."scopeguard"."${deps."lock_api"."0.1.5"."scopeguard"}" deps)
    ]
      ++ (if features.lock_api."0.1.5".owning_ref or false then [ (crates.owning_ref."${deps."lock_api"."0.1.5".owning_ref}" deps) ] else []));
    features = mkFeatures (features."lock_api"."0.1.5" or {});
  };
  features_.lock_api."0.1.5" = deps: f: updateFeatures f (rec {
    lock_api."0.1.5".default = (f.lock_api."0.1.5".default or true);
    owning_ref."${deps.lock_api."0.1.5".owning_ref}".default = true;
    scopeguard."${deps.lock_api."0.1.5".scopeguard}".default = (f.scopeguard."${deps.lock_api."0.1.5".scopeguard}".default or false);
  }) [
    (features_.owning_ref."${deps."lock_api"."0.1.5"."owning_ref"}" deps)
    (features_.scopeguard."${deps."lock_api"."0.1.5"."scopeguard"}" deps)
  ];


# end
# log-0.4.6

  crates.log."0.4.6" = deps: { features?(features_.log."0.4.6" deps {}) }: buildRustCrate {
    crateName = "log";
    version = "0.4.6";
    description = "A lightweight logging facade for Rust\n";
    authors = [ "The Rust Project Developers" ];
    sha256 = "1nd8dl9mvc9vd6fks5d4gsxaz990xi6rzlb8ymllshmwi153vngr";
    dependencies = mapFeatures features ([
      (crates."cfg_if"."${deps."log"."0.4.6"."cfg_if"}" deps)
    ]);
    features = mkFeatures (features."log"."0.4.6" or {});
  };
  features_.log."0.4.6" = deps: f: updateFeatures f (rec {
    cfg_if."${deps.log."0.4.6".cfg_if}".default = true;
    log."0.4.6".default = (f.log."0.4.6".default or true);
  }) [
    (features_.cfg_if."${deps."log"."0.4.6"."cfg_if"}" deps)
  ];


# end
# lru-cache-0.1.2

  crates.lru_cache."0.1.2" = deps: { features?(features_.lru_cache."0.1.2" deps {}) }: buildRustCrate {
    crateName = "lru-cache";
    version = "0.1.2";
    description = "A cache that holds a limited number of key-value pairs";
    authors = [ "Stepan Koltsov <stepan.koltsov@gmail.com>" ];
    sha256 = "0h5qj65hiibsgw01zmy940c654rh0a34cwirrlc57pxyq4cpk0gq";
    dependencies = mapFeatures features ([
      (crates."linked_hash_map"."${deps."lru_cache"."0.1.2"."linked_hash_map"}" deps)
    ]);
    features = mkFeatures (features."lru_cache"."0.1.2" or {});
  };
  features_.lru_cache."0.1.2" = deps: f: updateFeatures f (rec {
    linked_hash_map = fold recursiveUpdate {} [
      { "${deps.lru_cache."0.1.2".linked_hash_map}"."heapsize_impl" =
        (f.linked_hash_map."${deps.lru_cache."0.1.2".linked_hash_map}"."heapsize_impl" or false) ||
        (lru_cache."0.1.2"."heapsize_impl" or false) ||
        (f."lru_cache"."0.1.2"."heapsize_impl" or false); }
      { "${deps.lru_cache."0.1.2".linked_hash_map}".default = true; }
    ];
    lru_cache = fold recursiveUpdate {} [
      { "0.1.2"."heapsize" =
        (f.lru_cache."0.1.2"."heapsize" or false) ||
        (f.lru_cache."0.1.2".heapsize_impl or false) ||
        (lru_cache."0.1.2"."heapsize_impl" or false); }
      { "0.1.2".default = (f.lru_cache."0.1.2".default or true); }
    ];
  }) [
    (features_.linked_hash_map."${deps."lru_cache"."0.1.2"."linked_hash_map"}" deps)
  ];


# end
# matches-0.1.8

  crates.matches."0.1.8" = deps: { features?(features_.matches."0.1.8" deps {}) }: buildRustCrate {
    crateName = "matches";
    version = "0.1.8";
    description = "A macro to evaluate, as a boolean, whether an expression matches a pattern.";
    authors = [ "Simon Sapin <simon.sapin@exyr.org>" ];
    sha256 = "03hl636fg6xggy0a26200xs74amk3k9n0908rga2szn68agyz3cv";
    libPath = "lib.rs";
  };
  features_.matches."0.1.8" = deps: f: updateFeatures f (rec {
    matches."0.1.8".default = (f.matches."0.1.8".default or true);
  }) [];


# end
# memchr-2.2.0

  crates.memchr."2.2.0" = deps: { features?(features_.memchr."2.2.0" deps {}) }: buildRustCrate {
    crateName = "memchr";
    version = "2.2.0";
    description = "Safe interface to memchr.";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" "bluss" ];
    sha256 = "11vwg8iig9jyjxq3n1cq15g29ikzw5l7ar87md54k1aisjs0997p";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."memchr"."2.2.0" or {});
  };
  features_.memchr."2.2.0" = deps: f: updateFeatures f (rec {
    memchr = fold recursiveUpdate {} [
      { "2.2.0"."use_std" =
        (f.memchr."2.2.0"."use_std" or false) ||
        (f.memchr."2.2.0".default or false) ||
        (memchr."2.2.0"."default" or false); }
      { "2.2.0".default = (f.memchr."2.2.0".default or true); }
    ];
  }) [];


# end
# memoffset-0.2.1

  crates.memoffset."0.2.1" = deps: { features?(features_.memoffset."0.2.1" deps {}) }: buildRustCrate {
    crateName = "memoffset";
    version = "0.2.1";
    description = "offset_of functionality for Rust structs.";
    authors = [ "Gilad Naaman <gilad.naaman@gmail.com>" ];
    sha256 = "00vym01jk9slibq2nsiilgffp7n6k52a4q3n4dqp0xf5kzxvffcf";
  };
  features_.memoffset."0.2.1" = deps: f: updateFeatures f (rec {
    memoffset."0.2.1".default = (f.memoffset."0.2.1".default or true);
  }) [];


# end
# mime-0.3.13

  crates.mime."0.3.13" = deps: { features?(features_.mime."0.3.13" deps {}) }: buildRustCrate {
    crateName = "mime";
    version = "0.3.13";
    description = "Strongly Typed Mimes";
    authors = [ "Sean McArthur <sean@seanmonstar.com>" ];
    sha256 = "191b240rj0l8hq2bmn74z1c9rqnrfx0dbfxgyq7vnf3jkrbc5v86";
    dependencies = mapFeatures features ([
      (crates."unicase"."${deps."mime"."0.3.13"."unicase"}" deps)
    ]);
  };
  features_.mime."0.3.13" = deps: f: updateFeatures f (rec {
    mime."0.3.13".default = (f.mime."0.3.13".default or true);
    unicase."${deps.mime."0.3.13".unicase}".default = true;
  }) [
    (features_.unicase."${deps."mime"."0.3.13"."unicase"}" deps)
  ];


# end
# mime_guess-2.0.0-alpha.6

  crates.mime_guess."2.0.0-alpha.6" = deps: { features?(features_.mime_guess."2.0.0-alpha.6" deps {}) }: buildRustCrate {
    crateName = "mime_guess";
    version = "2.0.0-alpha.6";
    description = "A simple crate for detection of a file's MIME type by its extension.";
    authors = [ "Austin Bonander <austin.bonander@gmail.com>" ];
    sha256 = "1k2mdq43gi2qr63b7m5zs624rfi40ysk33cay49jlhq97jwnk9db";
    dependencies = mapFeatures features ([
      (crates."mime"."${deps."mime_guess"."2.0.0-alpha.6"."mime"}" deps)
      (crates."phf"."${deps."mime_guess"."2.0.0-alpha.6"."phf"}" deps)
      (crates."unicase"."${deps."mime_guess"."2.0.0-alpha.6"."unicase"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."phf_codegen"."${deps."mime_guess"."2.0.0-alpha.6"."phf_codegen"}" deps)
      (crates."unicase"."${deps."mime_guess"."2.0.0-alpha.6"."unicase"}" deps)
    ]);
    features = mkFeatures (features."mime_guess"."2.0.0-alpha.6" or {});
  };
  features_.mime_guess."2.0.0-alpha.6" = deps: f: updateFeatures f (rec {
    mime."${deps.mime_guess."2.0.0-alpha.6".mime}".default = true;
    mime_guess."2.0.0-alpha.6".default = (f.mime_guess."2.0.0-alpha.6".default or true);
    phf = fold recursiveUpdate {} [
      { "${deps.mime_guess."2.0.0-alpha.6".phf}"."unicase" = true; }
      { "${deps.mime_guess."2.0.0-alpha.6".phf}".default = true; }
    ];
    phf_codegen."${deps.mime_guess."2.0.0-alpha.6".phf_codegen}".default = true;
    unicase."${deps.mime_guess."2.0.0-alpha.6".unicase}".default = true;
  }) [
    (features_.mime."${deps."mime_guess"."2.0.0-alpha.6"."mime"}" deps)
    (features_.phf."${deps."mime_guess"."2.0.0-alpha.6"."phf"}" deps)
    (features_.unicase."${deps."mime_guess"."2.0.0-alpha.6"."unicase"}" deps)
    (features_.phf_codegen."${deps."mime_guess"."2.0.0-alpha.6"."phf_codegen"}" deps)
    (features_.unicase."${deps."mime_guess"."2.0.0-alpha.6"."unicase"}" deps)
  ];


# end
# miniz-sys-0.1.11

  crates.miniz_sys."0.1.11" = deps: { features?(features_.miniz_sys."0.1.11" deps {}) }: buildRustCrate {
    crateName = "miniz-sys";
    version = "0.1.11";
    description = "Bindings to the miniz.c library.\n";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "0l2wsakqjj7kc06dwxlpz4h8wih0f9d1idrz5gb1svipvh81khsm";
    libPath = "lib.rs";
    libName = "miniz_sys";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."libc"."${deps."miniz_sys"."0.1.11"."libc"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."cc"."${deps."miniz_sys"."0.1.11"."cc"}" deps)
    ]);
  };
  features_.miniz_sys."0.1.11" = deps: f: updateFeatures f (rec {
    cc."${deps.miniz_sys."0.1.11".cc}".default = true;
    libc."${deps.miniz_sys."0.1.11".libc}".default = true;
    miniz_sys."0.1.11".default = (f.miniz_sys."0.1.11".default or true);
  }) [
    (features_.libc."${deps."miniz_sys"."0.1.11"."libc"}" deps)
    (features_.cc."${deps."miniz_sys"."0.1.11"."cc"}" deps)
  ];


# end
# miniz_oxide-0.2.1

  crates.miniz_oxide."0.2.1" = deps: { features?(features_.miniz_oxide."0.2.1" deps {}) }: buildRustCrate {
    crateName = "miniz_oxide";
    version = "0.2.1";
    description = "DEFLATE compression and decompression library rewritten in Rust based on miniz";
    authors = [ "Frommi <daniil.liferenko@gmail.com>" ];
    sha256 = "1ly14vlk0gq7czi1323l2dsy5y8dpvdwld4h9083i0y3hx9iyfdz";
    dependencies = mapFeatures features ([
      (crates."adler32"."${deps."miniz_oxide"."0.2.1"."adler32"}" deps)
    ]);
  };
  features_.miniz_oxide."0.2.1" = deps: f: updateFeatures f (rec {
    adler32."${deps.miniz_oxide."0.2.1".adler32}".default = true;
    miniz_oxide."0.2.1".default = (f.miniz_oxide."0.2.1".default or true);
  }) [
    (features_.adler32."${deps."miniz_oxide"."0.2.1"."adler32"}" deps)
  ];


# end
# miniz_oxide_c_api-0.2.1

  crates.miniz_oxide_c_api."0.2.1" = deps: { features?(features_.miniz_oxide_c_api."0.2.1" deps {}) }: buildRustCrate {
    crateName = "miniz_oxide_c_api";
    version = "0.2.1";
    description = "DEFLATE compression and decompression API designed to be Rust drop-in replacement for miniz";
    authors = [ "Frommi <daniil.liferenko@gmail.com>" ];
    sha256 = "1zsk334nhy2rvyhbr0815l0gp6w40al6rxxafkycaafx3m9j8cj2";
    build = "src/build.rs";
    dependencies = mapFeatures features ([
      (crates."crc"."${deps."miniz_oxide_c_api"."0.2.1"."crc"}" deps)
      (crates."libc"."${deps."miniz_oxide_c_api"."0.2.1"."libc"}" deps)
      (crates."miniz_oxide"."${deps."miniz_oxide_c_api"."0.2.1"."miniz_oxide"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."cc"."${deps."miniz_oxide_c_api"."0.2.1"."cc"}" deps)
    ]);
    features = mkFeatures (features."miniz_oxide_c_api"."0.2.1" or {});
  };
  features_.miniz_oxide_c_api."0.2.1" = deps: f: updateFeatures f (rec {
    cc."${deps.miniz_oxide_c_api."0.2.1".cc}".default = true;
    crc."${deps.miniz_oxide_c_api."0.2.1".crc}".default = true;
    libc."${deps.miniz_oxide_c_api."0.2.1".libc}".default = true;
    miniz_oxide."${deps.miniz_oxide_c_api."0.2.1".miniz_oxide}".default = true;
    miniz_oxide_c_api = fold recursiveUpdate {} [
      { "0.2.1"."build_orig_miniz" =
        (f.miniz_oxide_c_api."0.2.1"."build_orig_miniz" or false) ||
        (f.miniz_oxide_c_api."0.2.1".benching or false) ||
        (miniz_oxide_c_api."0.2.1"."benching" or false) ||
        (f.miniz_oxide_c_api."0.2.1".fuzzing or false) ||
        (miniz_oxide_c_api."0.2.1"."fuzzing" or false); }
      { "0.2.1"."build_stub_miniz" =
        (f.miniz_oxide_c_api."0.2.1"."build_stub_miniz" or false) ||
        (f.miniz_oxide_c_api."0.2.1".miniz_zip or false) ||
        (miniz_oxide_c_api."0.2.1"."miniz_zip" or false); }
      { "0.2.1"."no_c_export" =
        (f.miniz_oxide_c_api."0.2.1"."no_c_export" or false) ||
        (f.miniz_oxide_c_api."0.2.1".benching or false) ||
        (miniz_oxide_c_api."0.2.1"."benching" or false) ||
        (f.miniz_oxide_c_api."0.2.1".fuzzing or false) ||
        (miniz_oxide_c_api."0.2.1"."fuzzing" or false); }
      { "0.2.1".default = (f.miniz_oxide_c_api."0.2.1".default or true); }
    ];
  }) [
    (features_.crc."${deps."miniz_oxide_c_api"."0.2.1"."crc"}" deps)
    (features_.libc."${deps."miniz_oxide_c_api"."0.2.1"."libc"}" deps)
    (features_.miniz_oxide."${deps."miniz_oxide_c_api"."0.2.1"."miniz_oxide"}" deps)
    (features_.cc."${deps."miniz_oxide_c_api"."0.2.1"."cc"}" deps)
  ];


# end
# mio-0.6.16

  crates.mio."0.6.16" = deps: { features?(features_.mio."0.6.16" deps {}) }: buildRustCrate {
    crateName = "mio";
    version = "0.6.16";
    description = "Lightweight non-blocking IO";
    authors = [ "Carl Lerche <me@carllerche.com>" ];
    sha256 = "14vyrlmf0w984pi7ad9qvmlfj6vrb0wn6i8ik9j87w5za2r3rban";
    dependencies = mapFeatures features ([
      (crates."iovec"."${deps."mio"."0.6.16"."iovec"}" deps)
      (crates."lazycell"."${deps."mio"."0.6.16"."lazycell"}" deps)
      (crates."log"."${deps."mio"."0.6.16"."log"}" deps)
      (crates."net2"."${deps."mio"."0.6.16"."net2"}" deps)
      (crates."slab"."${deps."mio"."0.6.16"."slab"}" deps)
    ])
      ++ (if kernel == "fuchsia" then mapFeatures features ([
      (crates."fuchsia_zircon"."${deps."mio"."0.6.16"."fuchsia_zircon"}" deps)
      (crates."fuchsia_zircon_sys"."${deps."mio"."0.6.16"."fuchsia_zircon_sys"}" deps)
    ]) else [])
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."mio"."0.6.16"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."kernel32_sys"."${deps."mio"."0.6.16"."kernel32_sys"}" deps)
      (crates."miow"."${deps."mio"."0.6.16"."miow"}" deps)
      (crates."winapi"."${deps."mio"."0.6.16"."winapi"}" deps)
    ]) else []);
    features = mkFeatures (features."mio"."0.6.16" or {});
  };
  features_.mio."0.6.16" = deps: f: updateFeatures f (rec {
    fuchsia_zircon."${deps.mio."0.6.16".fuchsia_zircon}".default = true;
    fuchsia_zircon_sys."${deps.mio."0.6.16".fuchsia_zircon_sys}".default = true;
    iovec."${deps.mio."0.6.16".iovec}".default = true;
    kernel32_sys."${deps.mio."0.6.16".kernel32_sys}".default = true;
    lazycell."${deps.mio."0.6.16".lazycell}".default = true;
    libc."${deps.mio."0.6.16".libc}".default = true;
    log."${deps.mio."0.6.16".log}".default = true;
    mio = fold recursiveUpdate {} [
      { "0.6.16"."with-deprecated" =
        (f.mio."0.6.16"."with-deprecated" or false) ||
        (f.mio."0.6.16".default or false) ||
        (mio."0.6.16"."default" or false); }
      { "0.6.16".default = (f.mio."0.6.16".default or true); }
    ];
    miow."${deps.mio."0.6.16".miow}".default = true;
    net2."${deps.mio."0.6.16".net2}".default = true;
    slab."${deps.mio."0.6.16".slab}".default = true;
    winapi."${deps.mio."0.6.16".winapi}".default = true;
  }) [
    (features_.iovec."${deps."mio"."0.6.16"."iovec"}" deps)
    (features_.lazycell."${deps."mio"."0.6.16"."lazycell"}" deps)
    (features_.log."${deps."mio"."0.6.16"."log"}" deps)
    (features_.net2."${deps."mio"."0.6.16"."net2"}" deps)
    (features_.slab."${deps."mio"."0.6.16"."slab"}" deps)
    (features_.fuchsia_zircon."${deps."mio"."0.6.16"."fuchsia_zircon"}" deps)
    (features_.fuchsia_zircon_sys."${deps."mio"."0.6.16"."fuchsia_zircon_sys"}" deps)
    (features_.libc."${deps."mio"."0.6.16"."libc"}" deps)
    (features_.kernel32_sys."${deps."mio"."0.6.16"."kernel32_sys"}" deps)
    (features_.miow."${deps."mio"."0.6.16"."miow"}" deps)
    (features_.winapi."${deps."mio"."0.6.16"."winapi"}" deps)
  ];


# end
# mio-uds-0.6.7

  crates.mio_uds."0.6.7" = deps: { features?(features_.mio_uds."0.6.7" deps {}) }: buildRustCrate {
    crateName = "mio-uds";
    version = "0.6.7";
    description = "Unix domain socket bindings for mio\n";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "1gff9908pvvysv7zgxvyxy7x34fnhs088cr0j8mgwj8j24mswrhm";
    dependencies = (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."iovec"."${deps."mio_uds"."0.6.7"."iovec"}" deps)
      (crates."libc"."${deps."mio_uds"."0.6.7"."libc"}" deps)
      (crates."mio"."${deps."mio_uds"."0.6.7"."mio"}" deps)
    ]) else []);
  };
  features_.mio_uds."0.6.7" = deps: f: updateFeatures f (rec {
    iovec."${deps.mio_uds."0.6.7".iovec}".default = true;
    libc."${deps.mio_uds."0.6.7".libc}".default = true;
    mio."${deps.mio_uds."0.6.7".mio}".default = true;
    mio_uds."0.6.7".default = (f.mio_uds."0.6.7".default or true);
  }) [
    (features_.iovec."${deps."mio_uds"."0.6.7"."iovec"}" deps)
    (features_.libc."${deps."mio_uds"."0.6.7"."libc"}" deps)
    (features_.mio."${deps."mio_uds"."0.6.7"."mio"}" deps)
  ];


# end
# miow-0.2.1

  crates.miow."0.2.1" = deps: { features?(features_.miow."0.2.1" deps {}) }: buildRustCrate {
    crateName = "miow";
    version = "0.2.1";
    description = "A zero overhead I/O library for Windows, focusing on IOCP and Async I/O\nabstractions.\n";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "14f8zkc6ix7mkyis1vsqnim8m29b6l55abkba3p2yz7j1ibcvrl0";
    dependencies = mapFeatures features ([
      (crates."kernel32_sys"."${deps."miow"."0.2.1"."kernel32_sys"}" deps)
      (crates."net2"."${deps."miow"."0.2.1"."net2"}" deps)
      (crates."winapi"."${deps."miow"."0.2.1"."winapi"}" deps)
      (crates."ws2_32_sys"."${deps."miow"."0.2.1"."ws2_32_sys"}" deps)
    ]);
  };
  features_.miow."0.2.1" = deps: f: updateFeatures f (rec {
    kernel32_sys."${deps.miow."0.2.1".kernel32_sys}".default = true;
    miow."0.2.1".default = (f.miow."0.2.1".default or true);
    net2."${deps.miow."0.2.1".net2}".default = (f.net2."${deps.miow."0.2.1".net2}".default or false);
    winapi."${deps.miow."0.2.1".winapi}".default = true;
    ws2_32_sys."${deps.miow."0.2.1".ws2_32_sys}".default = true;
  }) [
    (features_.kernel32_sys."${deps."miow"."0.2.1"."kernel32_sys"}" deps)
    (features_.net2."${deps."miow"."0.2.1"."net2"}" deps)
    (features_.winapi."${deps."miow"."0.2.1"."winapi"}" deps)
    (features_.ws2_32_sys."${deps."miow"."0.2.1"."ws2_32_sys"}" deps)
  ];


# end
# native-tls-0.2.3

  crates.native_tls."0.2.3" = deps: { features?(features_.native_tls."0.2.3" deps {}) }: buildRustCrate {
    crateName = "native-tls";
    version = "0.2.3";
    description = "A wrapper over a platform's native TLS implementation";
    authors = [ "Steven Fackler <sfackler@gmail.com>" ];
    sha256 = "19bmkzcj2qvyxchlqa1yg2g5awjmk6sigm20mfwajfcczbq3dc6j";
    dependencies = (if kernel == "darwin" || kernel == "ios" then mapFeatures features ([
      (crates."lazy_static"."${deps."native_tls"."0.2.3"."lazy_static"}" deps)
      (crates."libc"."${deps."native_tls"."0.2.3"."libc"}" deps)
      (crates."security_framework"."${deps."native_tls"."0.2.3"."security_framework"}" deps)
      (crates."security_framework_sys"."${deps."native_tls"."0.2.3"."security_framework_sys"}" deps)
      (crates."tempfile"."${deps."native_tls"."0.2.3"."tempfile"}" deps)
    ]) else [])
      ++ (if !(kernel == "windows" || kernel == "darwin" || kernel == "ios") then mapFeatures features ([
      (crates."log"."${deps."native_tls"."0.2.3"."log"}" deps)
      (crates."openssl"."${deps."native_tls"."0.2.3"."openssl"}" deps)
      (crates."openssl_probe"."${deps."native_tls"."0.2.3"."openssl_probe"}" deps)
      (crates."openssl_sys"."${deps."native_tls"."0.2.3"."openssl_sys"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."schannel"."${deps."native_tls"."0.2.3"."schannel"}" deps)
    ]) else []);
    features = mkFeatures (features."native_tls"."0.2.3" or {});
  };
  features_.native_tls."0.2.3" = deps: f: updateFeatures f (rec {
    lazy_static."${deps.native_tls."0.2.3".lazy_static}".default = true;
    libc."${deps.native_tls."0.2.3".libc}".default = true;
    log."${deps.native_tls."0.2.3".log}".default = true;
    native_tls."0.2.3".default = (f.native_tls."0.2.3".default or true);
    openssl."${deps.native_tls."0.2.3".openssl}".default = true;
    openssl_probe."${deps.native_tls."0.2.3".openssl_probe}".default = true;
    openssl_sys."${deps.native_tls."0.2.3".openssl_sys}".default = true;
    schannel."${deps.native_tls."0.2.3".schannel}".default = true;
    security_framework."${deps.native_tls."0.2.3".security_framework}".default = true;
    security_framework_sys."${deps.native_tls."0.2.3".security_framework_sys}".default = true;
    tempfile."${deps.native_tls."0.2.3".tempfile}".default = true;
  }) [
    (features_.lazy_static."${deps."native_tls"."0.2.3"."lazy_static"}" deps)
    (features_.libc."${deps."native_tls"."0.2.3"."libc"}" deps)
    (features_.security_framework."${deps."native_tls"."0.2.3"."security_framework"}" deps)
    (features_.security_framework_sys."${deps."native_tls"."0.2.3"."security_framework_sys"}" deps)
    (features_.tempfile."${deps."native_tls"."0.2.3"."tempfile"}" deps)
    (features_.log."${deps."native_tls"."0.2.3"."log"}" deps)
    (features_.openssl."${deps."native_tls"."0.2.3"."openssl"}" deps)
    (features_.openssl_probe."${deps."native_tls"."0.2.3"."openssl_probe"}" deps)
    (features_.openssl_sys."${deps."native_tls"."0.2.3"."openssl_sys"}" deps)
    (features_.schannel."${deps."native_tls"."0.2.3"."schannel"}" deps)
  ];


# end
# net2-0.2.33

  crates.net2."0.2.33" = deps: { features?(features_.net2."0.2.33" deps {}) }: buildRustCrate {
    crateName = "net2";
    version = "0.2.33";
    description = "Extensions to the standard library's networking types as proposed in RFC 1158.\n";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "1qnmajafgybj5wyxz9iffa8x5wgbwd2znfklmhqj7vl6lw1m65mq";
    dependencies = mapFeatures features ([
      (crates."cfg_if"."${deps."net2"."0.2.33"."cfg_if"}" deps)
    ])
      ++ (if kernel == "redox" || (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."net2"."0.2.33"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."net2"."0.2.33"."winapi"}" deps)
    ]) else []);
    features = mkFeatures (features."net2"."0.2.33" or {});
  };
  features_.net2."0.2.33" = deps: f: updateFeatures f (rec {
    cfg_if."${deps.net2."0.2.33".cfg_if}".default = true;
    libc."${deps.net2."0.2.33".libc}".default = true;
    net2 = fold recursiveUpdate {} [
      { "0.2.33"."duration" =
        (f.net2."0.2.33"."duration" or false) ||
        (f.net2."0.2.33".default or false) ||
        (net2."0.2.33"."default" or false); }
      { "0.2.33".default = (f.net2."0.2.33".default or true); }
    ];
    winapi = fold recursiveUpdate {} [
      { "${deps.net2."0.2.33".winapi}"."handleapi" = true; }
      { "${deps.net2."0.2.33".winapi}"."winsock2" = true; }
      { "${deps.net2."0.2.33".winapi}"."ws2def" = true; }
      { "${deps.net2."0.2.33".winapi}"."ws2ipdef" = true; }
      { "${deps.net2."0.2.33".winapi}"."ws2tcpip" = true; }
      { "${deps.net2."0.2.33".winapi}".default = true; }
    ];
  }) [
    (features_.cfg_if."${deps."net2"."0.2.33"."cfg_if"}" deps)
    (features_.libc."${deps."net2"."0.2.33"."libc"}" deps)
    (features_.winapi."${deps."net2"."0.2.33"."winapi"}" deps)
  ];


# end
# nodrop-0.1.13

  crates.nodrop."0.1.13" = deps: { features?(features_.nodrop."0.1.13" deps {}) }: buildRustCrate {
    crateName = "nodrop";
    version = "0.1.13";
    description = "A wrapper type to inhibit drop (destructor). Use std::mem::ManuallyDrop instead!";
    authors = [ "bluss" ];
    sha256 = "0gkfx6wihr9z0m8nbdhma5pyvbipznjpkzny2d4zkc05b0vnhinb";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."nodrop"."0.1.13" or {});
  };
  features_.nodrop."0.1.13" = deps: f: updateFeatures f (rec {
    nodrop = fold recursiveUpdate {} [
      { "0.1.13"."nodrop-union" =
        (f.nodrop."0.1.13"."nodrop-union" or false) ||
        (f.nodrop."0.1.13".use_union or false) ||
        (nodrop."0.1.13"."use_union" or false); }
      { "0.1.13"."std" =
        (f.nodrop."0.1.13"."std" or false) ||
        (f.nodrop."0.1.13".default or false) ||
        (nodrop."0.1.13"."default" or false); }
      { "0.1.13".default = (f.nodrop."0.1.13".default or true); }
    ];
  }) [];


# end
# nom-4.2.3

  crates.nom."4.2.3" = deps: { features?(features_.nom."4.2.3" deps {}) }: buildRustCrate {
    crateName = "nom";
    version = "4.2.3";
    description = "A byte-oriented, zero-copy, parser combinators library";
    authors = [ "contact@geoffroycouprie.com" ];
    sha256 = "0rg7n0nif70052wlaffmgxmmlvi6xm7zpqmzfq9d8wr9376lpn2h";
    dependencies = mapFeatures features ([
      (crates."memchr"."${deps."nom"."4.2.3"."memchr"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."version_check"."${deps."nom"."4.2.3"."version_check"}" deps)
    ]);
    features = mkFeatures (features."nom"."4.2.3" or {});
  };
  features_.nom."4.2.3" = deps: f: updateFeatures f (rec {
    memchr = fold recursiveUpdate {} [
      { "${deps.nom."4.2.3".memchr}"."use_std" =
        (f.memchr."${deps.nom."4.2.3".memchr}"."use_std" or false) ||
        (nom."4.2.3"."std" or false) ||
        (f."nom"."4.2.3"."std" or false); }
      { "${deps.nom."4.2.3".memchr}".default = (f.memchr."${deps.nom."4.2.3".memchr}".default or false); }
    ];
    nom = fold recursiveUpdate {} [
      { "4.2.3"."alloc" =
        (f.nom."4.2.3"."alloc" or false) ||
        (f.nom."4.2.3".std or false) ||
        (nom."4.2.3"."std" or false) ||
        (f.nom."4.2.3".verbose-errors or false) ||
        (nom."4.2.3"."verbose-errors" or false); }
      { "4.2.3"."lazy_static" =
        (f.nom."4.2.3"."lazy_static" or false) ||
        (f.nom."4.2.3".regexp_macros or false) ||
        (nom."4.2.3"."regexp_macros" or false); }
      { "4.2.3"."regex" =
        (f.nom."4.2.3"."regex" or false) ||
        (f.nom."4.2.3".regexp or false) ||
        (nom."4.2.3"."regexp" or false); }
      { "4.2.3"."regexp" =
        (f.nom."4.2.3"."regexp" or false) ||
        (f.nom."4.2.3".regexp_macros or false) ||
        (nom."4.2.3"."regexp_macros" or false); }
      { "4.2.3"."std" =
        (f.nom."4.2.3"."std" or false) ||
        (f.nom."4.2.3".default or false) ||
        (nom."4.2.3"."default" or false); }
      { "4.2.3".default = (f.nom."4.2.3".default or true); }
    ];
    version_check."${deps.nom."4.2.3".version_check}".default = true;
  }) [
    (features_.memchr."${deps."nom"."4.2.3"."memchr"}" deps)
    (features_.version_check."${deps."nom"."4.2.3"."version_check"}" deps)
  ];


# end
# num_cpus-1.10.0

  crates.num_cpus."1.10.0" = deps: { features?(features_.num_cpus."1.10.0" deps {}) }: buildRustCrate {
    crateName = "num_cpus";
    version = "1.10.0";
    description = "Get the number of CPUs on a machine.";
    authors = [ "Sean McArthur <sean@seanmonstar.com>" ];
    sha256 = "1411jyxy1wd8d59mv7cf6ynkvvar92czmwhb9l2c1brdkxbbiqn7";
    dependencies = mapFeatures features ([
      (crates."libc"."${deps."num_cpus"."1.10.0"."libc"}" deps)
    ]);
  };
  features_.num_cpus."1.10.0" = deps: f: updateFeatures f (rec {
    libc."${deps.num_cpus."1.10.0".libc}".default = true;
    num_cpus."1.10.0".default = (f.num_cpus."1.10.0".default or true);
  }) [
    (features_.libc."${deps."num_cpus"."1.10.0"."libc"}" deps)
  ];


# end
# numtoa-0.1.0

  crates.numtoa."0.1.0" = deps: { features?(features_.numtoa."0.1.0" deps {}) }: buildRustCrate {
    crateName = "numtoa";
    version = "0.1.0";
    description = "Convert numbers into stack-allocated byte arrays";
    authors = [ "Michael Aaron Murphy <mmstickman@gmail.com>" ];
    sha256 = "1i2wxr96bb1rvax15z843126z3bnl2frpx69vxsp95r96wr24j08";
    features = mkFeatures (features."numtoa"."0.1.0" or {});
  };
  features_.numtoa."0.1.0" = deps: f: updateFeatures f (rec {
    numtoa."0.1.0".default = (f.numtoa."0.1.0".default or true);
  }) [];


# end
# openssl-0.10.21

  crates.openssl."0.10.21" = deps: { features?(features_.openssl."0.10.21" deps {}) }: buildRustCrate {
    crateName = "openssl";
    version = "0.10.21";
    description = "OpenSSL bindings";
    authors = [ "Steven Fackler <sfackler@gmail.com>" ];
    sha256 = "1msb9iqfz4zb426g3l622wfa1dh9p7w0dz8cac1wpf66isj0x028";
    dependencies = mapFeatures features ([
      (crates."bitflags"."${deps."openssl"."0.10.21"."bitflags"}" deps)
      (crates."cfg_if"."${deps."openssl"."0.10.21"."cfg_if"}" deps)
      (crates."foreign_types"."${deps."openssl"."0.10.21"."foreign_types"}" deps)
      (crates."lazy_static"."${deps."openssl"."0.10.21"."lazy_static"}" deps)
      (crates."libc"."${deps."openssl"."0.10.21"."libc"}" deps)
      (crates."openssl_sys"."${deps."openssl"."0.10.21"."openssl_sys"}" deps)
    ]);
    features = mkFeatures (features."openssl"."0.10.21" or {});
  };
  features_.openssl."0.10.21" = deps: f: updateFeatures f (rec {
    bitflags."${deps.openssl."0.10.21".bitflags}".default = true;
    cfg_if."${deps.openssl."0.10.21".cfg_if}".default = true;
    foreign_types."${deps.openssl."0.10.21".foreign_types}".default = true;
    lazy_static."${deps.openssl."0.10.21".lazy_static}".default = true;
    libc."${deps.openssl."0.10.21".libc}".default = true;
    openssl."0.10.21".default = (f.openssl."0.10.21".default or true);
    openssl_sys = fold recursiveUpdate {} [
      { "${deps.openssl."0.10.21".openssl_sys}"."vendored" =
        (f.openssl_sys."${deps.openssl."0.10.21".openssl_sys}"."vendored" or false) ||
        (openssl."0.10.21"."vendored" or false) ||
        (f."openssl"."0.10.21"."vendored" or false); }
      { "${deps.openssl."0.10.21".openssl_sys}".default = true; }
    ];
  }) [
    (features_.bitflags."${deps."openssl"."0.10.21"."bitflags"}" deps)
    (features_.cfg_if."${deps."openssl"."0.10.21"."cfg_if"}" deps)
    (features_.foreign_types."${deps."openssl"."0.10.21"."foreign_types"}" deps)
    (features_.lazy_static."${deps."openssl"."0.10.21"."lazy_static"}" deps)
    (features_.libc."${deps."openssl"."0.10.21"."libc"}" deps)
    (features_.openssl_sys."${deps."openssl"."0.10.21"."openssl_sys"}" deps)
  ];


# end
# openssl-probe-0.1.2

  crates.openssl_probe."0.1.2" = deps: { features?(features_.openssl_probe."0.1.2" deps {}) }: buildRustCrate {
    crateName = "openssl-probe";
    version = "0.1.2";
    description = "Tool for helping to find SSL certificate locations on the system for OpenSSL\n";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "1a89fznx26vvaxyrxdvgf6iwai5xvs6xjvpjin68fgvrslv6n15a";
  };
  features_.openssl_probe."0.1.2" = deps: f: updateFeatures f (rec {
    openssl_probe."0.1.2".default = (f.openssl_probe."0.1.2".default or true);
  }) [];


# end
# openssl-sys-0.9.45

  crates.openssl_sys."0.9.45" = deps: { features?(features_.openssl_sys."0.9.45" deps {}) }: buildRustCrate {
    crateName = "openssl-sys";
    version = "0.9.45";
    description = "FFI bindings to OpenSSL";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" "Steven Fackler <sfackler@gmail.com>" ];
    sha256 = "154d123dxsxisq8gxdl66j7s5rn0gxck1fbjbn7da6nmcypwg4dp";
    build = "build/main.rs";
    dependencies = mapFeatures features ([
      (crates."libc"."${deps."openssl_sys"."0.9.45"."libc"}" deps)
    ])
      ++ (if abi == "msvc" then mapFeatures features ([
]) else []);

    buildDependencies = mapFeatures features ([
      (crates."autocfg"."${deps."openssl_sys"."0.9.45"."autocfg"}" deps)
      (crates."cc"."${deps."openssl_sys"."0.9.45"."cc"}" deps)
      (crates."pkg_config"."${deps."openssl_sys"."0.9.45"."pkg_config"}" deps)
    ]);
    features = mkFeatures (features."openssl_sys"."0.9.45" or {});
  };
  features_.openssl_sys."0.9.45" = deps: f: updateFeatures f (rec {
    autocfg."${deps.openssl_sys."0.9.45".autocfg}".default = true;
    cc."${deps.openssl_sys."0.9.45".cc}".default = true;
    libc."${deps.openssl_sys."0.9.45".libc}".default = true;
    openssl_sys = fold recursiveUpdate {} [
      { "0.9.45"."openssl-src" =
        (f.openssl_sys."0.9.45"."openssl-src" or false) ||
        (f.openssl_sys."0.9.45".vendored or false) ||
        (openssl_sys."0.9.45"."vendored" or false); }
      { "0.9.45".default = (f.openssl_sys."0.9.45".default or true); }
    ];
    pkg_config."${deps.openssl_sys."0.9.45".pkg_config}".default = true;
  }) [
    (features_.libc."${deps."openssl_sys"."0.9.45"."libc"}" deps)
    (features_.autocfg."${deps."openssl_sys"."0.9.45"."autocfg"}" deps)
    (features_.cc."${deps."openssl_sys"."0.9.45"."cc"}" deps)
    (features_.pkg_config."${deps."openssl_sys"."0.9.45"."pkg_config"}" deps)
  ];


# end
# owning_ref-0.4.0

  crates.owning_ref."0.4.0" = deps: { features?(features_.owning_ref."0.4.0" deps {}) }: buildRustCrate {
    crateName = "owning_ref";
    version = "0.4.0";
    description = "A library for creating references that carry their owner with them.";
    authors = [ "Marvin Löbel <loebel.marvin@gmail.com>" ];
    sha256 = "1m95qpc3hamkw9wlbfzqkzk7h6skyj40zr6sa3ps151slcfnnchm";
    dependencies = mapFeatures features ([
      (crates."stable_deref_trait"."${deps."owning_ref"."0.4.0"."stable_deref_trait"}" deps)
    ]);
  };
  features_.owning_ref."0.4.0" = deps: f: updateFeatures f (rec {
    owning_ref."0.4.0".default = (f.owning_ref."0.4.0".default or true);
    stable_deref_trait."${deps.owning_ref."0.4.0".stable_deref_trait}".default = true;
  }) [
    (features_.stable_deref_trait."${deps."owning_ref"."0.4.0"."stable_deref_trait"}" deps)
  ];


# end
# parking_lot-0.7.1

  crates.parking_lot."0.7.1" = deps: { features?(features_.parking_lot."0.7.1" deps {}) }: buildRustCrate {
    crateName = "parking_lot";
    version = "0.7.1";
    description = "More compact and efficient implementations of the standard synchronization primitives.";
    authors = [ "Amanieu d'Antras <amanieu@gmail.com>" ];
    sha256 = "1qpb49xd176hqqabxdb48f1hvylfbf68rpz8yfrhw0x68ys0lkq1";
    dependencies = mapFeatures features ([
      (crates."lock_api"."${deps."parking_lot"."0.7.1"."lock_api"}" deps)
      (crates."parking_lot_core"."${deps."parking_lot"."0.7.1"."parking_lot_core"}" deps)
    ]);
    features = mkFeatures (features."parking_lot"."0.7.1" or {});
  };
  features_.parking_lot."0.7.1" = deps: f: updateFeatures f (rec {
    lock_api = fold recursiveUpdate {} [
      { "${deps.parking_lot."0.7.1".lock_api}"."nightly" =
        (f.lock_api."${deps.parking_lot."0.7.1".lock_api}"."nightly" or false) ||
        (parking_lot."0.7.1"."nightly" or false) ||
        (f."parking_lot"."0.7.1"."nightly" or false); }
      { "${deps.parking_lot."0.7.1".lock_api}"."owning_ref" =
        (f.lock_api."${deps.parking_lot."0.7.1".lock_api}"."owning_ref" or false) ||
        (parking_lot."0.7.1"."owning_ref" or false) ||
        (f."parking_lot"."0.7.1"."owning_ref" or false); }
      { "${deps.parking_lot."0.7.1".lock_api}".default = true; }
    ];
    parking_lot = fold recursiveUpdate {} [
      { "0.7.1"."owning_ref" =
        (f.parking_lot."0.7.1"."owning_ref" or false) ||
        (f.parking_lot."0.7.1".default or false) ||
        (parking_lot."0.7.1"."default" or false); }
      { "0.7.1".default = (f.parking_lot."0.7.1".default or true); }
    ];
    parking_lot_core = fold recursiveUpdate {} [
      { "${deps.parking_lot."0.7.1".parking_lot_core}"."deadlock_detection" =
        (f.parking_lot_core."${deps.parking_lot."0.7.1".parking_lot_core}"."deadlock_detection" or false) ||
        (parking_lot."0.7.1"."deadlock_detection" or false) ||
        (f."parking_lot"."0.7.1"."deadlock_detection" or false); }
      { "${deps.parking_lot."0.7.1".parking_lot_core}"."nightly" =
        (f.parking_lot_core."${deps.parking_lot."0.7.1".parking_lot_core}"."nightly" or false) ||
        (parking_lot."0.7.1"."nightly" or false) ||
        (f."parking_lot"."0.7.1"."nightly" or false); }
      { "${deps.parking_lot."0.7.1".parking_lot_core}".default = true; }
    ];
  }) [
    (features_.lock_api."${deps."parking_lot"."0.7.1"."lock_api"}" deps)
    (features_.parking_lot_core."${deps."parking_lot"."0.7.1"."parking_lot_core"}" deps)
  ];


# end
# parking_lot_core-0.4.0

  crates.parking_lot_core."0.4.0" = deps: { features?(features_.parking_lot_core."0.4.0" deps {}) }: buildRustCrate {
    crateName = "parking_lot_core";
    version = "0.4.0";
    description = "An advanced API for creating custom synchronization primitives.";
    authors = [ "Amanieu d'Antras <amanieu@gmail.com>" ];
    sha256 = "1mzk5i240ddvhwnz65hhjk4cq61z235g1n8bd7al4mg6vx437c16";
    dependencies = mapFeatures features ([
      (crates."rand"."${deps."parking_lot_core"."0.4.0"."rand"}" deps)
      (crates."smallvec"."${deps."parking_lot_core"."0.4.0"."smallvec"}" deps)
    ])
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."parking_lot_core"."0.4.0"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."parking_lot_core"."0.4.0"."winapi"}" deps)
    ]) else []);

    buildDependencies = mapFeatures features ([
      (crates."rustc_version"."${deps."parking_lot_core"."0.4.0"."rustc_version"}" deps)
    ]);
    features = mkFeatures (features."parking_lot_core"."0.4.0" or {});
  };
  features_.parking_lot_core."0.4.0" = deps: f: updateFeatures f (rec {
    libc."${deps.parking_lot_core."0.4.0".libc}".default = true;
    parking_lot_core = fold recursiveUpdate {} [
      { "0.4.0"."backtrace" =
        (f.parking_lot_core."0.4.0"."backtrace" or false) ||
        (f.parking_lot_core."0.4.0".deadlock_detection or false) ||
        (parking_lot_core."0.4.0"."deadlock_detection" or false); }
      { "0.4.0"."petgraph" =
        (f.parking_lot_core."0.4.0"."petgraph" or false) ||
        (f.parking_lot_core."0.4.0".deadlock_detection or false) ||
        (parking_lot_core."0.4.0"."deadlock_detection" or false); }
      { "0.4.0"."thread-id" =
        (f.parking_lot_core."0.4.0"."thread-id" or false) ||
        (f.parking_lot_core."0.4.0".deadlock_detection or false) ||
        (parking_lot_core."0.4.0"."deadlock_detection" or false); }
      { "0.4.0".default = (f.parking_lot_core."0.4.0".default or true); }
    ];
    rand."${deps.parking_lot_core."0.4.0".rand}".default = true;
    rustc_version."${deps.parking_lot_core."0.4.0".rustc_version}".default = true;
    smallvec."${deps.parking_lot_core."0.4.0".smallvec}".default = true;
    winapi = fold recursiveUpdate {} [
      { "${deps.parking_lot_core."0.4.0".winapi}"."errhandlingapi" = true; }
      { "${deps.parking_lot_core."0.4.0".winapi}"."handleapi" = true; }
      { "${deps.parking_lot_core."0.4.0".winapi}"."minwindef" = true; }
      { "${deps.parking_lot_core."0.4.0".winapi}"."ntstatus" = true; }
      { "${deps.parking_lot_core."0.4.0".winapi}"."winbase" = true; }
      { "${deps.parking_lot_core."0.4.0".winapi}"."winerror" = true; }
      { "${deps.parking_lot_core."0.4.0".winapi}"."winnt" = true; }
      { "${deps.parking_lot_core."0.4.0".winapi}".default = true; }
    ];
  }) [
    (features_.rand."${deps."parking_lot_core"."0.4.0"."rand"}" deps)
    (features_.smallvec."${deps."parking_lot_core"."0.4.0"."smallvec"}" deps)
    (features_.rustc_version."${deps."parking_lot_core"."0.4.0"."rustc_version"}" deps)
    (features_.libc."${deps."parking_lot_core"."0.4.0"."libc"}" deps)
    (features_.winapi."${deps."parking_lot_core"."0.4.0"."winapi"}" deps)
  ];


# end
# peeking_take_while-0.1.2

  crates.peeking_take_while."0.1.2" = deps: { features?(features_.peeking_take_while."0.1.2" deps {}) }: buildRustCrate {
    crateName = "peeking_take_while";
    version = "0.1.2";
    description = "Like `Iterator::take_while`, but calls the predicate on a peeked value. This allows you to use `Iterator::by_ref` and `Iterator::take_while` together, and still get the first value for which the `take_while` predicate returned false after dropping the `by_ref`.";
    authors = [ "Nick Fitzgerald <fitzgen@gmail.com>" ];
    sha256 = "1vdaxp3c73divj5rbyb2wm9pz61rg5idgh1g7bifnllf7xhw15zr";
  };
  features_.peeking_take_while."0.1.2" = deps: f: updateFeatures f (rec {
    peeking_take_while."0.1.2".default = (f.peeking_take_while."0.1.2".default or true);
  }) [];


# end
# percent-encoding-1.0.1

  crates.percent_encoding."1.0.1" = deps: { features?(features_.percent_encoding."1.0.1" deps {}) }: buildRustCrate {
    crateName = "percent-encoding";
    version = "1.0.1";
    description = "Percent encoding and decoding";
    authors = [ "The rust-url developers" ];
    sha256 = "04ahrp7aw4ip7fmadb0bknybmkfav0kk0gw4ps3ydq5w6hr0ib5i";
    libPath = "lib.rs";
  };
  features_.percent_encoding."1.0.1" = deps: f: updateFeatures f (rec {
    percent_encoding."1.0.1".default = (f.percent_encoding."1.0.1".default or true);
  }) [];


# end
# phf-0.7.24

  crates.phf."0.7.24" = deps: { features?(features_.phf."0.7.24" deps {}) }: buildRustCrate {
    crateName = "phf";
    version = "0.7.24";
    description = "Runtime support for perfect hash function data structures";
    authors = [ "Steven Fackler <sfackler@gmail.com>" ];
    sha256 = "19mmhmafd1dhywc7pzkmd1nq0kjfvg57viny20jqa91hhprf2dv5";
    libPath = "src/lib.rs";
    dependencies = mapFeatures features ([
      (crates."phf_shared"."${deps."phf"."0.7.24"."phf_shared"}" deps)
    ]);
    features = mkFeatures (features."phf"."0.7.24" or {});
  };
  features_.phf."0.7.24" = deps: f: updateFeatures f (rec {
    phf = fold recursiveUpdate {} [
      { "0.7.24"."phf_macros" =
        (f.phf."0.7.24"."phf_macros" or false) ||
        (f.phf."0.7.24".macros or false) ||
        (phf."0.7.24"."macros" or false); }
      { "0.7.24".default = (f.phf."0.7.24".default or true); }
    ];
    phf_shared = fold recursiveUpdate {} [
      { "${deps.phf."0.7.24".phf_shared}"."core" =
        (f.phf_shared."${deps.phf."0.7.24".phf_shared}"."core" or false) ||
        (phf."0.7.24"."core" or false) ||
        (f."phf"."0.7.24"."core" or false); }
      { "${deps.phf."0.7.24".phf_shared}"."unicase" =
        (f.phf_shared."${deps.phf."0.7.24".phf_shared}"."unicase" or false) ||
        (phf."0.7.24"."unicase" or false) ||
        (f."phf"."0.7.24"."unicase" or false); }
      { "${deps.phf."0.7.24".phf_shared}".default = true; }
    ];
  }) [
    (features_.phf_shared."${deps."phf"."0.7.24"."phf_shared"}" deps)
  ];


# end
# phf_codegen-0.7.24

  crates.phf_codegen."0.7.24" = deps: { features?(features_.phf_codegen."0.7.24" deps {}) }: buildRustCrate {
    crateName = "phf_codegen";
    version = "0.7.24";
    description = "Codegen library for PHF types";
    authors = [ "Steven Fackler <sfackler@gmail.com>" ];
    sha256 = "0avkx97r4ph8rv70wwgniarlcfiq27yd74gmnxfdv3rx840cyf8g";
    dependencies = mapFeatures features ([
      (crates."phf_generator"."${deps."phf_codegen"."0.7.24"."phf_generator"}" deps)
      (crates."phf_shared"."${deps."phf_codegen"."0.7.24"."phf_shared"}" deps)
    ]);
  };
  features_.phf_codegen."0.7.24" = deps: f: updateFeatures f (rec {
    phf_codegen."0.7.24".default = (f.phf_codegen."0.7.24".default or true);
    phf_generator."${deps.phf_codegen."0.7.24".phf_generator}".default = true;
    phf_shared."${deps.phf_codegen."0.7.24".phf_shared}".default = true;
  }) [
    (features_.phf_generator."${deps."phf_codegen"."0.7.24"."phf_generator"}" deps)
    (features_.phf_shared."${deps."phf_codegen"."0.7.24"."phf_shared"}" deps)
  ];


# end
# phf_generator-0.7.24

  crates.phf_generator."0.7.24" = deps: { features?(features_.phf_generator."0.7.24" deps {}) }: buildRustCrate {
    crateName = "phf_generator";
    version = "0.7.24";
    description = "PHF generation logic";
    authors = [ "Steven Fackler <sfackler@gmail.com>" ];
    sha256 = "1frn2jfydinifxb1fki0xnnsxf0f1ciaa79jz415r5qhw1ash72j";
    dependencies = mapFeatures features ([
      (crates."phf_shared"."${deps."phf_generator"."0.7.24"."phf_shared"}" deps)
      (crates."rand"."${deps."phf_generator"."0.7.24"."rand"}" deps)
    ]);
  };
  features_.phf_generator."0.7.24" = deps: f: updateFeatures f (rec {
    phf_generator."0.7.24".default = (f.phf_generator."0.7.24".default or true);
    phf_shared."${deps.phf_generator."0.7.24".phf_shared}".default = true;
    rand."${deps.phf_generator."0.7.24".rand}".default = true;
  }) [
    (features_.phf_shared."${deps."phf_generator"."0.7.24"."phf_shared"}" deps)
    (features_.rand."${deps."phf_generator"."0.7.24"."rand"}" deps)
  ];


# end
# phf_shared-0.7.24

  crates.phf_shared."0.7.24" = deps: { features?(features_.phf_shared."0.7.24" deps {}) }: buildRustCrate {
    crateName = "phf_shared";
    version = "0.7.24";
    description = "Support code shared by PHF libraries";
    authors = [ "Steven Fackler <sfackler@gmail.com>" ];
    sha256 = "1hndqn461jvm2r269ym4qh7fnjc6n8yy53avc2pb43p70vxhm9rl";
    libPath = "src/lib.rs";
    dependencies = mapFeatures features ([
      (crates."siphasher"."${deps."phf_shared"."0.7.24"."siphasher"}" deps)
    ]
      ++ (if features.phf_shared."0.7.24".unicase or false then [ (crates.unicase."${deps."phf_shared"."0.7.24".unicase}" deps) ] else []));
    features = mkFeatures (features."phf_shared"."0.7.24" or {});
  };
  features_.phf_shared."0.7.24" = deps: f: updateFeatures f (rec {
    phf_shared."0.7.24".default = (f.phf_shared."0.7.24".default or true);
    siphasher."${deps.phf_shared."0.7.24".siphasher}".default = true;
    unicase."${deps.phf_shared."0.7.24".unicase}".default = true;
  }) [
    (features_.siphasher."${deps."phf_shared"."0.7.24"."siphasher"}" deps)
    (features_.unicase."${deps."phf_shared"."0.7.24"."unicase"}" deps)
  ];


# end
# pkg-config-0.3.14

  crates.pkg_config."0.3.14" = deps: { features?(features_.pkg_config."0.3.14" deps {}) }: buildRustCrate {
    crateName = "pkg-config";
    version = "0.3.14";
    description = "A library to run the pkg-config system tool at build time in order to be used in\nCargo build scripts.\n";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "0207fsarrm412j0dh87lfcas72n8mxar7q3mgflsbsrqnb140sv6";
  };
  features_.pkg_config."0.3.14" = deps: f: updateFeatures f (rec {
    pkg_config."0.3.14".default = (f.pkg_config."0.3.14".default or true);
  }) [];


# end
# proc-macro2-0.3.5

  crates.proc_macro2."0.3.5" = deps: { features?(features_.proc_macro2."0.3.5" deps {}) }: buildRustCrate {
    crateName = "proc-macro2";
    version = "0.3.5";
    description = "A stable implementation of the upcoming new `proc_macro` API. Comes with an\noption, off by default, to also reimplement itself in terms of the upstream\nunstable API.\n";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "0wkwj19ygy8ffdpixgj8da8c1p6ab8dh5hccyn8fjg8rhv8nvqcd";
    dependencies = mapFeatures features ([
      (crates."unicode_xid"."${deps."proc_macro2"."0.3.5"."unicode_xid"}" deps)
    ]);
    features = mkFeatures (features."proc_macro2"."0.3.5" or {});
  };
  features_.proc_macro2."0.3.5" = deps: f: updateFeatures f (rec {
    proc_macro2 = fold recursiveUpdate {} [
      { "0.3.5"."proc-macro" =
        (f.proc_macro2."0.3.5"."proc-macro" or false) ||
        (f.proc_macro2."0.3.5".default or false) ||
        (proc_macro2."0.3.5"."default" or false) ||
        (f.proc_macro2."0.3.5".nightly or false) ||
        (proc_macro2."0.3.5"."nightly" or false); }
      { "0.3.5".default = (f.proc_macro2."0.3.5".default or true); }
    ];
    unicode_xid."${deps.proc_macro2."0.3.5".unicode_xid}".default = true;
  }) [
    (features_.unicode_xid."${deps."proc_macro2"."0.3.5"."unicode_xid"}" deps)
  ];


# end
# proc-macro2-0.4.29

  crates.proc_macro2."0.4.29" = deps: { features?(features_.proc_macro2."0.4.29" deps {}) }: buildRustCrate {
    crateName = "proc-macro2";
    version = "0.4.29";
    description = "A stable implementation of the upcoming new `proc_macro` API. Comes with an\noption, off by default, to also reimplement itself in terms of the upstream\nunstable API.\n";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "08jfiqzh7drl67061aiwv9g93rpzydg39wvsyw4jn2h3n6chw1x3";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."unicode_xid"."${deps."proc_macro2"."0.4.29"."unicode_xid"}" deps)
    ]);
    features = mkFeatures (features."proc_macro2"."0.4.29" or {});
  };
  features_.proc_macro2."0.4.29" = deps: f: updateFeatures f (rec {
    proc_macro2 = fold recursiveUpdate {} [
      { "0.4.29"."proc-macro" =
        (f.proc_macro2."0.4.29"."proc-macro" or false) ||
        (f.proc_macro2."0.4.29".default or false) ||
        (proc_macro2."0.4.29"."default" or false); }
      { "0.4.29".default = (f.proc_macro2."0.4.29".default or true); }
    ];
    unicode_xid."${deps.proc_macro2."0.4.29".unicode_xid}".default = true;
  }) [
    (features_.unicode_xid."${deps."proc_macro2"."0.4.29"."unicode_xid"}" deps)
  ];


# end
# publicsuffix-1.5.2

  crates.publicsuffix."1.5.2" = deps: { features?(features_.publicsuffix."1.5.2" deps {}) }: buildRustCrate {
    crateName = "publicsuffix";
    version = "1.5.2";
    description = "Robust domain name parsing and RFC compliant email address validation";
    authors = [ "rushmorem <rushmore@webenchanter.com>" ];
    sha256 = "0iind4s270k5fvw0qjsvwndrp2rr6nypz83xy3ljsajidydxjh3r";
    dependencies = mapFeatures features ([
      (crates."error_chain"."${deps."publicsuffix"."1.5.2"."error_chain"}" deps)
      (crates."idna"."${deps."publicsuffix"."1.5.2"."idna"}" deps)
      (crates."lazy_static"."${deps."publicsuffix"."1.5.2"."lazy_static"}" deps)
      (crates."regex"."${deps."publicsuffix"."1.5.2"."regex"}" deps)
      (crates."url"."${deps."publicsuffix"."1.5.2"."url"}" deps)
    ]);
    features = mkFeatures (features."publicsuffix"."1.5.2" or {});
  };
  features_.publicsuffix."1.5.2" = deps: f: updateFeatures f (rec {
    error_chain."${deps.publicsuffix."1.5.2".error_chain}".default = true;
    idna."${deps.publicsuffix."1.5.2".idna}".default = true;
    lazy_static."${deps.publicsuffix."1.5.2".lazy_static}".default = true;
    publicsuffix = fold recursiveUpdate {} [
      { "1.5.2"."native-tls" =
        (f.publicsuffix."1.5.2"."native-tls" or false) ||
        (f.publicsuffix."1.5.2".remote_list or false) ||
        (publicsuffix."1.5.2"."remote_list" or false); }
      { "1.5.2"."remote_list" =
        (f.publicsuffix."1.5.2"."remote_list" or false) ||
        (f.publicsuffix."1.5.2".default or false) ||
        (publicsuffix."1.5.2"."default" or false); }
      { "1.5.2".default = (f.publicsuffix."1.5.2".default or true); }
    ];
    regex."${deps.publicsuffix."1.5.2".regex}".default = true;
    url."${deps.publicsuffix."1.5.2".url}".default = true;
  }) [
    (features_.error_chain."${deps."publicsuffix"."1.5.2"."error_chain"}" deps)
    (features_.idna."${deps."publicsuffix"."1.5.2"."idna"}" deps)
    (features_.lazy_static."${deps."publicsuffix"."1.5.2"."lazy_static"}" deps)
    (features_.regex."${deps."publicsuffix"."1.5.2"."regex"}" deps)
    (features_.url."${deps."publicsuffix"."1.5.2"."url"}" deps)
  ];


# end
# quick-error-1.2.2

  crates.quick_error."1.2.2" = deps: { features?(features_.quick_error."1.2.2" deps {}) }: buildRustCrate {
    crateName = "quick-error";
    version = "1.2.2";
    description = "    A macro which makes error types pleasant to write.\n";
    authors = [ "Paul Colomiets <paul@colomiets.name>" "Colin Kiegel <kiegel@gmx.de>" ];
    sha256 = "192a3adc5phgpibgqblsdx1b421l5yg9bjbmv552qqq9f37h60k5";
  };
  features_.quick_error."1.2.2" = deps: f: updateFeatures f (rec {
    quick_error."1.2.2".default = (f.quick_error."1.2.2".default or true);
  }) [];


# end
# quote-0.5.2

  crates.quote."0.5.2" = deps: { features?(features_.quote."0.5.2" deps {}) }: buildRustCrate {
    crateName = "quote";
    version = "0.5.2";
    description = "Quasi-quoting macro quote!(...)";
    authors = [ "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "062cnp12j09x0z0nj4j5pfh26h35zlrks07asxgqhfhcym1ba595";
    dependencies = mapFeatures features ([
      (crates."proc_macro2"."${deps."quote"."0.5.2"."proc_macro2"}" deps)
    ]);
    features = mkFeatures (features."quote"."0.5.2" or {});
  };
  features_.quote."0.5.2" = deps: f: updateFeatures f (rec {
    proc_macro2 = fold recursiveUpdate {} [
      { "${deps.quote."0.5.2".proc_macro2}"."proc-macro" =
        (f.proc_macro2."${deps.quote."0.5.2".proc_macro2}"."proc-macro" or false) ||
        (quote."0.5.2"."proc-macro" or false) ||
        (f."quote"."0.5.2"."proc-macro" or false); }
      { "${deps.quote."0.5.2".proc_macro2}".default = (f.proc_macro2."${deps.quote."0.5.2".proc_macro2}".default or false); }
    ];
    quote = fold recursiveUpdate {} [
      { "0.5.2"."proc-macro" =
        (f.quote."0.5.2"."proc-macro" or false) ||
        (f.quote."0.5.2".default or false) ||
        (quote."0.5.2"."default" or false); }
      { "0.5.2".default = (f.quote."0.5.2".default or true); }
    ];
  }) [
    (features_.proc_macro2."${deps."quote"."0.5.2"."proc_macro2"}" deps)
  ];


# end
# quote-0.6.12

  crates.quote."0.6.12" = deps: { features?(features_.quote."0.6.12" deps {}) }: buildRustCrate {
    crateName = "quote";
    version = "0.6.12";
    description = "Quasi-quoting macro quote!(...)";
    authors = [ "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "1ckd2d2sy0hrwrqcr47dn0n3hyh7ygpc026l8xaycccyg27mihv9";
    dependencies = mapFeatures features ([
      (crates."proc_macro2"."${deps."quote"."0.6.12"."proc_macro2"}" deps)
    ]);
    features = mkFeatures (features."quote"."0.6.12" or {});
  };
  features_.quote."0.6.12" = deps: f: updateFeatures f (rec {
    proc_macro2 = fold recursiveUpdate {} [
      { "${deps.quote."0.6.12".proc_macro2}"."proc-macro" =
        (f.proc_macro2."${deps.quote."0.6.12".proc_macro2}"."proc-macro" or false) ||
        (quote."0.6.12"."proc-macro" or false) ||
        (f."quote"."0.6.12"."proc-macro" or false); }
      { "${deps.quote."0.6.12".proc_macro2}".default = (f.proc_macro2."${deps.quote."0.6.12".proc_macro2}".default or false); }
    ];
    quote = fold recursiveUpdate {} [
      { "0.6.12"."proc-macro" =
        (f.quote."0.6.12"."proc-macro" or false) ||
        (f.quote."0.6.12".default or false) ||
        (quote."0.6.12"."default" or false); }
      { "0.6.12".default = (f.quote."0.6.12".default or true); }
    ];
  }) [
    (features_.proc_macro2."${deps."quote"."0.6.12"."proc_macro2"}" deps)
  ];


# end
# rand-0.4.6

  crates.rand."0.4.6" = deps: { features?(features_.rand."0.4.6" deps {}) }: buildRustCrate {
    crateName = "rand";
    version = "0.4.6";
    description = "Random number generators and other randomness functionality.\n";
    authors = [ "The Rust Project Developers" ];
    sha256 = "0c3rmg5q7d6qdi7cbmg5py9alm70wd3xsg0mmcawrnl35qv37zfs";
    dependencies = (if abi == "sgx" then mapFeatures features ([
      (crates."rand_core"."${deps."rand"."0.4.6"."rand_core"}" deps)
      (crates."rdrand"."${deps."rand"."0.4.6"."rdrand"}" deps)
    ]) else [])
      ++ (if kernel == "fuchsia" then mapFeatures features ([
      (crates."fuchsia_cprng"."${deps."rand"."0.4.6"."fuchsia_cprng"}" deps)
    ]) else [])
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
    ]
      ++ (if features.rand."0.4.6".libc or false then [ (crates.libc."${deps."rand"."0.4.6".libc}" deps) ] else [])) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."rand"."0.4.6"."winapi"}" deps)
    ]) else []);
    features = mkFeatures (features."rand"."0.4.6" or {});
  };
  features_.rand."0.4.6" = deps: f: updateFeatures f (rec {
    fuchsia_cprng."${deps.rand."0.4.6".fuchsia_cprng}".default = true;
    libc."${deps.rand."0.4.6".libc}".default = true;
    rand = fold recursiveUpdate {} [
      { "0.4.6"."i128_support" =
        (f.rand."0.4.6"."i128_support" or false) ||
        (f.rand."0.4.6".nightly or false) ||
        (rand."0.4.6"."nightly" or false); }
      { "0.4.6"."libc" =
        (f.rand."0.4.6"."libc" or false) ||
        (f.rand."0.4.6".std or false) ||
        (rand."0.4.6"."std" or false); }
      { "0.4.6"."std" =
        (f.rand."0.4.6"."std" or false) ||
        (f.rand."0.4.6".default or false) ||
        (rand."0.4.6"."default" or false); }
      { "0.4.6".default = (f.rand."0.4.6".default or true); }
    ];
    rand_core."${deps.rand."0.4.6".rand_core}".default = (f.rand_core."${deps.rand."0.4.6".rand_core}".default or false);
    rdrand."${deps.rand."0.4.6".rdrand}".default = true;
    winapi = fold recursiveUpdate {} [
      { "${deps.rand."0.4.6".winapi}"."minwindef" = true; }
      { "${deps.rand."0.4.6".winapi}"."ntsecapi" = true; }
      { "${deps.rand."0.4.6".winapi}"."profileapi" = true; }
      { "${deps.rand."0.4.6".winapi}"."winnt" = true; }
      { "${deps.rand."0.4.6".winapi}".default = true; }
    ];
  }) [
    (features_.rand_core."${deps."rand"."0.4.6"."rand_core"}" deps)
    (features_.rdrand."${deps."rand"."0.4.6"."rdrand"}" deps)
    (features_.fuchsia_cprng."${deps."rand"."0.4.6"."fuchsia_cprng"}" deps)
    (features_.libc."${deps."rand"."0.4.6"."libc"}" deps)
    (features_.winapi."${deps."rand"."0.4.6"."winapi"}" deps)
  ];


# end
# rand-0.5.6

  crates.rand."0.5.6" = deps: { features?(features_.rand."0.5.6" deps {}) }: buildRustCrate {
    crateName = "rand";
    version = "0.5.6";
    description = "Random number generators and other randomness functionality.\n";
    authors = [ "The Rust Project Developers" ];
    sha256 = "04f1gydiia347cx24n5cw4v21fhh9yga7dw739z4jsxzls2ss8w8";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand"."0.5.6"."rand_core"}" deps)
    ])
      ++ (if kernel == "cloudabi" then mapFeatures features ([
    ]
      ++ (if features.rand."0.5.6".cloudabi or false then [ (crates.cloudabi."${deps."rand"."0.5.6".cloudabi}" deps) ] else [])) else [])
      ++ (if kernel == "fuchsia" then mapFeatures features ([
    ]
      ++ (if features.rand."0.5.6".fuchsia-cprng or false then [ (crates.fuchsia_cprng."${deps."rand"."0.5.6".fuchsia_cprng}" deps) ] else [])) else [])
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
    ]
      ++ (if features.rand."0.5.6".libc or false then [ (crates.libc."${deps."rand"."0.5.6".libc}" deps) ] else [])) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
    ]
      ++ (if features.rand."0.5.6".winapi or false then [ (crates.winapi."${deps."rand"."0.5.6".winapi}" deps) ] else [])) else [])
      ++ (if kernel == "wasm32-unknown-unknown" then mapFeatures features ([
]) else []);
    features = mkFeatures (features."rand"."0.5.6" or {});
  };
  features_.rand."0.5.6" = deps: f: updateFeatures f (rec {
    cloudabi."${deps.rand."0.5.6".cloudabi}".default = true;
    fuchsia_cprng."${deps.rand."0.5.6".fuchsia_cprng}".default = true;
    libc."${deps.rand."0.5.6".libc}".default = true;
    rand = fold recursiveUpdate {} [
      { "0.5.6"."alloc" =
        (f.rand."0.5.6"."alloc" or false) ||
        (f.rand."0.5.6".std or false) ||
        (rand."0.5.6"."std" or false); }
      { "0.5.6"."cloudabi" =
        (f.rand."0.5.6"."cloudabi" or false) ||
        (f.rand."0.5.6".std or false) ||
        (rand."0.5.6"."std" or false); }
      { "0.5.6"."fuchsia-cprng" =
        (f.rand."0.5.6"."fuchsia-cprng" or false) ||
        (f.rand."0.5.6".std or false) ||
        (rand."0.5.6"."std" or false); }
      { "0.5.6"."i128_support" =
        (f.rand."0.5.6"."i128_support" or false) ||
        (f.rand."0.5.6".nightly or false) ||
        (rand."0.5.6"."nightly" or false); }
      { "0.5.6"."libc" =
        (f.rand."0.5.6"."libc" or false) ||
        (f.rand."0.5.6".std or false) ||
        (rand."0.5.6"."std" or false); }
      { "0.5.6"."serde" =
        (f.rand."0.5.6"."serde" or false) ||
        (f.rand."0.5.6".serde1 or false) ||
        (rand."0.5.6"."serde1" or false); }
      { "0.5.6"."serde_derive" =
        (f.rand."0.5.6"."serde_derive" or false) ||
        (f.rand."0.5.6".serde1 or false) ||
        (rand."0.5.6"."serde1" or false); }
      { "0.5.6"."std" =
        (f.rand."0.5.6"."std" or false) ||
        (f.rand."0.5.6".default or false) ||
        (rand."0.5.6"."default" or false); }
      { "0.5.6"."winapi" =
        (f.rand."0.5.6"."winapi" or false) ||
        (f.rand."0.5.6".std or false) ||
        (rand."0.5.6"."std" or false); }
      { "0.5.6".default = (f.rand."0.5.6".default or true); }
    ];
    rand_core = fold recursiveUpdate {} [
      { "${deps.rand."0.5.6".rand_core}"."alloc" =
        (f.rand_core."${deps.rand."0.5.6".rand_core}"."alloc" or false) ||
        (rand."0.5.6"."alloc" or false) ||
        (f."rand"."0.5.6"."alloc" or false); }
      { "${deps.rand."0.5.6".rand_core}"."serde1" =
        (f.rand_core."${deps.rand."0.5.6".rand_core}"."serde1" or false) ||
        (rand."0.5.6"."serde1" or false) ||
        (f."rand"."0.5.6"."serde1" or false); }
      { "${deps.rand."0.5.6".rand_core}"."std" =
        (f.rand_core."${deps.rand."0.5.6".rand_core}"."std" or false) ||
        (rand."0.5.6"."std" or false) ||
        (f."rand"."0.5.6"."std" or false); }
      { "${deps.rand."0.5.6".rand_core}".default = (f.rand_core."${deps.rand."0.5.6".rand_core}".default or false); }
    ];
    winapi = fold recursiveUpdate {} [
      { "${deps.rand."0.5.6".winapi}"."minwindef" = true; }
      { "${deps.rand."0.5.6".winapi}"."ntsecapi" = true; }
      { "${deps.rand."0.5.6".winapi}"."profileapi" = true; }
      { "${deps.rand."0.5.6".winapi}"."winnt" = true; }
      { "${deps.rand."0.5.6".winapi}".default = true; }
    ];
  }) [
    (features_.rand_core."${deps."rand"."0.5.6"."rand_core"}" deps)
    (features_.cloudabi."${deps."rand"."0.5.6"."cloudabi"}" deps)
    (features_.fuchsia_cprng."${deps."rand"."0.5.6"."fuchsia_cprng"}" deps)
    (features_.libc."${deps."rand"."0.5.6"."libc"}" deps)
    (features_.winapi."${deps."rand"."0.5.6"."winapi"}" deps)
  ];


# end
# rand-0.6.5

  crates.rand."0.6.5" = deps: { features?(features_.rand."0.6.5" deps {}) }: buildRustCrate {
    crateName = "rand";
    version = "0.6.5";
    description = "Random number generators and other randomness functionality.\n";
    authors = [ "The Rand Project Developers" "The Rust Project Developers" ];
    sha256 = "0zbck48159aj8zrwzf80sd9xxh96w4f4968nshwjpysjvflimvgb";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."rand_chacha"."${deps."rand"."0.6.5"."rand_chacha"}" deps)
      (crates."rand_core"."${deps."rand"."0.6.5"."rand_core"}" deps)
      (crates."rand_hc"."${deps."rand"."0.6.5"."rand_hc"}" deps)
      (crates."rand_isaac"."${deps."rand"."0.6.5"."rand_isaac"}" deps)
      (crates."rand_jitter"."${deps."rand"."0.6.5"."rand_jitter"}" deps)
      (crates."rand_pcg"."${deps."rand"."0.6.5"."rand_pcg"}" deps)
      (crates."rand_xorshift"."${deps."rand"."0.6.5"."rand_xorshift"}" deps)
    ]
      ++ (if features.rand."0.6.5".rand_os or false then [ (crates.rand_os."${deps."rand"."0.6.5".rand_os}" deps) ] else []))
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."rand"."0.6.5"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."rand"."0.6.5"."winapi"}" deps)
    ]) else []);

    buildDependencies = mapFeatures features ([
      (crates."autocfg"."${deps."rand"."0.6.5"."autocfg"}" deps)
    ]);
    features = mkFeatures (features."rand"."0.6.5" or {});
  };
  features_.rand."0.6.5" = deps: f: updateFeatures f (rec {
    autocfg."${deps.rand."0.6.5".autocfg}".default = true;
    libc."${deps.rand."0.6.5".libc}".default = (f.libc."${deps.rand."0.6.5".libc}".default or false);
    rand = fold recursiveUpdate {} [
      { "0.6.5"."alloc" =
        (f.rand."0.6.5"."alloc" or false) ||
        (f.rand."0.6.5".std or false) ||
        (rand."0.6.5"."std" or false); }
      { "0.6.5"."packed_simd" =
        (f.rand."0.6.5"."packed_simd" or false) ||
        (f.rand."0.6.5".simd_support or false) ||
        (rand."0.6.5"."simd_support" or false); }
      { "0.6.5"."rand_os" =
        (f.rand."0.6.5"."rand_os" or false) ||
        (f.rand."0.6.5".std or false) ||
        (rand."0.6.5"."std" or false); }
      { "0.6.5"."simd_support" =
        (f.rand."0.6.5"."simd_support" or false) ||
        (f.rand."0.6.5".nightly or false) ||
        (rand."0.6.5"."nightly" or false); }
      { "0.6.5"."std" =
        (f.rand."0.6.5"."std" or false) ||
        (f.rand."0.6.5".default or false) ||
        (rand."0.6.5"."default" or false); }
      { "0.6.5".default = (f.rand."0.6.5".default or true); }
    ];
    rand_chacha."${deps.rand."0.6.5".rand_chacha}".default = true;
    rand_core = fold recursiveUpdate {} [
      { "${deps.rand."0.6.5".rand_core}"."alloc" =
        (f.rand_core."${deps.rand."0.6.5".rand_core}"."alloc" or false) ||
        (rand."0.6.5"."alloc" or false) ||
        (f."rand"."0.6.5"."alloc" or false); }
      { "${deps.rand."0.6.5".rand_core}"."serde1" =
        (f.rand_core."${deps.rand."0.6.5".rand_core}"."serde1" or false) ||
        (rand."0.6.5"."serde1" or false) ||
        (f."rand"."0.6.5"."serde1" or false); }
      { "${deps.rand."0.6.5".rand_core}"."std" =
        (f.rand_core."${deps.rand."0.6.5".rand_core}"."std" or false) ||
        (rand."0.6.5"."std" or false) ||
        (f."rand"."0.6.5"."std" or false); }
      { "${deps.rand."0.6.5".rand_core}".default = true; }
    ];
    rand_hc."${deps.rand."0.6.5".rand_hc}".default = true;
    rand_isaac = fold recursiveUpdate {} [
      { "${deps.rand."0.6.5".rand_isaac}"."serde1" =
        (f.rand_isaac."${deps.rand."0.6.5".rand_isaac}"."serde1" or false) ||
        (rand."0.6.5"."serde1" or false) ||
        (f."rand"."0.6.5"."serde1" or false); }
      { "${deps.rand."0.6.5".rand_isaac}".default = true; }
    ];
    rand_jitter = fold recursiveUpdate {} [
      { "${deps.rand."0.6.5".rand_jitter}"."std" =
        (f.rand_jitter."${deps.rand."0.6.5".rand_jitter}"."std" or false) ||
        (rand."0.6.5"."std" or false) ||
        (f."rand"."0.6.5"."std" or false); }
      { "${deps.rand."0.6.5".rand_jitter}".default = true; }
    ];
    rand_os = fold recursiveUpdate {} [
      { "${deps.rand."0.6.5".rand_os}"."stdweb" =
        (f.rand_os."${deps.rand."0.6.5".rand_os}"."stdweb" or false) ||
        (rand."0.6.5"."stdweb" or false) ||
        (f."rand"."0.6.5"."stdweb" or false); }
      { "${deps.rand."0.6.5".rand_os}"."wasm-bindgen" =
        (f.rand_os."${deps.rand."0.6.5".rand_os}"."wasm-bindgen" or false) ||
        (rand."0.6.5"."wasm-bindgen" or false) ||
        (f."rand"."0.6.5"."wasm-bindgen" or false); }
      { "${deps.rand."0.6.5".rand_os}".default = true; }
    ];
    rand_pcg."${deps.rand."0.6.5".rand_pcg}".default = true;
    rand_xorshift = fold recursiveUpdate {} [
      { "${deps.rand."0.6.5".rand_xorshift}"."serde1" =
        (f.rand_xorshift."${deps.rand."0.6.5".rand_xorshift}"."serde1" or false) ||
        (rand."0.6.5"."serde1" or false) ||
        (f."rand"."0.6.5"."serde1" or false); }
      { "${deps.rand."0.6.5".rand_xorshift}".default = true; }
    ];
    winapi = fold recursiveUpdate {} [
      { "${deps.rand."0.6.5".winapi}"."minwindef" = true; }
      { "${deps.rand."0.6.5".winapi}"."ntsecapi" = true; }
      { "${deps.rand."0.6.5".winapi}"."profileapi" = true; }
      { "${deps.rand."0.6.5".winapi}"."winnt" = true; }
      { "${deps.rand."0.6.5".winapi}".default = true; }
    ];
  }) [
    (features_.rand_chacha."${deps."rand"."0.6.5"."rand_chacha"}" deps)
    (features_.rand_core."${deps."rand"."0.6.5"."rand_core"}" deps)
    (features_.rand_hc."${deps."rand"."0.6.5"."rand_hc"}" deps)
    (features_.rand_isaac."${deps."rand"."0.6.5"."rand_isaac"}" deps)
    (features_.rand_jitter."${deps."rand"."0.6.5"."rand_jitter"}" deps)
    (features_.rand_os."${deps."rand"."0.6.5"."rand_os"}" deps)
    (features_.rand_pcg."${deps."rand"."0.6.5"."rand_pcg"}" deps)
    (features_.rand_xorshift."${deps."rand"."0.6.5"."rand_xorshift"}" deps)
    (features_.autocfg."${deps."rand"."0.6.5"."autocfg"}" deps)
    (features_.libc."${deps."rand"."0.6.5"."libc"}" deps)
    (features_.winapi."${deps."rand"."0.6.5"."winapi"}" deps)
  ];


# end
# rand_chacha-0.1.1

  crates.rand_chacha."0.1.1" = deps: { features?(features_.rand_chacha."0.1.1" deps {}) }: buildRustCrate {
    crateName = "rand_chacha";
    version = "0.1.1";
    description = "ChaCha random number generator\n";
    authors = [ "The Rand Project Developers" "The Rust Project Developers" ];
    sha256 = "0xnxm4mjd7wjnh18zxc1yickw58axbycp35ciraplqdfwn1gffwi";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_chacha"."0.1.1"."rand_core"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."autocfg"."${deps."rand_chacha"."0.1.1"."autocfg"}" deps)
    ]);
  };
  features_.rand_chacha."0.1.1" = deps: f: updateFeatures f (rec {
    autocfg."${deps.rand_chacha."0.1.1".autocfg}".default = true;
    rand_chacha."0.1.1".default = (f.rand_chacha."0.1.1".default or true);
    rand_core."${deps.rand_chacha."0.1.1".rand_core}".default = (f.rand_core."${deps.rand_chacha."0.1.1".rand_core}".default or false);
  }) [
    (features_.rand_core."${deps."rand_chacha"."0.1.1"."rand_core"}" deps)
    (features_.autocfg."${deps."rand_chacha"."0.1.1"."autocfg"}" deps)
  ];


# end
# rand_core-0.3.1

  crates.rand_core."0.3.1" = deps: { features?(features_.rand_core."0.3.1" deps {}) }: buildRustCrate {
    crateName = "rand_core";
    version = "0.3.1";
    description = "Core random number generator traits and tools for implementation.\n";
    authors = [ "The Rand Project Developers" "The Rust Project Developers" ];
    sha256 = "0q0ssgpj9x5a6fda83nhmfydy7a6c0wvxm0jhncsmjx8qp8gw91m";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_core"."0.3.1"."rand_core"}" deps)
    ]);
    features = mkFeatures (features."rand_core"."0.3.1" or {});
  };
  features_.rand_core."0.3.1" = deps: f: updateFeatures f (rec {
    rand_core = fold recursiveUpdate {} [
      { "${deps.rand_core."0.3.1".rand_core}"."alloc" =
        (f.rand_core."${deps.rand_core."0.3.1".rand_core}"."alloc" or false) ||
        (rand_core."0.3.1"."alloc" or false) ||
        (f."rand_core"."0.3.1"."alloc" or false); }
      { "${deps.rand_core."0.3.1".rand_core}"."serde1" =
        (f.rand_core."${deps.rand_core."0.3.1".rand_core}"."serde1" or false) ||
        (rand_core."0.3.1"."serde1" or false) ||
        (f."rand_core"."0.3.1"."serde1" or false); }
      { "${deps.rand_core."0.3.1".rand_core}"."std" =
        (f.rand_core."${deps.rand_core."0.3.1".rand_core}"."std" or false) ||
        (rand_core."0.3.1"."std" or false) ||
        (f."rand_core"."0.3.1"."std" or false); }
      { "${deps.rand_core."0.3.1".rand_core}".default = true; }
      { "0.3.1"."std" =
        (f.rand_core."0.3.1"."std" or false) ||
        (f.rand_core."0.3.1".default or false) ||
        (rand_core."0.3.1"."default" or false); }
      { "0.3.1".default = (f.rand_core."0.3.1".default or true); }
    ];
  }) [
    (features_.rand_core."${deps."rand_core"."0.3.1"."rand_core"}" deps)
  ];


# end
# rand_core-0.4.0

  crates.rand_core."0.4.0" = deps: { features?(features_.rand_core."0.4.0" deps {}) }: buildRustCrate {
    crateName = "rand_core";
    version = "0.4.0";
    description = "Core random number generator traits and tools for implementation.\n";
    authors = [ "The Rand Project Developers" "The Rust Project Developers" ];
    sha256 = "0wb5iwhffibj0pnpznhv1g3i7h1fnhz64s3nz74fz6vsm3q6q3br";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."rand_core"."0.4.0" or {});
  };
  features_.rand_core."0.4.0" = deps: f: updateFeatures f (rec {
    rand_core = fold recursiveUpdate {} [
      { "0.4.0"."alloc" =
        (f.rand_core."0.4.0"."alloc" or false) ||
        (f.rand_core."0.4.0".std or false) ||
        (rand_core."0.4.0"."std" or false); }
      { "0.4.0"."serde" =
        (f.rand_core."0.4.0"."serde" or false) ||
        (f.rand_core."0.4.0".serde1 or false) ||
        (rand_core."0.4.0"."serde1" or false); }
      { "0.4.0"."serde_derive" =
        (f.rand_core."0.4.0"."serde_derive" or false) ||
        (f.rand_core."0.4.0".serde1 or false) ||
        (rand_core."0.4.0"."serde1" or false); }
      { "0.4.0".default = (f.rand_core."0.4.0".default or true); }
    ];
  }) [];


# end
# rand_hc-0.1.0

  crates.rand_hc."0.1.0" = deps: { features?(features_.rand_hc."0.1.0" deps {}) }: buildRustCrate {
    crateName = "rand_hc";
    version = "0.1.0";
    description = "HC128 random number generator\n";
    authors = [ "The Rand Project Developers" ];
    sha256 = "05agb75j87yp7y1zk8yf7bpm66hc0673r3dlypn0kazynr6fdgkz";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_hc"."0.1.0"."rand_core"}" deps)
    ]);
  };
  features_.rand_hc."0.1.0" = deps: f: updateFeatures f (rec {
    rand_core."${deps.rand_hc."0.1.0".rand_core}".default = (f.rand_core."${deps.rand_hc."0.1.0".rand_core}".default or false);
    rand_hc."0.1.0".default = (f.rand_hc."0.1.0".default or true);
  }) [
    (features_.rand_core."${deps."rand_hc"."0.1.0"."rand_core"}" deps)
  ];


# end
# rand_isaac-0.1.1

  crates.rand_isaac."0.1.1" = deps: { features?(features_.rand_isaac."0.1.1" deps {}) }: buildRustCrate {
    crateName = "rand_isaac";
    version = "0.1.1";
    description = "ISAAC random number generator\n";
    authors = [ "The Rand Project Developers" "The Rust Project Developers" ];
    sha256 = "10hhdh5b5sa03s6b63y9bafm956jwilx41s71jbrzl63ccx8lxdq";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_isaac"."0.1.1"."rand_core"}" deps)
    ]);
    features = mkFeatures (features."rand_isaac"."0.1.1" or {});
  };
  features_.rand_isaac."0.1.1" = deps: f: updateFeatures f (rec {
    rand_core = fold recursiveUpdate {} [
      { "${deps.rand_isaac."0.1.1".rand_core}"."serde1" =
        (f.rand_core."${deps.rand_isaac."0.1.1".rand_core}"."serde1" or false) ||
        (rand_isaac."0.1.1"."serde1" or false) ||
        (f."rand_isaac"."0.1.1"."serde1" or false); }
      { "${deps.rand_isaac."0.1.1".rand_core}".default = (f.rand_core."${deps.rand_isaac."0.1.1".rand_core}".default or false); }
    ];
    rand_isaac = fold recursiveUpdate {} [
      { "0.1.1"."serde" =
        (f.rand_isaac."0.1.1"."serde" or false) ||
        (f.rand_isaac."0.1.1".serde1 or false) ||
        (rand_isaac."0.1.1"."serde1" or false); }
      { "0.1.1"."serde_derive" =
        (f.rand_isaac."0.1.1"."serde_derive" or false) ||
        (f.rand_isaac."0.1.1".serde1 or false) ||
        (rand_isaac."0.1.1"."serde1" or false); }
      { "0.1.1".default = (f.rand_isaac."0.1.1".default or true); }
    ];
  }) [
    (features_.rand_core."${deps."rand_isaac"."0.1.1"."rand_core"}" deps)
  ];


# end
# rand_jitter-0.1.4

  crates.rand_jitter."0.1.4" = deps: { features?(features_.rand_jitter."0.1.4" deps {}) }: buildRustCrate {
    crateName = "rand_jitter";
    version = "0.1.4";
    description = "Random number generator based on timing jitter";
    authors = [ "The Rand Project Developers" ];
    sha256 = "13nr4h042ab9l7qcv47bxrxw3gkf2pc3cni6c9pyi4nxla0mm7b6";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_jitter"."0.1.4"."rand_core"}" deps)
    ])
      ++ (if kernel == "darwin" || kernel == "ios" then mapFeatures features ([
      (crates."libc"."${deps."rand_jitter"."0.1.4"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."rand_jitter"."0.1.4"."winapi"}" deps)
    ]) else []);
    features = mkFeatures (features."rand_jitter"."0.1.4" or {});
  };
  features_.rand_jitter."0.1.4" = deps: f: updateFeatures f (rec {
    libc."${deps.rand_jitter."0.1.4".libc}".default = true;
    rand_core = fold recursiveUpdate {} [
      { "${deps.rand_jitter."0.1.4".rand_core}"."std" =
        (f.rand_core."${deps.rand_jitter."0.1.4".rand_core}"."std" or false) ||
        (rand_jitter."0.1.4"."std" or false) ||
        (f."rand_jitter"."0.1.4"."std" or false); }
      { "${deps.rand_jitter."0.1.4".rand_core}".default = true; }
    ];
    rand_jitter."0.1.4".default = (f.rand_jitter."0.1.4".default or true);
    winapi = fold recursiveUpdate {} [
      { "${deps.rand_jitter."0.1.4".winapi}"."profileapi" = true; }
      { "${deps.rand_jitter."0.1.4".winapi}".default = true; }
    ];
  }) [
    (features_.rand_core."${deps."rand_jitter"."0.1.4"."rand_core"}" deps)
    (features_.libc."${deps."rand_jitter"."0.1.4"."libc"}" deps)
    (features_.winapi."${deps."rand_jitter"."0.1.4"."winapi"}" deps)
  ];


# end
# rand_os-0.1.3

  crates.rand_os."0.1.3" = deps: { features?(features_.rand_os."0.1.3" deps {}) }: buildRustCrate {
    crateName = "rand_os";
    version = "0.1.3";
    description = "OS backed Random Number Generator";
    authors = [ "The Rand Project Developers" ];
    sha256 = "0ywwspizgs9g8vzn6m5ix9yg36n15119d6n792h7mk4r5vs0ww4j";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_os"."0.1.3"."rand_core"}" deps)
    ])
      ++ (if abi == "sgx" then mapFeatures features ([
      (crates."rdrand"."${deps."rand_os"."0.1.3"."rdrand"}" deps)
    ]) else [])
      ++ (if kernel == "cloudabi" then mapFeatures features ([
      (crates."cloudabi"."${deps."rand_os"."0.1.3"."cloudabi"}" deps)
    ]) else [])
      ++ (if kernel == "fuchsia" then mapFeatures features ([
      (crates."fuchsia_cprng"."${deps."rand_os"."0.1.3"."fuchsia_cprng"}" deps)
    ]) else [])
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."rand_os"."0.1.3"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."rand_os"."0.1.3"."winapi"}" deps)
    ]) else [])
      ++ (if kernel == "wasm32-unknown-unknown" then mapFeatures features ([
]) else []);
  };
  features_.rand_os."0.1.3" = deps: f: updateFeatures f (rec {
    cloudabi."${deps.rand_os."0.1.3".cloudabi}".default = true;
    fuchsia_cprng."${deps.rand_os."0.1.3".fuchsia_cprng}".default = true;
    libc."${deps.rand_os."0.1.3".libc}".default = true;
    rand_core = fold recursiveUpdate {} [
      { "${deps.rand_os."0.1.3".rand_core}"."std" = true; }
      { "${deps.rand_os."0.1.3".rand_core}".default = true; }
    ];
    rand_os."0.1.3".default = (f.rand_os."0.1.3".default or true);
    rdrand."${deps.rand_os."0.1.3".rdrand}".default = true;
    winapi = fold recursiveUpdate {} [
      { "${deps.rand_os."0.1.3".winapi}"."minwindef" = true; }
      { "${deps.rand_os."0.1.3".winapi}"."ntsecapi" = true; }
      { "${deps.rand_os."0.1.3".winapi}"."winnt" = true; }
      { "${deps.rand_os."0.1.3".winapi}".default = true; }
    ];
  }) [
    (features_.rand_core."${deps."rand_os"."0.1.3"."rand_core"}" deps)
    (features_.rdrand."${deps."rand_os"."0.1.3"."rdrand"}" deps)
    (features_.cloudabi."${deps."rand_os"."0.1.3"."cloudabi"}" deps)
    (features_.fuchsia_cprng."${deps."rand_os"."0.1.3"."fuchsia_cprng"}" deps)
    (features_.libc."${deps."rand_os"."0.1.3"."libc"}" deps)
    (features_.winapi."${deps."rand_os"."0.1.3"."winapi"}" deps)
  ];


# end
# rand_pcg-0.1.2

  crates.rand_pcg."0.1.2" = deps: { features?(features_.rand_pcg."0.1.2" deps {}) }: buildRustCrate {
    crateName = "rand_pcg";
    version = "0.1.2";
    description = "Selected PCG random number generators\n";
    authors = [ "The Rand Project Developers" ];
    sha256 = "04qgi2ai2z42li5h4aawvxbpnlqyjfnipz9d6k73mdnl6p1xq938";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_pcg"."0.1.2"."rand_core"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."autocfg"."${deps."rand_pcg"."0.1.2"."autocfg"}" deps)
    ]);
    features = mkFeatures (features."rand_pcg"."0.1.2" or {});
  };
  features_.rand_pcg."0.1.2" = deps: f: updateFeatures f (rec {
    autocfg."${deps.rand_pcg."0.1.2".autocfg}".default = true;
    rand_core."${deps.rand_pcg."0.1.2".rand_core}".default = true;
    rand_pcg = fold recursiveUpdate {} [
      { "0.1.2"."serde" =
        (f.rand_pcg."0.1.2"."serde" or false) ||
        (f.rand_pcg."0.1.2".serde1 or false) ||
        (rand_pcg."0.1.2"."serde1" or false); }
      { "0.1.2"."serde_derive" =
        (f.rand_pcg."0.1.2"."serde_derive" or false) ||
        (f.rand_pcg."0.1.2".serde1 or false) ||
        (rand_pcg."0.1.2"."serde1" or false); }
      { "0.1.2".default = (f.rand_pcg."0.1.2".default or true); }
    ];
  }) [
    (features_.rand_core."${deps."rand_pcg"."0.1.2"."rand_core"}" deps)
    (features_.autocfg."${deps."rand_pcg"."0.1.2"."autocfg"}" deps)
  ];


# end
# rand_xorshift-0.1.1

  crates.rand_xorshift."0.1.1" = deps: { features?(features_.rand_xorshift."0.1.1" deps {}) }: buildRustCrate {
    crateName = "rand_xorshift";
    version = "0.1.1";
    description = "Xorshift random number generator\n";
    authors = [ "The Rand Project Developers" "The Rust Project Developers" ];
    sha256 = "0v365c4h4lzxwz5k5kp9m0661s0sss7ylv74if0xb4svis9sswnn";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_xorshift"."0.1.1"."rand_core"}" deps)
    ]);
    features = mkFeatures (features."rand_xorshift"."0.1.1" or {});
  };
  features_.rand_xorshift."0.1.1" = deps: f: updateFeatures f (rec {
    rand_core."${deps.rand_xorshift."0.1.1".rand_core}".default = (f.rand_core."${deps.rand_xorshift."0.1.1".rand_core}".default or false);
    rand_xorshift = fold recursiveUpdate {} [
      { "0.1.1"."serde" =
        (f.rand_xorshift."0.1.1"."serde" or false) ||
        (f.rand_xorshift."0.1.1".serde1 or false) ||
        (rand_xorshift."0.1.1"."serde1" or false); }
      { "0.1.1"."serde_derive" =
        (f.rand_xorshift."0.1.1"."serde_derive" or false) ||
        (f.rand_xorshift."0.1.1".serde1 or false) ||
        (rand_xorshift."0.1.1"."serde1" or false); }
      { "0.1.1".default = (f.rand_xorshift."0.1.1".default or true); }
    ];
  }) [
    (features_.rand_core."${deps."rand_xorshift"."0.1.1"."rand_core"}" deps)
  ];


# end
# rdrand-0.4.0

  crates.rdrand."0.4.0" = deps: { features?(features_.rdrand."0.4.0" deps {}) }: buildRustCrate {
    crateName = "rdrand";
    version = "0.4.0";
    description = "An implementation of random number generator based on rdrand and rdseed instructions";
    authors = [ "Simonas Kazlauskas <rdrand@kazlauskas.me>" ];
    sha256 = "15hrcasn0v876wpkwab1dwbk9kvqwrb3iv4y4dibb6yxnfvzwajk";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rdrand"."0.4.0"."rand_core"}" deps)
    ]);
    features = mkFeatures (features."rdrand"."0.4.0" or {});
  };
  features_.rdrand."0.4.0" = deps: f: updateFeatures f (rec {
    rand_core."${deps.rdrand."0.4.0".rand_core}".default = (f.rand_core."${deps.rdrand."0.4.0".rand_core}".default or false);
    rdrand = fold recursiveUpdate {} [
      { "0.4.0"."std" =
        (f.rdrand."0.4.0"."std" or false) ||
        (f.rdrand."0.4.0".default or false) ||
        (rdrand."0.4.0"."default" or false); }
      { "0.4.0".default = (f.rdrand."0.4.0".default or true); }
    ];
  }) [
    (features_.rand_core."${deps."rdrand"."0.4.0"."rand_core"}" deps)
  ];


# end
# redox_syscall-0.1.54

  crates.redox_syscall."0.1.54" = deps: { features?(features_.redox_syscall."0.1.54" deps {}) }: buildRustCrate {
    crateName = "redox_syscall";
    version = "0.1.54";
    description = "A Rust library to access raw Redox system calls";
    authors = [ "Jeremy Soller <jackpot51@gmail.com>" ];
    sha256 = "1ndcp7brnvii87ndcd34fk846498r07iznphkslcy0shic9cp4rr";
    libName = "syscall";
  };
  features_.redox_syscall."0.1.54" = deps: f: updateFeatures f (rec {
    redox_syscall."0.1.54".default = (f.redox_syscall."0.1.54".default or true);
  }) [];


# end
# redox_termios-0.1.1

  crates.redox_termios."0.1.1" = deps: { features?(features_.redox_termios."0.1.1" deps {}) }: buildRustCrate {
    crateName = "redox_termios";
    version = "0.1.1";
    description = "A Rust library to access Redox termios functions";
    authors = [ "Jeremy Soller <jackpot51@gmail.com>" ];
    sha256 = "04s6yyzjca552hdaqlvqhp3vw0zqbc304md5czyd3axh56iry8wh";
    libPath = "src/lib.rs";
    dependencies = mapFeatures features ([
      (crates."redox_syscall"."${deps."redox_termios"."0.1.1"."redox_syscall"}" deps)
    ]);
  };
  features_.redox_termios."0.1.1" = deps: f: updateFeatures f (rec {
    redox_syscall."${deps.redox_termios."0.1.1".redox_syscall}".default = true;
    redox_termios."0.1.1".default = (f.redox_termios."0.1.1".default or true);
  }) [
    (features_.redox_syscall."${deps."redox_termios"."0.1.1"."redox_syscall"}" deps)
  ];


# end
# regex-1.1.6

  crates.regex."1.1.6" = deps: { features?(features_.regex."1.1.6" deps {}) }: buildRustCrate {
    crateName = "regex";
    version = "1.1.6";
    description = "An implementation of regular expressions for Rust. This implementation uses\nfinite automata and guarantees linear time matching on all inputs.\n";
    authors = [ "The Rust Project Developers" ];
    sha256 = "1yynvabg03m5f65qxcw70qckkfjwi9xyfpjdp6yq7pk0xf0ydc0b";
    dependencies = mapFeatures features ([
      (crates."aho_corasick"."${deps."regex"."1.1.6"."aho_corasick"}" deps)
      (crates."memchr"."${deps."regex"."1.1.6"."memchr"}" deps)
      (crates."regex_syntax"."${deps."regex"."1.1.6"."regex_syntax"}" deps)
      (crates."thread_local"."${deps."regex"."1.1.6"."thread_local"}" deps)
      (crates."utf8_ranges"."${deps."regex"."1.1.6"."utf8_ranges"}" deps)
    ]);
    features = mkFeatures (features."regex"."1.1.6" or {});
  };
  features_.regex."1.1.6" = deps: f: updateFeatures f (rec {
    aho_corasick."${deps.regex."1.1.6".aho_corasick}".default = true;
    memchr."${deps.regex."1.1.6".memchr}".default = true;
    regex = fold recursiveUpdate {} [
      { "1.1.6"."pattern" =
        (f.regex."1.1.6"."pattern" or false) ||
        (f.regex."1.1.6".unstable or false) ||
        (regex."1.1.6"."unstable" or false); }
      { "1.1.6"."use_std" =
        (f.regex."1.1.6"."use_std" or false) ||
        (f.regex."1.1.6".default or false) ||
        (regex."1.1.6"."default" or false); }
      { "1.1.6".default = (f.regex."1.1.6".default or true); }
    ];
    regex_syntax."${deps.regex."1.1.6".regex_syntax}".default = true;
    thread_local."${deps.regex."1.1.6".thread_local}".default = true;
    utf8_ranges."${deps.regex."1.1.6".utf8_ranges}".default = true;
  }) [
    (features_.aho_corasick."${deps."regex"."1.1.6"."aho_corasick"}" deps)
    (features_.memchr."${deps."regex"."1.1.6"."memchr"}" deps)
    (features_.regex_syntax."${deps."regex"."1.1.6"."regex_syntax"}" deps)
    (features_.thread_local."${deps."regex"."1.1.6"."thread_local"}" deps)
    (features_.utf8_ranges."${deps."regex"."1.1.6"."utf8_ranges"}" deps)
  ];


# end
# regex-syntax-0.6.6

  crates.regex_syntax."0.6.6" = deps: { features?(features_.regex_syntax."0.6.6" deps {}) }: buildRustCrate {
    crateName = "regex-syntax";
    version = "0.6.6";
    description = "A regular expression parser.";
    authors = [ "The Rust Project Developers" ];
    sha256 = "1cjrdc3affa3rjfaxkp91xnf9k0fsqn9z4xqc280vv39nvrl8p8b";
    dependencies = mapFeatures features ([
      (crates."ucd_util"."${deps."regex_syntax"."0.6.6"."ucd_util"}" deps)
    ]);
  };
  features_.regex_syntax."0.6.6" = deps: f: updateFeatures f (rec {
    regex_syntax."0.6.6".default = (f.regex_syntax."0.6.6".default or true);
    ucd_util."${deps.regex_syntax."0.6.6".ucd_util}".default = true;
  }) [
    (features_.ucd_util."${deps."regex_syntax"."0.6.6"."ucd_util"}" deps)
  ];


# end
# remove_dir_all-0.5.1

  crates.remove_dir_all."0.5.1" = deps: { features?(features_.remove_dir_all."0.5.1" deps {}) }: buildRustCrate {
    crateName = "remove_dir_all";
    version = "0.5.1";
    description = "A safe, reliable implementation of remove_dir_all for Windows";
    authors = [ "Aaronepower <theaaronepower@gmail.com>" ];
    sha256 = "1chx3yvfbj46xjz4bzsvps208l46hfbcy0sm98gpiya454n4rrl7";
    dependencies = (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."remove_dir_all"."0.5.1"."winapi"}" deps)
    ]) else []);
  };
  features_.remove_dir_all."0.5.1" = deps: f: updateFeatures f (rec {
    remove_dir_all."0.5.1".default = (f.remove_dir_all."0.5.1".default or true);
    winapi = fold recursiveUpdate {} [
      { "${deps.remove_dir_all."0.5.1".winapi}"."errhandlingapi" = true; }
      { "${deps.remove_dir_all."0.5.1".winapi}"."fileapi" = true; }
      { "${deps.remove_dir_all."0.5.1".winapi}"."std" = true; }
      { "${deps.remove_dir_all."0.5.1".winapi}"."winbase" = true; }
      { "${deps.remove_dir_all."0.5.1".winapi}"."winerror" = true; }
      { "${deps.remove_dir_all."0.5.1".winapi}".default = true; }
    ];
  }) [
    (features_.winapi."${deps."remove_dir_all"."0.5.1"."winapi"}" deps)
  ];


# end
# reqwest-0.9.16

  crates.reqwest."0.9.16" = deps: { features?(features_.reqwest."0.9.16" deps {}) }: buildRustCrate {
    crateName = "reqwest";
    version = "0.9.16";
    description = "higher level HTTP client library";
    authors = [ "Sean McArthur <sean@seanmonstar.com>" ];
    sha256 = "0z24pzdm53i1849lx6cq0n8mvb4wjjxpbw1alz787fqa7qgd00vs";
    dependencies = mapFeatures features ([
      (crates."base64"."${deps."reqwest"."0.9.16"."base64"}" deps)
      (crates."bytes"."${deps."reqwest"."0.9.16"."bytes"}" deps)
      (crates."cookie"."${deps."reqwest"."0.9.16"."cookie"}" deps)
      (crates."cookie_store"."${deps."reqwest"."0.9.16"."cookie_store"}" deps)
      (crates."encoding_rs"."${deps."reqwest"."0.9.16"."encoding_rs"}" deps)
      (crates."flate2"."${deps."reqwest"."0.9.16"."flate2"}" deps)
      (crates."futures"."${deps."reqwest"."0.9.16"."futures"}" deps)
      (crates."http"."${deps."reqwest"."0.9.16"."http"}" deps)
      (crates."hyper"."${deps."reqwest"."0.9.16"."hyper"}" deps)
      (crates."log"."${deps."reqwest"."0.9.16"."log"}" deps)
      (crates."mime"."${deps."reqwest"."0.9.16"."mime"}" deps)
      (crates."mime_guess"."${deps."reqwest"."0.9.16"."mime_guess"}" deps)
      (crates."serde"."${deps."reqwest"."0.9.16"."serde"}" deps)
      (crates."serde_json"."${deps."reqwest"."0.9.16"."serde_json"}" deps)
      (crates."serde_urlencoded"."${deps."reqwest"."0.9.16"."serde_urlencoded"}" deps)
      (crates."time"."${deps."reqwest"."0.9.16"."time"}" deps)
      (crates."tokio"."${deps."reqwest"."0.9.16"."tokio"}" deps)
      (crates."tokio_executor"."${deps."reqwest"."0.9.16"."tokio_executor"}" deps)
      (crates."tokio_io"."${deps."reqwest"."0.9.16"."tokio_io"}" deps)
      (crates."tokio_threadpool"."${deps."reqwest"."0.9.16"."tokio_threadpool"}" deps)
      (crates."tokio_timer"."${deps."reqwest"."0.9.16"."tokio_timer"}" deps)
      (crates."url"."${deps."reqwest"."0.9.16"."url"}" deps)
      (crates."uuid"."${deps."reqwest"."0.9.16"."uuid"}" deps)
    ]
      ++ (if features.reqwest."0.9.16".hyper-tls or false then [ (crates.hyper_tls."${deps."reqwest"."0.9.16".hyper_tls}" deps) ] else [])
      ++ (if features.reqwest."0.9.16".native-tls or false then [ (crates.native_tls."${deps."reqwest"."0.9.16".native_tls}" deps) ] else []));
    features = mkFeatures (features."reqwest"."0.9.16" or {});
  };
  features_.reqwest."0.9.16" = deps: f: updateFeatures f (rec {
    base64."${deps.reqwest."0.9.16".base64}".default = true;
    bytes."${deps.reqwest."0.9.16".bytes}".default = true;
    cookie."${deps.reqwest."0.9.16".cookie}".default = true;
    cookie_store."${deps.reqwest."0.9.16".cookie_store}".default = true;
    encoding_rs."${deps.reqwest."0.9.16".encoding_rs}".default = true;
    flate2 = fold recursiveUpdate {} [
      { "${deps.reqwest."0.9.16".flate2}"."rust_backend" = true; }
      { "${deps.reqwest."0.9.16".flate2}".default = (f.flate2."${deps.reqwest."0.9.16".flate2}".default or false); }
    ];
    futures."${deps.reqwest."0.9.16".futures}".default = true;
    http."${deps.reqwest."0.9.16".http}".default = true;
    hyper."${deps.reqwest."0.9.16".hyper}".default = true;
    hyper_tls."${deps.reqwest."0.9.16".hyper_tls}".default = true;
    log."${deps.reqwest."0.9.16".log}".default = true;
    mime."${deps.reqwest."0.9.16".mime}".default = true;
    mime_guess."${deps.reqwest."0.9.16".mime_guess}".default = true;
    native_tls = fold recursiveUpdate {} [
      { "${deps.reqwest."0.9.16".native_tls}"."vendored" =
        (f.native_tls."${deps.reqwest."0.9.16".native_tls}"."vendored" or false) ||
        (reqwest."0.9.16"."default-tls-vendored" or false) ||
        (f."reqwest"."0.9.16"."default-tls-vendored" or false); }
      { "${deps.reqwest."0.9.16".native_tls}".default = true; }
    ];
    reqwest = fold recursiveUpdate {} [
      { "0.9.16"."default-tls" =
        (f.reqwest."0.9.16"."default-tls" or false) ||
        (f.reqwest."0.9.16".default or false) ||
        (reqwest."0.9.16"."default" or false) ||
        (f.reqwest."0.9.16".default-tls-vendored or false) ||
        (reqwest."0.9.16"."default-tls-vendored" or false); }
      { "0.9.16"."hyper-old-types" =
        (f.reqwest."0.9.16"."hyper-old-types" or false) ||
        (f.reqwest."0.9.16".hyper-011 or false) ||
        (reqwest."0.9.16"."hyper-011" or false); }
      { "0.9.16"."hyper-rustls" =
        (f.reqwest."0.9.16"."hyper-rustls" or false) ||
        (f.reqwest."0.9.16".rustls-tls or false) ||
        (reqwest."0.9.16"."rustls-tls" or false); }
      { "0.9.16"."hyper-tls" =
        (f.reqwest."0.9.16"."hyper-tls" or false) ||
        (f.reqwest."0.9.16".default-tls or false) ||
        (reqwest."0.9.16"."default-tls" or false); }
      { "0.9.16"."native-tls" =
        (f.reqwest."0.9.16"."native-tls" or false) ||
        (f.reqwest."0.9.16".default-tls or false) ||
        (reqwest."0.9.16"."default-tls" or false); }
      { "0.9.16"."rustls" =
        (f.reqwest."0.9.16"."rustls" or false) ||
        (f.reqwest."0.9.16".rustls-tls or false) ||
        (reqwest."0.9.16"."rustls-tls" or false); }
      { "0.9.16"."tls" =
        (f.reqwest."0.9.16"."tls" or false) ||
        (f.reqwest."0.9.16".default-tls or false) ||
        (reqwest."0.9.16"."default-tls" or false) ||
        (f.reqwest."0.9.16".rustls-tls or false) ||
        (reqwest."0.9.16"."rustls-tls" or false); }
      { "0.9.16"."tokio-rustls" =
        (f.reqwest."0.9.16"."tokio-rustls" or false) ||
        (f.reqwest."0.9.16".rustls-tls or false) ||
        (reqwest."0.9.16"."rustls-tls" or false); }
      { "0.9.16"."trust-dns-resolver" =
        (f.reqwest."0.9.16"."trust-dns-resolver" or false) ||
        (f.reqwest."0.9.16".trust-dns or false) ||
        (reqwest."0.9.16"."trust-dns" or false); }
      { "0.9.16"."webpki-roots" =
        (f.reqwest."0.9.16"."webpki-roots" or false) ||
        (f.reqwest."0.9.16".rustls-tls or false) ||
        (reqwest."0.9.16"."rustls-tls" or false); }
      { "0.9.16".default = (f.reqwest."0.9.16".default or true); }
    ];
    serde."${deps.reqwest."0.9.16".serde}".default = true;
    serde_json."${deps.reqwest."0.9.16".serde_json}".default = true;
    serde_urlencoded."${deps.reqwest."0.9.16".serde_urlencoded}".default = true;
    time."${deps.reqwest."0.9.16".time}".default = true;
    tokio = fold recursiveUpdate {} [
      { "${deps.reqwest."0.9.16".tokio}"."rt-full" = true; }
      { "${deps.reqwest."0.9.16".tokio}"."tcp" = true; }
      { "${deps.reqwest."0.9.16".tokio}".default = (f.tokio."${deps.reqwest."0.9.16".tokio}".default or false); }
    ];
    tokio_executor."${deps.reqwest."0.9.16".tokio_executor}".default = true;
    tokio_io."${deps.reqwest."0.9.16".tokio_io}".default = true;
    tokio_threadpool."${deps.reqwest."0.9.16".tokio_threadpool}".default = true;
    tokio_timer."${deps.reqwest."0.9.16".tokio_timer}".default = true;
    url."${deps.reqwest."0.9.16".url}".default = true;
    uuid = fold recursiveUpdate {} [
      { "${deps.reqwest."0.9.16".uuid}"."v4" = true; }
      { "${deps.reqwest."0.9.16".uuid}".default = true; }
    ];
  }) [
    (features_.base64."${deps."reqwest"."0.9.16"."base64"}" deps)
    (features_.bytes."${deps."reqwest"."0.9.16"."bytes"}" deps)
    (features_.cookie."${deps."reqwest"."0.9.16"."cookie"}" deps)
    (features_.cookie_store."${deps."reqwest"."0.9.16"."cookie_store"}" deps)
    (features_.encoding_rs."${deps."reqwest"."0.9.16"."encoding_rs"}" deps)
    (features_.flate2."${deps."reqwest"."0.9.16"."flate2"}" deps)
    (features_.futures."${deps."reqwest"."0.9.16"."futures"}" deps)
    (features_.http."${deps."reqwest"."0.9.16"."http"}" deps)
    (features_.hyper."${deps."reqwest"."0.9.16"."hyper"}" deps)
    (features_.hyper_tls."${deps."reqwest"."0.9.16"."hyper_tls"}" deps)
    (features_.log."${deps."reqwest"."0.9.16"."log"}" deps)
    (features_.mime."${deps."reqwest"."0.9.16"."mime"}" deps)
    (features_.mime_guess."${deps."reqwest"."0.9.16"."mime_guess"}" deps)
    (features_.native_tls."${deps."reqwest"."0.9.16"."native_tls"}" deps)
    (features_.serde."${deps."reqwest"."0.9.16"."serde"}" deps)
    (features_.serde_json."${deps."reqwest"."0.9.16"."serde_json"}" deps)
    (features_.serde_urlencoded."${deps."reqwest"."0.9.16"."serde_urlencoded"}" deps)
    (features_.time."${deps."reqwest"."0.9.16"."time"}" deps)
    (features_.tokio."${deps."reqwest"."0.9.16"."tokio"}" deps)
    (features_.tokio_executor."${deps."reqwest"."0.9.16"."tokio_executor"}" deps)
    (features_.tokio_io."${deps."reqwest"."0.9.16"."tokio_io"}" deps)
    (features_.tokio_threadpool."${deps."reqwest"."0.9.16"."tokio_threadpool"}" deps)
    (features_.tokio_timer."${deps."reqwest"."0.9.16"."tokio_timer"}" deps)
    (features_.url."${deps."reqwest"."0.9.16"."url"}" deps)
    (features_.uuid."${deps."reqwest"."0.9.16"."uuid"}" deps)
  ];


# end
# resolv-conf-0.6.2

  crates.resolv_conf."0.6.2" = deps: { features?(features_.resolv_conf."0.6.2" deps {}) }: buildRustCrate {
    crateName = "resolv-conf";
    version = "0.6.2";
    description = "    The resolv.conf file parser\n";
    authors = [ "paul@colomiets.name" ];
    sha256 = "1vm5lk75n5bzaygf0cjh5fv31m29955pwpkk1d04ls9ix631rhdk";
    libPath = "src/lib.rs";
    libName = "resolv_conf";
    dependencies = mapFeatures features ([
      (crates."quick_error"."${deps."resolv_conf"."0.6.2"."quick_error"}" deps)
    ]
      ++ (if features.resolv_conf."0.6.2".hostname or false then [ (crates.hostname."${deps."resolv_conf"."0.6.2".hostname}" deps) ] else []));
    features = mkFeatures (features."resolv_conf"."0.6.2" or {});
  };
  features_.resolv_conf."0.6.2" = deps: f: updateFeatures f (rec {
    hostname."${deps.resolv_conf."0.6.2".hostname}".default = true;
    quick_error."${deps.resolv_conf."0.6.2".quick_error}".default = true;
    resolv_conf = fold recursiveUpdate {} [
      { "0.6.2"."hostname" =
        (f.resolv_conf."0.6.2"."hostname" or false) ||
        (f.resolv_conf."0.6.2".system or false) ||
        (resolv_conf."0.6.2"."system" or false); }
      { "0.6.2".default = (f.resolv_conf."0.6.2".default or true); }
    ];
  }) [
    (features_.hostname."${deps."resolv_conf"."0.6.2"."hostname"}" deps)
    (features_.quick_error."${deps."resolv_conf"."0.6.2"."quick_error"}" deps)
  ];


# end
# ring-0.13.5

  crates.ring."0.13.5" = deps: { features?(features_.ring."0.13.5" deps {}) }: buildRustCrate {
    crateName = "ring";
    version = "0.13.5";
    description = "Safe, fast, small crypto using Rust.";
    authors = [ "Brian Smith <brian@briansmith.org>" ];
    sha256 = "0b071zwzwhgmj0xyr7wqc55f4nppgjikfh53nb9m799l096s86j4";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."untrusted"."${deps."ring"."0.13.5"."untrusted"}" deps)
    ])
      ++ (if kernel == "redox" || (kernel == "linux" || kernel == "darwin") && !(kernel == "darwin" || kernel == "ios") then mapFeatures features ([
      (crates."lazy_static"."${deps."ring"."0.13.5"."lazy_static"}" deps)
    ]) else [])
      ++ (if kernel == "linux" then mapFeatures features ([
      (crates."libc"."${deps."ring"."0.13.5"."libc"}" deps)
    ]) else []);

    buildDependencies = mapFeatures features ([
      (crates."cc"."${deps."ring"."0.13.5"."cc"}" deps)
    ]);
    features = mkFeatures (features."ring"."0.13.5" or {});
  };
  features_.ring."0.13.5" = deps: f: updateFeatures f (rec {
    cc."${deps.ring."0.13.5".cc}".default = true;
    lazy_static."${deps.ring."0.13.5".lazy_static}".default = true;
    libc."${deps.ring."0.13.5".libc}".default = true;
    ring = fold recursiveUpdate {} [
      { "0.13.5"."dev_urandom_fallback" =
        (f.ring."0.13.5"."dev_urandom_fallback" or false) ||
        (f.ring."0.13.5".default or false) ||
        (ring."0.13.5"."default" or false); }
      { "0.13.5"."use_heap" =
        (f.ring."0.13.5"."use_heap" or false) ||
        (f.ring."0.13.5".default or false) ||
        (ring."0.13.5"."default" or false) ||
        (f.ring."0.13.5".rsa_signing or false) ||
        (ring."0.13.5"."rsa_signing" or false); }
      { "0.13.5".default = (f.ring."0.13.5".default or true); }
    ];
    untrusted."${deps.ring."0.13.5".untrusted}".default = true;
  }) [
    (features_.untrusted."${deps."ring"."0.13.5"."untrusted"}" deps)
    (features_.cc."${deps."ring"."0.13.5"."cc"}" deps)
    (features_.lazy_static."${deps."ring"."0.13.5"."lazy_static"}" deps)
    (features_.libc."${deps."ring"."0.13.5"."libc"}" deps)
  ];


# end
# rustc-demangle-0.1.14

  crates.rustc_demangle."0.1.14" = deps: { features?(features_.rustc_demangle."0.1.14" deps {}) }: buildRustCrate {
    crateName = "rustc-demangle";
    version = "0.1.14";
    description = "Rust compiler symbol demangling.\n";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "07vl0ms3a27fpry9kh9piv08w7d51i5m7bgphk7pw4jygwzdy31f";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."rustc_demangle"."0.1.14" or {});
  };
  features_.rustc_demangle."0.1.14" = deps: f: updateFeatures f (rec {
    rustc_demangle = fold recursiveUpdate {} [
      { "0.1.14"."compiler_builtins" =
        (f.rustc_demangle."0.1.14"."compiler_builtins" or false) ||
        (f.rustc_demangle."0.1.14".rustc-dep-of-std or false) ||
        (rustc_demangle."0.1.14"."rustc-dep-of-std" or false); }
      { "0.1.14"."core" =
        (f.rustc_demangle."0.1.14"."core" or false) ||
        (f.rustc_demangle."0.1.14".rustc-dep-of-std or false) ||
        (rustc_demangle."0.1.14"."rustc-dep-of-std" or false); }
      { "0.1.14".default = (f.rustc_demangle."0.1.14".default or true); }
    ];
  }) [];


# end
# rustc_version-0.2.3

  crates.rustc_version."0.2.3" = deps: { features?(features_.rustc_version."0.2.3" deps {}) }: buildRustCrate {
    crateName = "rustc_version";
    version = "0.2.3";
    description = "A library for querying the version of a installed rustc compiler";
    authors = [ "Marvin Löbel <loebel.marvin@gmail.com>" ];
    sha256 = "0rgwzbgs3i9fqjm1p4ra3n7frafmpwl29c8lw85kv1rxn7n2zaa7";
    dependencies = mapFeatures features ([
      (crates."semver"."${deps."rustc_version"."0.2.3"."semver"}" deps)
    ]);
  };
  features_.rustc_version."0.2.3" = deps: f: updateFeatures f (rec {
    rustc_version."0.2.3".default = (f.rustc_version."0.2.3".default or true);
    semver."${deps.rustc_version."0.2.3".semver}".default = true;
  }) [
    (features_.semver."${deps."rustc_version"."0.2.3"."semver"}" deps)
  ];


# end
# ryu-0.2.8

  crates.ryu."0.2.8" = deps: { features?(features_.ryu."0.2.8" deps {}) }: buildRustCrate {
    crateName = "ryu";
    version = "0.2.8";
    description = "Fast floating point to string conversion";
    authors = [ "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "1qd0ni13w19a97y51vm31biyh2pvz8j9gi78rn5in912mi04xcnk";
    build = "build.rs";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."ryu"."0.2.8" or {});
  };
  features_.ryu."0.2.8" = deps: f: updateFeatures f (rec {
    ryu."0.2.8".default = (f.ryu."0.2.8".default or true);
  }) [];


# end
# safemem-0.3.0

  crates.safemem."0.3.0" = deps: { features?(features_.safemem."0.3.0" deps {}) }: buildRustCrate {
    crateName = "safemem";
    version = "0.3.0";
    description = "Safe wrappers for memory-accessing functions, like `std::ptr::copy()`.";
    authors = [ "Austin Bonander <austin.bonander@gmail.com>" ];
    sha256 = "0pr39b468d05f6m7m4alsngmj5p7an8df21apsxbi57k0lmwrr18";
    features = mkFeatures (features."safemem"."0.3.0" or {});
  };
  features_.safemem."0.3.0" = deps: f: updateFeatures f (rec {
    safemem = fold recursiveUpdate {} [
      { "0.3.0"."std" =
        (f.safemem."0.3.0"."std" or false) ||
        (f.safemem."0.3.0".default or false) ||
        (safemem."0.3.0"."default" or false); }
      { "0.3.0".default = (f.safemem."0.3.0".default or true); }
    ];
  }) [];


# end
# schannel-0.1.15

  crates.schannel."0.1.15" = deps: { features?(features_.schannel."0.1.15" deps {}) }: buildRustCrate {
    crateName = "schannel";
    version = "0.1.15";
    description = "Schannel bindings for rust, allowing SSL/TLS (e.g. https) without openssl";
    authors = [ "Steven Fackler <sfackler@gmail.com>" "Steffen Butzer <steffen.butzer@outlook.com>" ];
    sha256 = "1x9i0z9y8n5cg23ppyglgqdlz6rwcv2a489m5qpfk6l2ib8a1jdv";
    dependencies = mapFeatures features ([
      (crates."lazy_static"."${deps."schannel"."0.1.15"."lazy_static"}" deps)
      (crates."winapi"."${deps."schannel"."0.1.15"."winapi"}" deps)
    ]);
  };
  features_.schannel."0.1.15" = deps: f: updateFeatures f (rec {
    lazy_static."${deps.schannel."0.1.15".lazy_static}".default = true;
    schannel."0.1.15".default = (f.schannel."0.1.15".default or true);
    winapi = fold recursiveUpdate {} [
      { "${deps.schannel."0.1.15".winapi}"."lmcons" = true; }
      { "${deps.schannel."0.1.15".winapi}"."minschannel" = true; }
      { "${deps.schannel."0.1.15".winapi}"."schannel" = true; }
      { "${deps.schannel."0.1.15".winapi}"."securitybaseapi" = true; }
      { "${deps.schannel."0.1.15".winapi}"."sspi" = true; }
      { "${deps.schannel."0.1.15".winapi}"."sysinfoapi" = true; }
      { "${deps.schannel."0.1.15".winapi}"."timezoneapi" = true; }
      { "${deps.schannel."0.1.15".winapi}"."winbase" = true; }
      { "${deps.schannel."0.1.15".winapi}"."wincrypt" = true; }
      { "${deps.schannel."0.1.15".winapi}"."winerror" = true; }
      { "${deps.schannel."0.1.15".winapi}".default = true; }
    ];
  }) [
    (features_.lazy_static."${deps."schannel"."0.1.15"."lazy_static"}" deps)
    (features_.winapi."${deps."schannel"."0.1.15"."winapi"}" deps)
  ];


# end
# scopeguard-0.3.3

  crates.scopeguard."0.3.3" = deps: { features?(features_.scopeguard."0.3.3" deps {}) }: buildRustCrate {
    crateName = "scopeguard";
    version = "0.3.3";
    description = "A RAII scope guard that will run a given closure when it goes out of scope,\neven if the code between panics (assuming unwinding panic).\n\nDefines the macros `defer!` and `defer_on_unwind!`; the latter only runs\nif the scope is extited through unwinding on panic.\n";
    authors = [ "bluss" ];
    sha256 = "0i1l013csrqzfz6c68pr5pi01hg5v5yahq8fsdmaxy6p8ygsjf3r";
    features = mkFeatures (features."scopeguard"."0.3.3" or {});
  };
  features_.scopeguard."0.3.3" = deps: f: updateFeatures f (rec {
    scopeguard = fold recursiveUpdate {} [
      { "0.3.3"."use_std" =
        (f.scopeguard."0.3.3"."use_std" or false) ||
        (f.scopeguard."0.3.3".default or false) ||
        (scopeguard."0.3.3"."default" or false); }
      { "0.3.3".default = (f.scopeguard."0.3.3".default or true); }
    ];
  }) [];


# end
# security-framework-0.3.1

  crates.security_framework."0.3.1" = deps: { features?(features_.security_framework."0.3.1" deps {}) }: buildRustCrate {
    crateName = "security-framework";
    version = "0.3.1";
    description = "Security.framework bindings for macOS and iOS";
    authors = [ "Steven Fackler <sfackler@gmail.com>" "Kornel <kornel@geekhood.net>" ];
    sha256 = "1vycb3xhdd91sy2j6a19iykn6wzdjj0r7cd9p3bx4522fl0l5m84";
    dependencies = mapFeatures features ([
      (crates."core_foundation"."${deps."security_framework"."0.3.1"."core_foundation"}" deps)
      (crates."core_foundation_sys"."${deps."security_framework"."0.3.1"."core_foundation_sys"}" deps)
      (crates."libc"."${deps."security_framework"."0.3.1"."libc"}" deps)
      (crates."security_framework_sys"."${deps."security_framework"."0.3.1"."security_framework_sys"}" deps)
    ]);
    features = mkFeatures (features."security_framework"."0.3.1" or {});
  };
  features_.security_framework."0.3.1" = deps: f: updateFeatures f (rec {
    core_foundation."${deps.security_framework."0.3.1".core_foundation}".default = true;
    core_foundation_sys."${deps.security_framework."0.3.1".core_foundation_sys}".default = true;
    libc."${deps.security_framework."0.3.1".libc}".default = true;
    security_framework = fold recursiveUpdate {} [
      { "0.3.1"."OSX_10_10" =
        (f.security_framework."0.3.1"."OSX_10_10" or false) ||
        (f.security_framework."0.3.1".OSX_10_11 or false) ||
        (security_framework."0.3.1"."OSX_10_11" or false); }
      { "0.3.1"."OSX_10_11" =
        (f.security_framework."0.3.1"."OSX_10_11" or false) ||
        (f.security_framework."0.3.1".OSX_10_12 or false) ||
        (security_framework."0.3.1"."OSX_10_12" or false); }
      { "0.3.1"."OSX_10_12" =
        (f.security_framework."0.3.1"."OSX_10_12" or false) ||
        (f.security_framework."0.3.1".OSX_10_13 or false) ||
        (security_framework."0.3.1"."OSX_10_13" or false); }
      { "0.3.1"."OSX_10_9" =
        (f.security_framework."0.3.1"."OSX_10_9" or false) ||
        (f.security_framework."0.3.1".OSX_10_10 or false) ||
        (security_framework."0.3.1"."OSX_10_10" or false); }
      { "0.3.1"."alpn" =
        (f.security_framework."0.3.1"."alpn" or false) ||
        (f.security_framework."0.3.1".OSX_10_13 or false) ||
        (security_framework."0.3.1"."OSX_10_13" or false); }
      { "0.3.1".default = (f.security_framework."0.3.1".default or true); }
    ];
    security_framework_sys = fold recursiveUpdate {} [
      { "${deps.security_framework."0.3.1".security_framework_sys}"."OSX_10_10" =
        (f.security_framework_sys."${deps.security_framework."0.3.1".security_framework_sys}"."OSX_10_10" or false) ||
        (security_framework."0.3.1"."OSX_10_10" or false) ||
        (f."security_framework"."0.3.1"."OSX_10_10" or false); }
      { "${deps.security_framework."0.3.1".security_framework_sys}"."OSX_10_11" =
        (f.security_framework_sys."${deps.security_framework."0.3.1".security_framework_sys}"."OSX_10_11" or false) ||
        (security_framework."0.3.1"."OSX_10_11" or false) ||
        (f."security_framework"."0.3.1"."OSX_10_11" or false); }
      { "${deps.security_framework."0.3.1".security_framework_sys}"."OSX_10_12" =
        (f.security_framework_sys."${deps.security_framework."0.3.1".security_framework_sys}"."OSX_10_12" or false) ||
        (security_framework."0.3.1"."OSX_10_12" or false) ||
        (f."security_framework"."0.3.1"."OSX_10_12" or false); }
      { "${deps.security_framework."0.3.1".security_framework_sys}"."OSX_10_13" =
        (f.security_framework_sys."${deps.security_framework."0.3.1".security_framework_sys}"."OSX_10_13" or false) ||
        (security_framework."0.3.1"."OSX_10_13" or false) ||
        (f."security_framework"."0.3.1"."OSX_10_13" or false); }
      { "${deps.security_framework."0.3.1".security_framework_sys}"."OSX_10_9" =
        (f.security_framework_sys."${deps.security_framework."0.3.1".security_framework_sys}"."OSX_10_9" or false) ||
        (security_framework."0.3.1"."OSX_10_9" or false) ||
        (f."security_framework"."0.3.1"."OSX_10_9" or false); }
      { "${deps.security_framework."0.3.1".security_framework_sys}".default = true; }
    ];
  }) [
    (features_.core_foundation."${deps."security_framework"."0.3.1"."core_foundation"}" deps)
    (features_.core_foundation_sys."${deps."security_framework"."0.3.1"."core_foundation_sys"}" deps)
    (features_.libc."${deps."security_framework"."0.3.1"."libc"}" deps)
    (features_.security_framework_sys."${deps."security_framework"."0.3.1"."security_framework_sys"}" deps)
  ];


# end
# security-framework-sys-0.3.1

  crates.security_framework_sys."0.3.1" = deps: { features?(features_.security_framework_sys."0.3.1" deps {}) }: buildRustCrate {
    crateName = "security-framework-sys";
    version = "0.3.1";
    description = "Apple `Security.framework` low-level FFI bindings";
    authors = [ "Steven Fackler <sfackler@gmail.com>" "Kornel <kornel@geekhood.net>" ];
    sha256 = "11anqpw72d7xjiaz3pbd2r5d3dx0vddya4f6vjnpfjpnldiyd917";
    dependencies = mapFeatures features ([
      (crates."core_foundation_sys"."${deps."security_framework_sys"."0.3.1"."core_foundation_sys"}" deps)
    ]);
    features = mkFeatures (features."security_framework_sys"."0.3.1" or {});
  };
  features_.security_framework_sys."0.3.1" = deps: f: updateFeatures f (rec {
    core_foundation_sys."${deps.security_framework_sys."0.3.1".core_foundation_sys}".default = true;
    security_framework_sys = fold recursiveUpdate {} [
      { "0.3.1"."OSX_10_10" =
        (f.security_framework_sys."0.3.1"."OSX_10_10" or false) ||
        (f.security_framework_sys."0.3.1".OSX_10_11 or false) ||
        (security_framework_sys."0.3.1"."OSX_10_11" or false); }
      { "0.3.1"."OSX_10_11" =
        (f.security_framework_sys."0.3.1"."OSX_10_11" or false) ||
        (f.security_framework_sys."0.3.1".OSX_10_12 or false) ||
        (security_framework_sys."0.3.1"."OSX_10_12" or false); }
      { "0.3.1"."OSX_10_12" =
        (f.security_framework_sys."0.3.1"."OSX_10_12" or false) ||
        (f.security_framework_sys."0.3.1".OSX_10_13 or false) ||
        (security_framework_sys."0.3.1"."OSX_10_13" or false); }
      { "0.3.1"."OSX_10_9" =
        (f.security_framework_sys."0.3.1"."OSX_10_9" or false) ||
        (f.security_framework_sys."0.3.1".OSX_10_10 or false) ||
        (security_framework_sys."0.3.1"."OSX_10_10" or false); }
      { "0.3.1".default = (f.security_framework_sys."0.3.1".default or true); }
    ];
  }) [
    (features_.core_foundation_sys."${deps."security_framework_sys"."0.3.1"."core_foundation_sys"}" deps)
  ];


# end
# semver-0.9.0

  crates.semver."0.9.0" = deps: { features?(features_.semver."0.9.0" deps {}) }: buildRustCrate {
    crateName = "semver";
    version = "0.9.0";
    description = "Semantic version parsing and comparison.\n";
    authors = [ "Steve Klabnik <steve@steveklabnik.com>" "The Rust Project Developers" ];
    sha256 = "0azak2lb2wc36s3x15az886kck7rpnksrw14lalm157rg9sc9z63";
    dependencies = mapFeatures features ([
      (crates."semver_parser"."${deps."semver"."0.9.0"."semver_parser"}" deps)
    ]);
    features = mkFeatures (features."semver"."0.9.0" or {});
  };
  features_.semver."0.9.0" = deps: f: updateFeatures f (rec {
    semver = fold recursiveUpdate {} [
      { "0.9.0"."serde" =
        (f.semver."0.9.0"."serde" or false) ||
        (f.semver."0.9.0".ci or false) ||
        (semver."0.9.0"."ci" or false); }
      { "0.9.0".default = (f.semver."0.9.0".default or true); }
    ];
    semver_parser."${deps.semver."0.9.0".semver_parser}".default = true;
  }) [
    (features_.semver_parser."${deps."semver"."0.9.0"."semver_parser"}" deps)
  ];


# end
# semver-parser-0.7.0

  crates.semver_parser."0.7.0" = deps: { features?(features_.semver_parser."0.7.0" deps {}) }: buildRustCrate {
    crateName = "semver-parser";
    version = "0.7.0";
    description = "Parsing of the semver spec.\n";
    authors = [ "Steve Klabnik <steve@steveklabnik.com>" ];
    sha256 = "1da66c8413yakx0y15k8c055yna5lyb6fr0fw9318kdwkrk5k12h";
  };
  features_.semver_parser."0.7.0" = deps: f: updateFeatures f (rec {
    semver_parser."0.7.0".default = (f.semver_parser."0.7.0".default or true);
  }) [];


# end
# serde-1.0.90

  crates.serde."1.0.90" = deps: { features?(features_.serde."1.0.90" deps {}) }: buildRustCrate {
    crateName = "serde";
    version = "1.0.90";
    description = "A generic serialization/deserialization framework";
    authors = [ "Erick Tryzelaar <erick.tryzelaar@gmail.com>" "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "10b6n74m1dvb667vrn1db47ncb4h0mkqbg1dsamqjvv5vl5b5j56";
    build = "build.rs";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."serde"."1.0.90" or {});
  };
  features_.serde."1.0.90" = deps: f: updateFeatures f (rec {
    serde = fold recursiveUpdate {} [
      { "1.0.90"."serde_derive" =
        (f.serde."1.0.90"."serde_derive" or false) ||
        (f.serde."1.0.90".derive or false) ||
        (serde."1.0.90"."derive" or false); }
      { "1.0.90"."std" =
        (f.serde."1.0.90"."std" or false) ||
        (f.serde."1.0.90".default or false) ||
        (serde."1.0.90"."default" or false); }
      { "1.0.90"."unstable" =
        (f.serde."1.0.90"."unstable" or false) ||
        (f.serde."1.0.90".alloc or false) ||
        (serde."1.0.90"."alloc" or false); }
      { "1.0.90".default = (f.serde."1.0.90".default or true); }
    ];
  }) [];


# end
# serde_derive-1.0.90

  crates.serde_derive."1.0.90" = deps: { features?(features_.serde_derive."1.0.90" deps {}) }: buildRustCrate {
    crateName = "serde_derive";
    version = "1.0.90";
    description = "Macros 1.1 implementation of #[derive(Serialize, Deserialize)]";
    authors = [ "Erick Tryzelaar <erick.tryzelaar@gmail.com>" "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "1m4xgyl8jj3mxj0wszminzc1qf2gbkj9dpl17vi95nwl6m7i157y";
    procMacro = true;
    dependencies = mapFeatures features ([
      (crates."proc_macro2"."${deps."serde_derive"."1.0.90"."proc_macro2"}" deps)
      (crates."quote"."${deps."serde_derive"."1.0.90"."quote"}" deps)
      (crates."syn"."${deps."serde_derive"."1.0.90"."syn"}" deps)
    ]);
    features = mkFeatures (features."serde_derive"."1.0.90" or {});
  };
  features_.serde_derive."1.0.90" = deps: f: updateFeatures f (rec {
    proc_macro2."${deps.serde_derive."1.0.90".proc_macro2}".default = true;
    quote."${deps.serde_derive."1.0.90".quote}".default = true;
    serde_derive."1.0.90".default = (f.serde_derive."1.0.90".default or true);
    syn = fold recursiveUpdate {} [
      { "${deps.serde_derive."1.0.90".syn}"."visit" = true; }
      { "${deps.serde_derive."1.0.90".syn}".default = true; }
    ];
  }) [
    (features_.proc_macro2."${deps."serde_derive"."1.0.90"."proc_macro2"}" deps)
    (features_.quote."${deps."serde_derive"."1.0.90"."quote"}" deps)
    (features_.syn."${deps."serde_derive"."1.0.90"."syn"}" deps)
  ];


# end
# serde_json-1.0.39

  crates.serde_json."1.0.39" = deps: { features?(features_.serde_json."1.0.39" deps {}) }: buildRustCrate {
    crateName = "serde_json";
    version = "1.0.39";
    description = "A JSON serialization file format";
    authors = [ "Erick Tryzelaar <erick.tryzelaar@gmail.com>" "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "07ydv06hn8x0yl0rc94l2wl9r2xz1fqd97n1s6j3bgdc6gw406a8";
    dependencies = mapFeatures features ([
      (crates."itoa"."${deps."serde_json"."1.0.39"."itoa"}" deps)
      (crates."ryu"."${deps."serde_json"."1.0.39"."ryu"}" deps)
      (crates."serde"."${deps."serde_json"."1.0.39"."serde"}" deps)
    ]);
    features = mkFeatures (features."serde_json"."1.0.39" or {});
  };
  features_.serde_json."1.0.39" = deps: f: updateFeatures f (rec {
    itoa."${deps.serde_json."1.0.39".itoa}".default = true;
    ryu."${deps.serde_json."1.0.39".ryu}".default = true;
    serde."${deps.serde_json."1.0.39".serde}".default = true;
    serde_json = fold recursiveUpdate {} [
      { "1.0.39"."indexmap" =
        (f.serde_json."1.0.39"."indexmap" or false) ||
        (f.serde_json."1.0.39".preserve_order or false) ||
        (serde_json."1.0.39"."preserve_order" or false); }
      { "1.0.39".default = (f.serde_json."1.0.39".default or true); }
    ];
  }) [
    (features_.itoa."${deps."serde_json"."1.0.39"."itoa"}" deps)
    (features_.ryu."${deps."serde_json"."1.0.39"."ryu"}" deps)
    (features_.serde."${deps."serde_json"."1.0.39"."serde"}" deps)
  ];


# end
# serde_urlencoded-0.5.5

  crates.serde_urlencoded."0.5.5" = deps: { features?(features_.serde_urlencoded."0.5.5" deps {}) }: buildRustCrate {
    crateName = "serde_urlencoded";
    version = "0.5.5";
    description = "`x-www-form-urlencoded` meets Serde";
    authors = [ "Anthony Ramine <n.oxyde@gmail.com>" ];
    sha256 = "1rf49i9w1p1yhr9fr5xsq6mi23i9ggj7132qwrfsaiimfvs6y7i0";
    dependencies = mapFeatures features ([
      (crates."dtoa"."${deps."serde_urlencoded"."0.5.5"."dtoa"}" deps)
      (crates."itoa"."${deps."serde_urlencoded"."0.5.5"."itoa"}" deps)
      (crates."serde"."${deps."serde_urlencoded"."0.5.5"."serde"}" deps)
      (crates."url"."${deps."serde_urlencoded"."0.5.5"."url"}" deps)
    ]);
  };
  features_.serde_urlencoded."0.5.5" = deps: f: updateFeatures f (rec {
    dtoa."${deps.serde_urlencoded."0.5.5".dtoa}".default = true;
    itoa."${deps.serde_urlencoded."0.5.5".itoa}".default = true;
    serde."${deps.serde_urlencoded."0.5.5".serde}".default = true;
    serde_urlencoded."0.5.5".default = (f.serde_urlencoded."0.5.5".default or true);
    url."${deps.serde_urlencoded."0.5.5".url}".default = true;
  }) [
    (features_.dtoa."${deps."serde_urlencoded"."0.5.5"."dtoa"}" deps)
    (features_.itoa."${deps."serde_urlencoded"."0.5.5"."itoa"}" deps)
    (features_.serde."${deps."serde_urlencoded"."0.5.5"."serde"}" deps)
    (features_.url."${deps."serde_urlencoded"."0.5.5"."url"}" deps)
  ];


# end
# sha1-0.6.0

  crates.sha1."0.6.0" = deps: { features?(features_.sha1."0.6.0" deps {}) }: buildRustCrate {
    crateName = "sha1";
    version = "0.6.0";
    description = "Minimal implementation of SHA1 for Rust.";
    authors = [ "Armin Ronacher <armin.ronacher@active-4.com>" ];
    sha256 = "12cp2b8f3hbwhfpnv1j1afl285xxmmbxh9w4npzvwbdh7xfyww8v";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."sha1"."0.6.0" or {});
  };
  features_.sha1."0.6.0" = deps: f: updateFeatures f (rec {
    sha1."0.6.0".default = (f.sha1."0.6.0".default or true);
  }) [];


# end
# signal-hook-0.1.9

  crates.signal_hook."0.1.9" = deps: { features?(features_.signal_hook."0.1.9" deps {}) }: buildRustCrate {
    crateName = "signal-hook";
    version = "0.1.9";
    description = "Unix signal handling";
    authors = [ "Michal 'vorner' Vaner <vorner@vorner.cz>" ];
    sha256 = "090cx7fyrqllvhvxxy5343j4r21i98cs2id63jp7a59yk8d29xsi";
    dependencies = mapFeatures features ([
      (crates."libc"."${deps."signal_hook"."0.1.9"."libc"}" deps)
      (crates."signal_hook_registry"."${deps."signal_hook"."0.1.9"."signal_hook_registry"}" deps)
    ]);
    features = mkFeatures (features."signal_hook"."0.1.9" or {});
  };
  features_.signal_hook."0.1.9" = deps: f: updateFeatures f (rec {
    libc."${deps.signal_hook."0.1.9".libc}".default = true;
    signal_hook = fold recursiveUpdate {} [
      { "0.1.9"."futures" =
        (f.signal_hook."0.1.9"."futures" or false) ||
        (f.signal_hook."0.1.9".tokio-support or false) ||
        (signal_hook."0.1.9"."tokio-support" or false); }
      { "0.1.9"."mio" =
        (f.signal_hook."0.1.9"."mio" or false) ||
        (f.signal_hook."0.1.9".mio-support or false) ||
        (signal_hook."0.1.9"."mio-support" or false); }
      { "0.1.9"."mio-support" =
        (f.signal_hook."0.1.9"."mio-support" or false) ||
        (f.signal_hook."0.1.9".tokio-support or false) ||
        (signal_hook."0.1.9"."tokio-support" or false); }
      { "0.1.9"."mio-uds" =
        (f.signal_hook."0.1.9"."mio-uds" or false) ||
        (f.signal_hook."0.1.9".mio-support or false) ||
        (signal_hook."0.1.9"."mio-support" or false); }
      { "0.1.9"."tokio-reactor" =
        (f.signal_hook."0.1.9"."tokio-reactor" or false) ||
        (f.signal_hook."0.1.9".tokio-support or false) ||
        (signal_hook."0.1.9"."tokio-support" or false); }
      { "0.1.9".default = (f.signal_hook."0.1.9".default or true); }
    ];
    signal_hook_registry."${deps.signal_hook."0.1.9".signal_hook_registry}".default = true;
  }) [
    (features_.libc."${deps."signal_hook"."0.1.9"."libc"}" deps)
    (features_.signal_hook_registry."${deps."signal_hook"."0.1.9"."signal_hook_registry"}" deps)
  ];


# end
# signal-hook-registry-1.0.1

  crates.signal_hook_registry."1.0.1" = deps: { features?(features_.signal_hook_registry."1.0.1" deps {}) }: buildRustCrate {
    crateName = "signal-hook-registry";
    version = "1.0.1";
    description = "Backend crate for signal-hook";
    authors = [ "Michal 'vorner' Vaner <vorner@vorner.cz>" ];
    sha256 = "0mz2nkfn203k7y1k28prgnzq0y93hp9d6n9vywywi8dpb2nrplpi";
    dependencies = mapFeatures features ([
      (crates."arc_swap"."${deps."signal_hook_registry"."1.0.1"."arc_swap"}" deps)
      (crates."libc"."${deps."signal_hook_registry"."1.0.1"."libc"}" deps)
    ]);
  };
  features_.signal_hook_registry."1.0.1" = deps: f: updateFeatures f (rec {
    arc_swap."${deps.signal_hook_registry."1.0.1".arc_swap}".default = true;
    libc."${deps.signal_hook_registry."1.0.1".libc}".default = true;
    signal_hook_registry."1.0.1".default = (f.signal_hook_registry."1.0.1".default or true);
  }) [
    (features_.arc_swap."${deps."signal_hook_registry"."1.0.1"."arc_swap"}" deps)
    (features_.libc."${deps."signal_hook_registry"."1.0.1"."libc"}" deps)
  ];


# end
# siphasher-0.2.3

  crates.siphasher."0.2.3" = deps: { features?(features_.siphasher."0.2.3" deps {}) }: buildRustCrate {
    crateName = "siphasher";
    version = "0.2.3";
    description = "SipHash functions from rust-core < 1.13";
    authors = [ "Frank Denis <github@pureftpd.org>" ];
    sha256 = "1ganj1grxqnkvv4ds3vby039bm999jrr58nfq2x3kjhzkw2bnqkw";
  };
  features_.siphasher."0.2.3" = deps: f: updateFeatures f (rec {
    siphasher."0.2.3".default = (f.siphasher."0.2.3".default or true);
  }) [];


# end
# slab-0.4.2

  crates.slab."0.4.2" = deps: { features?(features_.slab."0.4.2" deps {}) }: buildRustCrate {
    crateName = "slab";
    version = "0.4.2";
    description = "Pre-allocated storage for a uniform data type";
    authors = [ "Carl Lerche <me@carllerche.com>" ];
    sha256 = "0h1l2z7qy6207kv0v3iigdf2xfk9yrhbwj1svlxk6wxjmdxvgdl7";
  };
  features_.slab."0.4.2" = deps: f: updateFeatures f (rec {
    slab."0.4.2".default = (f.slab."0.4.2".default or true);
  }) [];


# end
# smallvec-0.6.9

  crates.smallvec."0.6.9" = deps: { features?(features_.smallvec."0.6.9" deps {}) }: buildRustCrate {
    crateName = "smallvec";
    version = "0.6.9";
    description = "'Small vector' optimization: store up to a small number of items on the stack";
    authors = [ "Simon Sapin <simon.sapin@exyr.org>" ];
    sha256 = "0p96l51a2pq5y0vn48nhbm6qslbc6k8h28cxm0pmzkqmj7xynz6w";
    libPath = "lib.rs";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."smallvec"."0.6.9" or {});
  };
  features_.smallvec."0.6.9" = deps: f: updateFeatures f (rec {
    smallvec = fold recursiveUpdate {} [
      { "0.6.9"."std" =
        (f.smallvec."0.6.9"."std" or false) ||
        (f.smallvec."0.6.9".default or false) ||
        (smallvec."0.6.9"."default" or false); }
      { "0.6.9".default = (f.smallvec."0.6.9".default or true); }
    ];
  }) [];


# end
# socket2-0.3.8

  crates.socket2."0.3.8" = deps: { features?(features_.socket2."0.3.8" deps {}) }: buildRustCrate {
    crateName = "socket2";
    version = "0.3.8";
    description = "Utilities for handling networking sockets with a maximal amount of configuration\npossible intended.\n";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "1a71m20jxmf9kqqinksphc7wj1j7q672q29cpza7p9siyzyfx598";
    dependencies = (if (kernel == "linux" || kernel == "darwin") || kernel == "redox" then mapFeatures features ([
      (crates."cfg_if"."${deps."socket2"."0.3.8"."cfg_if"}" deps)
      (crates."libc"."${deps."socket2"."0.3.8"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "redox" then mapFeatures features ([
      (crates."redox_syscall"."${deps."socket2"."0.3.8"."redox_syscall"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."socket2"."0.3.8"."winapi"}" deps)
    ]) else []);
    features = mkFeatures (features."socket2"."0.3.8" or {});
  };
  features_.socket2."0.3.8" = deps: f: updateFeatures f (rec {
    cfg_if."${deps.socket2."0.3.8".cfg_if}".default = true;
    libc."${deps.socket2."0.3.8".libc}".default = true;
    redox_syscall."${deps.socket2."0.3.8".redox_syscall}".default = true;
    socket2."0.3.8".default = (f.socket2."0.3.8".default or true);
    winapi = fold recursiveUpdate {} [
      { "${deps.socket2."0.3.8".winapi}"."handleapi" = true; }
      { "${deps.socket2."0.3.8".winapi}"."minwindef" = true; }
      { "${deps.socket2."0.3.8".winapi}"."ws2def" = true; }
      { "${deps.socket2."0.3.8".winapi}"."ws2ipdef" = true; }
      { "${deps.socket2."0.3.8".winapi}"."ws2tcpip" = true; }
      { "${deps.socket2."0.3.8".winapi}".default = true; }
    ];
  }) [
    (features_.cfg_if."${deps."socket2"."0.3.8"."cfg_if"}" deps)
    (features_.libc."${deps."socket2"."0.3.8"."libc"}" deps)
    (features_.redox_syscall."${deps."socket2"."0.3.8"."redox_syscall"}" deps)
    (features_.winapi."${deps."socket2"."0.3.8"."winapi"}" deps)
  ];


# end
# stable_deref_trait-1.1.1

  crates.stable_deref_trait."1.1.1" = deps: { features?(features_.stable_deref_trait."1.1.1" deps {}) }: buildRustCrate {
    crateName = "stable_deref_trait";
    version = "1.1.1";
    description = "An unsafe marker trait for types like Box and Rc that dereference to a stable address even when moved, and hence can be used with libraries such as owning_ref and rental.\n";
    authors = [ "Robert Grosse <n210241048576@gmail.com>" ];
    sha256 = "1xy9slzslrzr31nlnw52sl1d820b09y61b7f13lqgsn8n7y0l4g8";
    features = mkFeatures (features."stable_deref_trait"."1.1.1" or {});
  };
  features_.stable_deref_trait."1.1.1" = deps: f: updateFeatures f (rec {
    stable_deref_trait = fold recursiveUpdate {} [
      { "1.1.1"."std" =
        (f.stable_deref_trait."1.1.1"."std" or false) ||
        (f.stable_deref_trait."1.1.1".default or false) ||
        (stable_deref_trait."1.1.1"."default" or false); }
      { "1.1.1".default = (f.stable_deref_trait."1.1.1".default or true); }
    ];
  }) [];


# end
# string-0.1.3

  crates.string."0.1.3" = deps: { features?(features_.string."0.1.3" deps {}) }: buildRustCrate {
    crateName = "string";
    version = "0.1.3";
    description = "A UTF-8 encoded string with configurable byte storage.";
    authors = [ "Carl Lerche <me@carllerche.com>" ];
    sha256 = "03hr559lsxf13i1p5r2zd7m3ppqlbhqajbx80adi3cpp2rwnsvfw";
  };
  features_.string."0.1.3" = deps: f: updateFeatures f (rec {
    string."0.1.3".default = (f.string."0.1.3".default or true);
  }) [];


# end
# strsim-0.8.0

  crates.strsim."0.8.0" = deps: { features?(features_.strsim."0.8.0" deps {}) }: buildRustCrate {
    crateName = "strsim";
    version = "0.8.0";
    description = "Implementations of string similarity metrics.\nIncludes Hamming, Levenshtein, OSA, Damerau-Levenshtein, Jaro, and Jaro-Winkler.\n";
    authors = [ "Danny Guo <dannyguo91@gmail.com>" ];
    sha256 = "0d3jsdz22wgjyxdakqnvdgmwjdvkximz50d9zfk4qlalw635qcvy";
  };
  features_.strsim."0.8.0" = deps: f: updateFeatures f (rec {
    strsim."0.8.0".default = (f.strsim."0.8.0".default or true);
  }) [];


# end
# syn-0.15.33

  crates.syn."0.15.33" = deps: { features?(features_.syn."0.15.33" deps {}) }: buildRustCrate {
    crateName = "syn";
    version = "0.15.33";
    description = "Parser for Rust source code";
    authors = [ "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "19fv7nh1k3adh7dnbz45jg645v358n6kw8zf9xlhfcsc3532wy2j";
    dependencies = mapFeatures features ([
      (crates."proc_macro2"."${deps."syn"."0.15.33"."proc_macro2"}" deps)
      (crates."unicode_xid"."${deps."syn"."0.15.33"."unicode_xid"}" deps)
    ]
      ++ (if features.syn."0.15.33".quote or false then [ (crates.quote."${deps."syn"."0.15.33".quote}" deps) ] else []));
    features = mkFeatures (features."syn"."0.15.33" or {});
  };
  features_.syn."0.15.33" = deps: f: updateFeatures f (rec {
    proc_macro2 = fold recursiveUpdate {} [
      { "${deps.syn."0.15.33".proc_macro2}"."proc-macro" =
        (f.proc_macro2."${deps.syn."0.15.33".proc_macro2}"."proc-macro" or false) ||
        (syn."0.15.33"."proc-macro" or false) ||
        (f."syn"."0.15.33"."proc-macro" or false); }
      { "${deps.syn."0.15.33".proc_macro2}".default = (f.proc_macro2."${deps.syn."0.15.33".proc_macro2}".default or false); }
    ];
    quote = fold recursiveUpdate {} [
      { "${deps.syn."0.15.33".quote}"."proc-macro" =
        (f.quote."${deps.syn."0.15.33".quote}"."proc-macro" or false) ||
        (syn."0.15.33"."proc-macro" or false) ||
        (f."syn"."0.15.33"."proc-macro" or false); }
      { "${deps.syn."0.15.33".quote}".default = (f.quote."${deps.syn."0.15.33".quote}".default or false); }
    ];
    syn = fold recursiveUpdate {} [
      { "0.15.33"."clone-impls" =
        (f.syn."0.15.33"."clone-impls" or false) ||
        (f.syn."0.15.33".default or false) ||
        (syn."0.15.33"."default" or false); }
      { "0.15.33"."derive" =
        (f.syn."0.15.33"."derive" or false) ||
        (f.syn."0.15.33".default or false) ||
        (syn."0.15.33"."default" or false); }
      { "0.15.33"."parsing" =
        (f.syn."0.15.33"."parsing" or false) ||
        (f.syn."0.15.33".default or false) ||
        (syn."0.15.33"."default" or false); }
      { "0.15.33"."printing" =
        (f.syn."0.15.33"."printing" or false) ||
        (f.syn."0.15.33".default or false) ||
        (syn."0.15.33"."default" or false); }
      { "0.15.33"."proc-macro" =
        (f.syn."0.15.33"."proc-macro" or false) ||
        (f.syn."0.15.33".default or false) ||
        (syn."0.15.33"."default" or false); }
      { "0.15.33"."quote" =
        (f.syn."0.15.33"."quote" or false) ||
        (f.syn."0.15.33".printing or false) ||
        (syn."0.15.33"."printing" or false); }
      { "0.15.33".default = (f.syn."0.15.33".default or true); }
    ];
    unicode_xid."${deps.syn."0.15.33".unicode_xid}".default = true;
  }) [
    (features_.proc_macro2."${deps."syn"."0.15.33"."proc_macro2"}" deps)
    (features_.quote."${deps."syn"."0.15.33"."quote"}" deps)
    (features_.unicode_xid."${deps."syn"."0.15.33"."unicode_xid"}" deps)
  ];


# end
# synstructure-0.10.1

  crates.synstructure."0.10.1" = deps: { features?(features_.synstructure."0.10.1" deps {}) }: buildRustCrate {
    crateName = "synstructure";
    version = "0.10.1";
    description = "Helper methods and macros for custom derives";
    authors = [ "Nika Layzell <nika@thelayzells.com>" ];
    sha256 = "0mx2vwd0d0f7hanz15nkp0ikkfjsx9rfkph7pynxyfbj45ank4g3";
    dependencies = mapFeatures features ([
      (crates."proc_macro2"."${deps."synstructure"."0.10.1"."proc_macro2"}" deps)
      (crates."quote"."${deps."synstructure"."0.10.1"."quote"}" deps)
      (crates."syn"."${deps."synstructure"."0.10.1"."syn"}" deps)
      (crates."unicode_xid"."${deps."synstructure"."0.10.1"."unicode_xid"}" deps)
    ]);
    features = mkFeatures (features."synstructure"."0.10.1" or {});
  };
  features_.synstructure."0.10.1" = deps: f: updateFeatures f (rec {
    proc_macro2."${deps.synstructure."0.10.1".proc_macro2}".default = true;
    quote."${deps.synstructure."0.10.1".quote}".default = true;
    syn = fold recursiveUpdate {} [
      { "${deps.synstructure."0.10.1".syn}"."extra-traits" = true; }
      { "${deps.synstructure."0.10.1".syn}"."visit" = true; }
      { "${deps.synstructure."0.10.1".syn}".default = true; }
    ];
    synstructure."0.10.1".default = (f.synstructure."0.10.1".default or true);
    unicode_xid."${deps.synstructure."0.10.1".unicode_xid}".default = true;
  }) [
    (features_.proc_macro2."${deps."synstructure"."0.10.1"."proc_macro2"}" deps)
    (features_.quote."${deps."synstructure"."0.10.1"."quote"}" deps)
    (features_.syn."${deps."synstructure"."0.10.1"."syn"}" deps)
    (features_.unicode_xid."${deps."synstructure"."0.10.1"."unicode_xid"}" deps)
  ];


# end
# tempdir-0.3.7

  crates.tempdir."0.3.7" = deps: { features?(features_.tempdir."0.3.7" deps {}) }: buildRustCrate {
    crateName = "tempdir";
    version = "0.3.7";
    description = "A library for managing a temporary directory and deleting all contents when it's\ndropped.\n";
    authors = [ "The Rust Project Developers" ];
    sha256 = "0y53sxybyljrr7lh0x0ysrsa7p7cljmwv9v80acy3rc6n97g67vy";
    dependencies = mapFeatures features ([
      (crates."rand"."${deps."tempdir"."0.3.7"."rand"}" deps)
      (crates."remove_dir_all"."${deps."tempdir"."0.3.7"."remove_dir_all"}" deps)
    ]);
  };
  features_.tempdir."0.3.7" = deps: f: updateFeatures f (rec {
    rand."${deps.tempdir."0.3.7".rand}".default = true;
    remove_dir_all."${deps.tempdir."0.3.7".remove_dir_all}".default = true;
    tempdir."0.3.7".default = (f.tempdir."0.3.7".default or true);
  }) [
    (features_.rand."${deps."tempdir"."0.3.7"."rand"}" deps)
    (features_.remove_dir_all."${deps."tempdir"."0.3.7"."remove_dir_all"}" deps)
  ];


# end
# tempfile-3.0.7

  crates.tempfile."3.0.7" = deps: { features?(features_.tempfile."3.0.7" deps {}) }: buildRustCrate {
    crateName = "tempfile";
    version = "3.0.7";
    description = "A library for managing temporary files and directories.\n";
    authors = [ "Steven Allen <steven@stebalien.com>" "The Rust Project Developers" "Ashley Mannix <ashleymannix@live.com.au>" "Jason White <jasonaw0@gmail.com>" ];
    sha256 = "19h7ch8fvisxrrmabcnhlfj6b8vg34zaw8491x141p0n0727niaf";
    dependencies = mapFeatures features ([
      (crates."cfg_if"."${deps."tempfile"."3.0.7"."cfg_if"}" deps)
      (crates."rand"."${deps."tempfile"."3.0.7"."rand"}" deps)
      (crates."remove_dir_all"."${deps."tempfile"."3.0.7"."remove_dir_all"}" deps)
    ])
      ++ (if kernel == "redox" then mapFeatures features ([
      (crates."redox_syscall"."${deps."tempfile"."3.0.7"."redox_syscall"}" deps)
    ]) else [])
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."tempfile"."3.0.7"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."tempfile"."3.0.7"."winapi"}" deps)
    ]) else []);
  };
  features_.tempfile."3.0.7" = deps: f: updateFeatures f (rec {
    cfg_if."${deps.tempfile."3.0.7".cfg_if}".default = true;
    libc."${deps.tempfile."3.0.7".libc}".default = true;
    rand."${deps.tempfile."3.0.7".rand}".default = true;
    redox_syscall."${deps.tempfile."3.0.7".redox_syscall}".default = true;
    remove_dir_all."${deps.tempfile."3.0.7".remove_dir_all}".default = true;
    tempfile."3.0.7".default = (f.tempfile."3.0.7".default or true);
    winapi = fold recursiveUpdate {} [
      { "${deps.tempfile."3.0.7".winapi}"."fileapi" = true; }
      { "${deps.tempfile."3.0.7".winapi}"."handleapi" = true; }
      { "${deps.tempfile."3.0.7".winapi}"."winbase" = true; }
      { "${deps.tempfile."3.0.7".winapi}".default = true; }
    ];
  }) [
    (features_.cfg_if."${deps."tempfile"."3.0.7"."cfg_if"}" deps)
    (features_.rand."${deps."tempfile"."3.0.7"."rand"}" deps)
    (features_.remove_dir_all."${deps."tempfile"."3.0.7"."remove_dir_all"}" deps)
    (features_.redox_syscall."${deps."tempfile"."3.0.7"."redox_syscall"}" deps)
    (features_.libc."${deps."tempfile"."3.0.7"."libc"}" deps)
    (features_.winapi."${deps."tempfile"."3.0.7"."winapi"}" deps)
  ];


# end
# termcolor-1.0.4

  crates.termcolor."1.0.4" = deps: { features?(features_.termcolor."1.0.4" deps {}) }: buildRustCrate {
    crateName = "termcolor";
    version = "1.0.4";
    description = "A simple cross platform library for writing colored text to a terminal.\n";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" ];
    sha256 = "0xydrjc0bxg08llcbcmkka29szdrfklk4vh6l6mdd67ajifqw1mv";
    dependencies = (if kernel == "windows" then mapFeatures features ([
      (crates."wincolor"."${deps."termcolor"."1.0.4"."wincolor"}" deps)
    ]) else []);
  };
  features_.termcolor."1.0.4" = deps: f: updateFeatures f (rec {
    termcolor."1.0.4".default = (f.termcolor."1.0.4".default or true);
    wincolor."${deps.termcolor."1.0.4".wincolor}".default = true;
  }) [
    (features_.wincolor."${deps."termcolor"."1.0.4"."wincolor"}" deps)
  ];


# end
# termion-1.5.2

  crates.termion."1.5.2" = deps: { features?(features_.termion."1.5.2" deps {}) }: buildRustCrate {
    crateName = "termion";
    version = "1.5.2";
    description = "A bindless library for manipulating terminals.";
    authors = [ "ticki <Ticki@users.noreply.github.com>" "gycos <alexandre.bury@gmail.com>" "IGI-111 <igi-111@protonmail.com>" ];
    sha256 = "0a8znl9hdnr9d21xskb2q77r6pkvrabh71b43371vy9wq97m78d9";
    dependencies = mapFeatures features ([
      (crates."numtoa"."${deps."termion"."1.5.2"."numtoa"}" deps)
    ])
      ++ (if !(kernel == "redox") then mapFeatures features ([
      (crates."libc"."${deps."termion"."1.5.2"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "redox" then mapFeatures features ([
      (crates."redox_syscall"."${deps."termion"."1.5.2"."redox_syscall"}" deps)
      (crates."redox_termios"."${deps."termion"."1.5.2"."redox_termios"}" deps)
    ]) else []);
  };
  features_.termion."1.5.2" = deps: f: updateFeatures f (rec {
    libc."${deps.termion."1.5.2".libc}".default = true;
    numtoa = fold recursiveUpdate {} [
      { "${deps.termion."1.5.2".numtoa}"."std" = true; }
      { "${deps.termion."1.5.2".numtoa}".default = true; }
    ];
    redox_syscall."${deps.termion."1.5.2".redox_syscall}".default = true;
    redox_termios."${deps.termion."1.5.2".redox_termios}".default = true;
    termion."1.5.2".default = (f.termion."1.5.2".default or true);
  }) [
    (features_.numtoa."${deps."termion"."1.5.2"."numtoa"}" deps)
    (features_.libc."${deps."termion"."1.5.2"."libc"}" deps)
    (features_.redox_syscall."${deps."termion"."1.5.2"."redox_syscall"}" deps)
    (features_.redox_termios."${deps."termion"."1.5.2"."redox_termios"}" deps)
  ];


# end
# textwrap-0.11.0

  crates.textwrap."0.11.0" = deps: { features?(features_.textwrap."0.11.0" deps {}) }: buildRustCrate {
    crateName = "textwrap";
    version = "0.11.0";
    description = "Textwrap is a small library for word wrapping, indenting, and\ndedenting strings.\n\nYou can use it to format strings (such as help and error messages) for\ndisplay in commandline applications. It is designed to be efficient\nand handle Unicode characters correctly.\n";
    authors = [ "Martin Geisler <martin@geisler.net>" ];
    sha256 = "0s25qh49n7kjayrdj4q3v0jk0jc6vy88rdw0bvgfxqlscpqpxi7d";
    dependencies = mapFeatures features ([
      (crates."unicode_width"."${deps."textwrap"."0.11.0"."unicode_width"}" deps)
    ]);
  };
  features_.textwrap."0.11.0" = deps: f: updateFeatures f (rec {
    textwrap."0.11.0".default = (f.textwrap."0.11.0".default or true);
    unicode_width."${deps.textwrap."0.11.0".unicode_width}".default = true;
  }) [
    (features_.unicode_width."${deps."textwrap"."0.11.0"."unicode_width"}" deps)
  ];


# end
# thread_local-0.3.6

  crates.thread_local."0.3.6" = deps: { features?(features_.thread_local."0.3.6" deps {}) }: buildRustCrate {
    crateName = "thread_local";
    version = "0.3.6";
    description = "Per-object thread-local storage";
    authors = [ "Amanieu d'Antras <amanieu@gmail.com>" ];
    sha256 = "02rksdwjmz2pw9bmgbb4c0bgkbq5z6nvg510sq1s6y2j1gam0c7i";
    dependencies = mapFeatures features ([
      (crates."lazy_static"."${deps."thread_local"."0.3.6"."lazy_static"}" deps)
    ]);
  };
  features_.thread_local."0.3.6" = deps: f: updateFeatures f (rec {
    lazy_static."${deps.thread_local."0.3.6".lazy_static}".default = true;
    thread_local."0.3.6".default = (f.thread_local."0.3.6".default or true);
  }) [
    (features_.lazy_static."${deps."thread_local"."0.3.6"."lazy_static"}" deps)
  ];


# end
# time-0.1.42

  crates.time."0.1.42" = deps: { features?(features_.time."0.1.42" deps {}) }: buildRustCrate {
    crateName = "time";
    version = "0.1.42";
    description = "Utilities for working with time-related functions in Rust.\n";
    authors = [ "The Rust Project Developers" ];
    sha256 = "1ny809kmdjwd4b478ipc33dz7q6nq7rxk766x8cnrg6zygcksmmx";
    dependencies = mapFeatures features ([
      (crates."libc"."${deps."time"."0.1.42"."libc"}" deps)
    ])
      ++ (if kernel == "redox" then mapFeatures features ([
      (crates."redox_syscall"."${deps."time"."0.1.42"."redox_syscall"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."time"."0.1.42"."winapi"}" deps)
    ]) else []);
  };
  features_.time."0.1.42" = deps: f: updateFeatures f (rec {
    libc."${deps.time."0.1.42".libc}".default = true;
    redox_syscall."${deps.time."0.1.42".redox_syscall}".default = true;
    time."0.1.42".default = (f.time."0.1.42".default or true);
    winapi = fold recursiveUpdate {} [
      { "${deps.time."0.1.42".winapi}"."minwinbase" = true; }
      { "${deps.time."0.1.42".winapi}"."minwindef" = true; }
      { "${deps.time."0.1.42".winapi}"."ntdef" = true; }
      { "${deps.time."0.1.42".winapi}"."profileapi" = true; }
      { "${deps.time."0.1.42".winapi}"."std" = true; }
      { "${deps.time."0.1.42".winapi}"."sysinfoapi" = true; }
      { "${deps.time."0.1.42".winapi}"."timezoneapi" = true; }
      { "${deps.time."0.1.42".winapi}".default = true; }
    ];
  }) [
    (features_.libc."${deps."time"."0.1.42"."libc"}" deps)
    (features_.redox_syscall."${deps."time"."0.1.42"."redox_syscall"}" deps)
    (features_.winapi."${deps."time"."0.1.42"."winapi"}" deps)
  ];


# end
# tokio-0.1.19

  crates.tokio."0.1.19" = deps: { features?(features_.tokio."0.1.19" deps {}) }: buildRustCrate {
    crateName = "tokio";
    version = "0.1.19";
    description = "An event-driven, non-blocking I/O platform for writing asynchronous I/O\nbacked applications.\n";
    authors = [ "Carl Lerche <me@carllerche.com>" ];
    sha256 = "0ksqs54h69x97zg2df7k069vbxqd7mvdpaws4aahnd05n95afcib";
    dependencies = mapFeatures features ([
      (crates."futures"."${deps."tokio"."0.1.19"."futures"}" deps)
    ]
      ++ (if features.tokio."0.1.19".bytes or false then [ (crates.bytes."${deps."tokio"."0.1.19".bytes}" deps) ] else [])
      ++ (if features.tokio."0.1.19".mio or false then [ (crates.mio."${deps."tokio"."0.1.19".mio}" deps) ] else [])
      ++ (if features.tokio."0.1.19".num_cpus or false then [ (crates.num_cpus."${deps."tokio"."0.1.19".num_cpus}" deps) ] else [])
      ++ (if features.tokio."0.1.19".tokio-codec or false then [ (crates.tokio_codec."${deps."tokio"."0.1.19".tokio_codec}" deps) ] else [])
      ++ (if features.tokio."0.1.19".tokio-current-thread or false then [ (crates.tokio_current_thread."${deps."tokio"."0.1.19".tokio_current_thread}" deps) ] else [])
      ++ (if features.tokio."0.1.19".tokio-executor or false then [ (crates.tokio_executor."${deps."tokio"."0.1.19".tokio_executor}" deps) ] else [])
      ++ (if features.tokio."0.1.19".tokio-fs or false then [ (crates.tokio_fs."${deps."tokio"."0.1.19".tokio_fs}" deps) ] else [])
      ++ (if features.tokio."0.1.19".tokio-io or false then [ (crates.tokio_io."${deps."tokio"."0.1.19".tokio_io}" deps) ] else [])
      ++ (if features.tokio."0.1.19".tokio-reactor or false then [ (crates.tokio_reactor."${deps."tokio"."0.1.19".tokio_reactor}" deps) ] else [])
      ++ (if features.tokio."0.1.19".tokio-sync or false then [ (crates.tokio_sync."${deps."tokio"."0.1.19".tokio_sync}" deps) ] else [])
      ++ (if features.tokio."0.1.19".tokio-tcp or false then [ (crates.tokio_tcp."${deps."tokio"."0.1.19".tokio_tcp}" deps) ] else [])
      ++ (if features.tokio."0.1.19".tokio-threadpool or false then [ (crates.tokio_threadpool."${deps."tokio"."0.1.19".tokio_threadpool}" deps) ] else [])
      ++ (if features.tokio."0.1.19".tokio-timer or false then [ (crates.tokio_timer."${deps."tokio"."0.1.19".tokio_timer}" deps) ] else [])
      ++ (if features.tokio."0.1.19".tokio-trace-core or false then [ (crates.tokio_trace_core."${deps."tokio"."0.1.19".tokio_trace_core}" deps) ] else [])
      ++ (if features.tokio."0.1.19".tokio-udp or false then [ (crates.tokio_udp."${deps."tokio"."0.1.19".tokio_udp}" deps) ] else []))
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
    ]
      ++ (if features.tokio."0.1.19".tokio-uds or false then [ (crates.tokio_uds."${deps."tokio"."0.1.19".tokio_uds}" deps) ] else [])) else []);
    features = mkFeatures (features."tokio"."0.1.19" or {});
  };
  features_.tokio."0.1.19" = deps: f: updateFeatures f (rec {
    bytes."${deps.tokio."0.1.19".bytes}".default = true;
    futures."${deps.tokio."0.1.19".futures}".default = true;
    mio."${deps.tokio."0.1.19".mio}".default = true;
    num_cpus."${deps.tokio."0.1.19".num_cpus}".default = true;
    tokio = fold recursiveUpdate {} [
      { "0.1.19"."bytes" =
        (f.tokio."0.1.19"."bytes" or false) ||
        (f.tokio."0.1.19".io or false) ||
        (tokio."0.1.19"."io" or false); }
      { "0.1.19"."codec" =
        (f.tokio."0.1.19"."codec" or false) ||
        (f.tokio."0.1.19".default or false) ||
        (tokio."0.1.19"."default" or false); }
      { "0.1.19"."fs" =
        (f.tokio."0.1.19"."fs" or false) ||
        (f.tokio."0.1.19".default or false) ||
        (tokio."0.1.19"."default" or false); }
      { "0.1.19"."io" =
        (f.tokio."0.1.19"."io" or false) ||
        (f.tokio."0.1.19".codec or false) ||
        (tokio."0.1.19"."codec" or false) ||
        (f.tokio."0.1.19".default or false) ||
        (tokio."0.1.19"."default" or false) ||
        (f.tokio."0.1.19".reactor or false) ||
        (tokio."0.1.19"."reactor" or false); }
      { "0.1.19"."mio" =
        (f.tokio."0.1.19"."mio" or false) ||
        (f.tokio."0.1.19".reactor or false) ||
        (tokio."0.1.19"."reactor" or false); }
      { "0.1.19"."num_cpus" =
        (f.tokio."0.1.19"."num_cpus" or false) ||
        (f.tokio."0.1.19".rt-full or false) ||
        (tokio."0.1.19"."rt-full" or false); }
      { "0.1.19"."reactor" =
        (f.tokio."0.1.19"."reactor" or false) ||
        (f.tokio."0.1.19".default or false) ||
        (tokio."0.1.19"."default" or false) ||
        (f.tokio."0.1.19".rt-full or false) ||
        (tokio."0.1.19"."rt-full" or false); }
      { "0.1.19"."rt-full" =
        (f.tokio."0.1.19"."rt-full" or false) ||
        (f.tokio."0.1.19".default or false) ||
        (tokio."0.1.19"."default" or false); }
      { "0.1.19"."sync" =
        (f.tokio."0.1.19"."sync" or false) ||
        (f.tokio."0.1.19".default or false) ||
        (tokio."0.1.19"."default" or false); }
      { "0.1.19"."tcp" =
        (f.tokio."0.1.19"."tcp" or false) ||
        (f.tokio."0.1.19".default or false) ||
        (tokio."0.1.19"."default" or false); }
      { "0.1.19"."timer" =
        (f.tokio."0.1.19"."timer" or false) ||
        (f.tokio."0.1.19".default or false) ||
        (tokio."0.1.19"."default" or false) ||
        (f.tokio."0.1.19".rt-full or false) ||
        (tokio."0.1.19"."rt-full" or false); }
      { "0.1.19"."tokio-codec" =
        (f.tokio."0.1.19"."tokio-codec" or false) ||
        (f.tokio."0.1.19".codec or false) ||
        (tokio."0.1.19"."codec" or false); }
      { "0.1.19"."tokio-current-thread" =
        (f.tokio."0.1.19"."tokio-current-thread" or false) ||
        (f.tokio."0.1.19".rt-full or false) ||
        (tokio."0.1.19"."rt-full" or false); }
      { "0.1.19"."tokio-executor" =
        (f.tokio."0.1.19"."tokio-executor" or false) ||
        (f.tokio."0.1.19".rt-full or false) ||
        (tokio."0.1.19"."rt-full" or false); }
      { "0.1.19"."tokio-fs" =
        (f.tokio."0.1.19"."tokio-fs" or false) ||
        (f.tokio."0.1.19".fs or false) ||
        (tokio."0.1.19"."fs" or false); }
      { "0.1.19"."tokio-io" =
        (f.tokio."0.1.19"."tokio-io" or false) ||
        (f.tokio."0.1.19".io or false) ||
        (tokio."0.1.19"."io" or false); }
      { "0.1.19"."tokio-reactor" =
        (f.tokio."0.1.19"."tokio-reactor" or false) ||
        (f.tokio."0.1.19".reactor or false) ||
        (tokio."0.1.19"."reactor" or false); }
      { "0.1.19"."tokio-sync" =
        (f.tokio."0.1.19"."tokio-sync" or false) ||
        (f.tokio."0.1.19".sync or false) ||
        (tokio."0.1.19"."sync" or false); }
      { "0.1.19"."tokio-tcp" =
        (f.tokio."0.1.19"."tokio-tcp" or false) ||
        (f.tokio."0.1.19".tcp or false) ||
        (tokio."0.1.19"."tcp" or false); }
      { "0.1.19"."tokio-threadpool" =
        (f.tokio."0.1.19"."tokio-threadpool" or false) ||
        (f.tokio."0.1.19".rt-full or false) ||
        (tokio."0.1.19"."rt-full" or false); }
      { "0.1.19"."tokio-timer" =
        (f.tokio."0.1.19"."tokio-timer" or false) ||
        (f.tokio."0.1.19".timer or false) ||
        (tokio."0.1.19"."timer" or false); }
      { "0.1.19"."tokio-trace-core" =
        (f.tokio."0.1.19"."tokio-trace-core" or false) ||
        (f.tokio."0.1.19".rt-full or false) ||
        (tokio."0.1.19"."rt-full" or false); }
      { "0.1.19"."tokio-udp" =
        (f.tokio."0.1.19"."tokio-udp" or false) ||
        (f.tokio."0.1.19".udp or false) ||
        (tokio."0.1.19"."udp" or false); }
      { "0.1.19"."tokio-uds" =
        (f.tokio."0.1.19"."tokio-uds" or false) ||
        (f.tokio."0.1.19".uds or false) ||
        (tokio."0.1.19"."uds" or false); }
      { "0.1.19"."udp" =
        (f.tokio."0.1.19"."udp" or false) ||
        (f.tokio."0.1.19".default or false) ||
        (tokio."0.1.19"."default" or false); }
      { "0.1.19"."uds" =
        (f.tokio."0.1.19"."uds" or false) ||
        (f.tokio."0.1.19".default or false) ||
        (tokio."0.1.19"."default" or false); }
      { "0.1.19".default = (f.tokio."0.1.19".default or true); }
    ];
    tokio_codec."${deps.tokio."0.1.19".tokio_codec}".default = true;
    tokio_current_thread."${deps.tokio."0.1.19".tokio_current_thread}".default = true;
    tokio_executor."${deps.tokio."0.1.19".tokio_executor}".default = true;
    tokio_fs."${deps.tokio."0.1.19".tokio_fs}".default = true;
    tokio_io."${deps.tokio."0.1.19".tokio_io}".default = true;
    tokio_reactor."${deps.tokio."0.1.19".tokio_reactor}".default = true;
    tokio_sync."${deps.tokio."0.1.19".tokio_sync}".default = true;
    tokio_tcp."${deps.tokio."0.1.19".tokio_tcp}".default = true;
    tokio_threadpool."${deps.tokio."0.1.19".tokio_threadpool}".default = true;
    tokio_timer."${deps.tokio."0.1.19".tokio_timer}".default = true;
    tokio_trace_core."${deps.tokio."0.1.19".tokio_trace_core}".default = true;
    tokio_udp."${deps.tokio."0.1.19".tokio_udp}".default = true;
    tokio_uds."${deps.tokio."0.1.19".tokio_uds}".default = true;
  }) [
    (features_.bytes."${deps."tokio"."0.1.19"."bytes"}" deps)
    (features_.futures."${deps."tokio"."0.1.19"."futures"}" deps)
    (features_.mio."${deps."tokio"."0.1.19"."mio"}" deps)
    (features_.num_cpus."${deps."tokio"."0.1.19"."num_cpus"}" deps)
    (features_.tokio_codec."${deps."tokio"."0.1.19"."tokio_codec"}" deps)
    (features_.tokio_current_thread."${deps."tokio"."0.1.19"."tokio_current_thread"}" deps)
    (features_.tokio_executor."${deps."tokio"."0.1.19"."tokio_executor"}" deps)
    (features_.tokio_fs."${deps."tokio"."0.1.19"."tokio_fs"}" deps)
    (features_.tokio_io."${deps."tokio"."0.1.19"."tokio_io"}" deps)
    (features_.tokio_reactor."${deps."tokio"."0.1.19"."tokio_reactor"}" deps)
    (features_.tokio_sync."${deps."tokio"."0.1.19"."tokio_sync"}" deps)
    (features_.tokio_tcp."${deps."tokio"."0.1.19"."tokio_tcp"}" deps)
    (features_.tokio_threadpool."${deps."tokio"."0.1.19"."tokio_threadpool"}" deps)
    (features_.tokio_timer."${deps."tokio"."0.1.19"."tokio_timer"}" deps)
    (features_.tokio_trace_core."${deps."tokio"."0.1.19"."tokio_trace_core"}" deps)
    (features_.tokio_udp."${deps."tokio"."0.1.19"."tokio_udp"}" deps)
    (features_.tokio_uds."${deps."tokio"."0.1.19"."tokio_uds"}" deps)
  ];


# end
# tokio-codec-0.1.1

  crates.tokio_codec."0.1.1" = deps: { features?(features_.tokio_codec."0.1.1" deps {}) }: buildRustCrate {
    crateName = "tokio-codec";
    version = "0.1.1";
    description = "Utilities for encoding and decoding frames.\n";
    authors = [ "Carl Lerche <me@carllerche.com>" "Bryan Burgers <bryan@burgers.io>" ];
    sha256 = "0jc9lik540zyj4chbygg1rjh37m3zax8pd4bwcrwjmi1v56qwi4h";
    dependencies = mapFeatures features ([
      (crates."bytes"."${deps."tokio_codec"."0.1.1"."bytes"}" deps)
      (crates."futures"."${deps."tokio_codec"."0.1.1"."futures"}" deps)
      (crates."tokio_io"."${deps."tokio_codec"."0.1.1"."tokio_io"}" deps)
    ]);
  };
  features_.tokio_codec."0.1.1" = deps: f: updateFeatures f (rec {
    bytes."${deps.tokio_codec."0.1.1".bytes}".default = true;
    futures."${deps.tokio_codec."0.1.1".futures}".default = true;
    tokio_codec."0.1.1".default = (f.tokio_codec."0.1.1".default or true);
    tokio_io."${deps.tokio_codec."0.1.1".tokio_io}".default = true;
  }) [
    (features_.bytes."${deps."tokio_codec"."0.1.1"."bytes"}" deps)
    (features_.futures."${deps."tokio_codec"."0.1.1"."futures"}" deps)
    (features_.tokio_io."${deps."tokio_codec"."0.1.1"."tokio_io"}" deps)
  ];


# end
# tokio-current-thread-0.1.6

  crates.tokio_current_thread."0.1.6" = deps: { features?(features_.tokio_current_thread."0.1.6" deps {}) }: buildRustCrate {
    crateName = "tokio-current-thread";
    version = "0.1.6";
    description = "Single threaded executor which manage many tasks concurrently on the current thread.\n";
    authors = [ "Carl Lerche <me@carllerche.com>" ];
    sha256 = "07dm43svkrpifkcnv8f5w477cd9260pnkvnps39qkhkf5ixi8fzg";
    dependencies = mapFeatures features ([
      (crates."futures"."${deps."tokio_current_thread"."0.1.6"."futures"}" deps)
      (crates."tokio_executor"."${deps."tokio_current_thread"."0.1.6"."tokio_executor"}" deps)
    ]);
  };
  features_.tokio_current_thread."0.1.6" = deps: f: updateFeatures f (rec {
    futures."${deps.tokio_current_thread."0.1.6".futures}".default = true;
    tokio_current_thread."0.1.6".default = (f.tokio_current_thread."0.1.6".default or true);
    tokio_executor."${deps.tokio_current_thread."0.1.6".tokio_executor}".default = true;
  }) [
    (features_.futures."${deps."tokio_current_thread"."0.1.6"."futures"}" deps)
    (features_.tokio_executor."${deps."tokio_current_thread"."0.1.6"."tokio_executor"}" deps)
  ];


# end
# tokio-executor-0.1.7

  crates.tokio_executor."0.1.7" = deps: { features?(features_.tokio_executor."0.1.7" deps {}) }: buildRustCrate {
    crateName = "tokio-executor";
    version = "0.1.7";
    description = "Future execution primitives\n";
    authors = [ "Carl Lerche <me@carllerche.com>" ];
    sha256 = "0fhaijjh1cybikx0b53292xfi6yzjrmp10ibgikhd6i33svnggq7";
    dependencies = mapFeatures features ([
      (crates."crossbeam_utils"."${deps."tokio_executor"."0.1.7"."crossbeam_utils"}" deps)
      (crates."futures"."${deps."tokio_executor"."0.1.7"."futures"}" deps)
    ]);
  };
  features_.tokio_executor."0.1.7" = deps: f: updateFeatures f (rec {
    crossbeam_utils."${deps.tokio_executor."0.1.7".crossbeam_utils}".default = true;
    futures."${deps.tokio_executor."0.1.7".futures}".default = true;
    tokio_executor."0.1.7".default = (f.tokio_executor."0.1.7".default or true);
  }) [
    (features_.crossbeam_utils."${deps."tokio_executor"."0.1.7"."crossbeam_utils"}" deps)
    (features_.futures."${deps."tokio_executor"."0.1.7"."futures"}" deps)
  ];


# end
# tokio-fs-0.1.6

  crates.tokio_fs."0.1.6" = deps: { features?(features_.tokio_fs."0.1.6" deps {}) }: buildRustCrate {
    crateName = "tokio-fs";
    version = "0.1.6";
    description = "Filesystem API for Tokio.\n";
    authors = [ "Carl Lerche <me@carllerche.com>" ];
    sha256 = "0v4mkwg7dj0fakzszy7nvr88y0bskwcvsy2w6d4pzmd186b0v640";
    dependencies = mapFeatures features ([
      (crates."futures"."${deps."tokio_fs"."0.1.6"."futures"}" deps)
      (crates."tokio_io"."${deps."tokio_fs"."0.1.6"."tokio_io"}" deps)
      (crates."tokio_threadpool"."${deps."tokio_fs"."0.1.6"."tokio_threadpool"}" deps)
    ]);
  };
  features_.tokio_fs."0.1.6" = deps: f: updateFeatures f (rec {
    futures."${deps.tokio_fs."0.1.6".futures}".default = true;
    tokio_fs."0.1.6".default = (f.tokio_fs."0.1.6".default or true);
    tokio_io."${deps.tokio_fs."0.1.6".tokio_io}".default = true;
    tokio_threadpool."${deps.tokio_fs."0.1.6".tokio_threadpool}".default = true;
  }) [
    (features_.futures."${deps."tokio_fs"."0.1.6"."futures"}" deps)
    (features_.tokio_io."${deps."tokio_fs"."0.1.6"."tokio_io"}" deps)
    (features_.tokio_threadpool."${deps."tokio_fs"."0.1.6"."tokio_threadpool"}" deps)
  ];


# end
# tokio-io-0.1.12

  crates.tokio_io."0.1.12" = deps: { features?(features_.tokio_io."0.1.12" deps {}) }: buildRustCrate {
    crateName = "tokio-io";
    version = "0.1.12";
    description = "Core I/O primitives for asynchronous I/O in Rust.\n";
    authors = [ "Carl Lerche <me@carllerche.com>" ];
    sha256 = "0z64yfcm9i5ci2h9h7npa292plia9kb04xbm7cp0bzp1wsddv91r";
    dependencies = mapFeatures features ([
      (crates."bytes"."${deps."tokio_io"."0.1.12"."bytes"}" deps)
      (crates."futures"."${deps."tokio_io"."0.1.12"."futures"}" deps)
      (crates."log"."${deps."tokio_io"."0.1.12"."log"}" deps)
    ]);
  };
  features_.tokio_io."0.1.12" = deps: f: updateFeatures f (rec {
    bytes."${deps.tokio_io."0.1.12".bytes}".default = true;
    futures."${deps.tokio_io."0.1.12".futures}".default = true;
    log."${deps.tokio_io."0.1.12".log}".default = true;
    tokio_io."0.1.12".default = (f.tokio_io."0.1.12".default or true);
  }) [
    (features_.bytes."${deps."tokio_io"."0.1.12"."bytes"}" deps)
    (features_.futures."${deps."tokio_io"."0.1.12"."futures"}" deps)
    (features_.log."${deps."tokio_io"."0.1.12"."log"}" deps)
  ];


# end
# tokio-reactor-0.1.9

  crates.tokio_reactor."0.1.9" = deps: { features?(features_.tokio_reactor."0.1.9" deps {}) }: buildRustCrate {
    crateName = "tokio-reactor";
    version = "0.1.9";
    description = "Event loop that drives Tokio I/O resources.\n";
    authors = [ "Carl Lerche <me@carllerche.com>" ];
    sha256 = "11gpxrykd6lbpj9b26dh4fymzawfxgqdx1pbhc771gxbf8qyj1gc";
    dependencies = mapFeatures features ([
      (crates."crossbeam_utils"."${deps."tokio_reactor"."0.1.9"."crossbeam_utils"}" deps)
      (crates."futures"."${deps."tokio_reactor"."0.1.9"."futures"}" deps)
      (crates."lazy_static"."${deps."tokio_reactor"."0.1.9"."lazy_static"}" deps)
      (crates."log"."${deps."tokio_reactor"."0.1.9"."log"}" deps)
      (crates."mio"."${deps."tokio_reactor"."0.1.9"."mio"}" deps)
      (crates."num_cpus"."${deps."tokio_reactor"."0.1.9"."num_cpus"}" deps)
      (crates."parking_lot"."${deps."tokio_reactor"."0.1.9"."parking_lot"}" deps)
      (crates."slab"."${deps."tokio_reactor"."0.1.9"."slab"}" deps)
      (crates."tokio_executor"."${deps."tokio_reactor"."0.1.9"."tokio_executor"}" deps)
      (crates."tokio_io"."${deps."tokio_reactor"."0.1.9"."tokio_io"}" deps)
      (crates."tokio_sync"."${deps."tokio_reactor"."0.1.9"."tokio_sync"}" deps)
    ]);
  };
  features_.tokio_reactor."0.1.9" = deps: f: updateFeatures f (rec {
    crossbeam_utils."${deps.tokio_reactor."0.1.9".crossbeam_utils}".default = true;
    futures."${deps.tokio_reactor."0.1.9".futures}".default = true;
    lazy_static."${deps.tokio_reactor."0.1.9".lazy_static}".default = true;
    log."${deps.tokio_reactor."0.1.9".log}".default = true;
    mio."${deps.tokio_reactor."0.1.9".mio}".default = true;
    num_cpus."${deps.tokio_reactor."0.1.9".num_cpus}".default = true;
    parking_lot."${deps.tokio_reactor."0.1.9".parking_lot}".default = true;
    slab."${deps.tokio_reactor."0.1.9".slab}".default = true;
    tokio_executor."${deps.tokio_reactor."0.1.9".tokio_executor}".default = true;
    tokio_io."${deps.tokio_reactor."0.1.9".tokio_io}".default = true;
    tokio_reactor."0.1.9".default = (f.tokio_reactor."0.1.9".default or true);
    tokio_sync."${deps.tokio_reactor."0.1.9".tokio_sync}".default = true;
  }) [
    (features_.crossbeam_utils."${deps."tokio_reactor"."0.1.9"."crossbeam_utils"}" deps)
    (features_.futures."${deps."tokio_reactor"."0.1.9"."futures"}" deps)
    (features_.lazy_static."${deps."tokio_reactor"."0.1.9"."lazy_static"}" deps)
    (features_.log."${deps."tokio_reactor"."0.1.9"."log"}" deps)
    (features_.mio."${deps."tokio_reactor"."0.1.9"."mio"}" deps)
    (features_.num_cpus."${deps."tokio_reactor"."0.1.9"."num_cpus"}" deps)
    (features_.parking_lot."${deps."tokio_reactor"."0.1.9"."parking_lot"}" deps)
    (features_.slab."${deps."tokio_reactor"."0.1.9"."slab"}" deps)
    (features_.tokio_executor."${deps."tokio_reactor"."0.1.9"."tokio_executor"}" deps)
    (features_.tokio_io."${deps."tokio_reactor"."0.1.9"."tokio_io"}" deps)
    (features_.tokio_sync."${deps."tokio_reactor"."0.1.9"."tokio_sync"}" deps)
  ];


# end
# tokio-signal-0.2.7

  crates.tokio_signal."0.2.7" = deps: { features?(features_.tokio_signal."0.2.7" deps {}) }: buildRustCrate {
    crateName = "tokio-signal";
    version = "0.2.7";
    description = "An implementation of an asynchronous Unix signal handling backed futures.\n";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "14fkmzjsqrk2k1f0hay1qf09nz2l4f8xvr8m2vgmlg867fjbvg32";
    dependencies = mapFeatures features ([
      (crates."futures"."${deps."tokio_signal"."0.2.7"."futures"}" deps)
      (crates."mio"."${deps."tokio_signal"."0.2.7"."mio"}" deps)
      (crates."tokio_executor"."${deps."tokio_signal"."0.2.7"."tokio_executor"}" deps)
      (crates."tokio_io"."${deps."tokio_signal"."0.2.7"."tokio_io"}" deps)
      (crates."tokio_reactor"."${deps."tokio_signal"."0.2.7"."tokio_reactor"}" deps)
    ])
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."tokio_signal"."0.2.7"."libc"}" deps)
      (crates."mio_uds"."${deps."tokio_signal"."0.2.7"."mio_uds"}" deps)
      (crates."signal_hook"."${deps."tokio_signal"."0.2.7"."signal_hook"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."tokio_signal"."0.2.7"."winapi"}" deps)
    ]) else []);
  };
  features_.tokio_signal."0.2.7" = deps: f: updateFeatures f (rec {
    futures."${deps.tokio_signal."0.2.7".futures}".default = true;
    libc."${deps.tokio_signal."0.2.7".libc}".default = true;
    mio."${deps.tokio_signal."0.2.7".mio}".default = true;
    mio_uds."${deps.tokio_signal."0.2.7".mio_uds}".default = true;
    signal_hook."${deps.tokio_signal."0.2.7".signal_hook}".default = true;
    tokio_executor."${deps.tokio_signal."0.2.7".tokio_executor}".default = true;
    tokio_io."${deps.tokio_signal."0.2.7".tokio_io}".default = true;
    tokio_reactor."${deps.tokio_signal."0.2.7".tokio_reactor}".default = true;
    tokio_signal."0.2.7".default = (f.tokio_signal."0.2.7".default or true);
    winapi = fold recursiveUpdate {} [
      { "${deps.tokio_signal."0.2.7".winapi}"."minwindef" = true; }
      { "${deps.tokio_signal."0.2.7".winapi}"."wincon" = true; }
      { "${deps.tokio_signal."0.2.7".winapi}".default = true; }
    ];
  }) [
    (features_.futures."${deps."tokio_signal"."0.2.7"."futures"}" deps)
    (features_.mio."${deps."tokio_signal"."0.2.7"."mio"}" deps)
    (features_.tokio_executor."${deps."tokio_signal"."0.2.7"."tokio_executor"}" deps)
    (features_.tokio_io."${deps."tokio_signal"."0.2.7"."tokio_io"}" deps)
    (features_.tokio_reactor."${deps."tokio_signal"."0.2.7"."tokio_reactor"}" deps)
    (features_.libc."${deps."tokio_signal"."0.2.7"."libc"}" deps)
    (features_.mio_uds."${deps."tokio_signal"."0.2.7"."mio_uds"}" deps)
    (features_.signal_hook."${deps."tokio_signal"."0.2.7"."signal_hook"}" deps)
    (features_.winapi."${deps."tokio_signal"."0.2.7"."winapi"}" deps)
  ];


# end
# tokio-sync-0.1.5

  crates.tokio_sync."0.1.5" = deps: { features?(features_.tokio_sync."0.1.5" deps {}) }: buildRustCrate {
    crateName = "tokio-sync";
    version = "0.1.5";
    description = "Synchronization utilities.\n";
    authors = [ "Carl Lerche <me@carllerche.com>" ];
    sha256 = "0yjg2d4pyw9x9yvap3kndf53a55rj73fsx09c91sss92l1szk7vx";
    dependencies = mapFeatures features ([
      (crates."fnv"."${deps."tokio_sync"."0.1.5"."fnv"}" deps)
      (crates."futures"."${deps."tokio_sync"."0.1.5"."futures"}" deps)
    ]);
  };
  features_.tokio_sync."0.1.5" = deps: f: updateFeatures f (rec {
    fnv."${deps.tokio_sync."0.1.5".fnv}".default = true;
    futures."${deps.tokio_sync."0.1.5".futures}".default = true;
    tokio_sync."0.1.5".default = (f.tokio_sync."0.1.5".default or true);
  }) [
    (features_.fnv."${deps."tokio_sync"."0.1.5"."fnv"}" deps)
    (features_.futures."${deps."tokio_sync"."0.1.5"."futures"}" deps)
  ];


# end
# tokio-tcp-0.1.3

  crates.tokio_tcp."0.1.3" = deps: { features?(features_.tokio_tcp."0.1.3" deps {}) }: buildRustCrate {
    crateName = "tokio-tcp";
    version = "0.1.3";
    description = "TCP bindings for tokio.\n";
    authors = [ "Carl Lerche <me@carllerche.com>" ];
    sha256 = "07v5p339660zjy1w73wddagj3n5wa4v7v5gj7hnvw95ka407zvcz";
    dependencies = mapFeatures features ([
      (crates."bytes"."${deps."tokio_tcp"."0.1.3"."bytes"}" deps)
      (crates."futures"."${deps."tokio_tcp"."0.1.3"."futures"}" deps)
      (crates."iovec"."${deps."tokio_tcp"."0.1.3"."iovec"}" deps)
      (crates."mio"."${deps."tokio_tcp"."0.1.3"."mio"}" deps)
      (crates."tokio_io"."${deps."tokio_tcp"."0.1.3"."tokio_io"}" deps)
      (crates."tokio_reactor"."${deps."tokio_tcp"."0.1.3"."tokio_reactor"}" deps)
    ]);
  };
  features_.tokio_tcp."0.1.3" = deps: f: updateFeatures f (rec {
    bytes."${deps.tokio_tcp."0.1.3".bytes}".default = true;
    futures."${deps.tokio_tcp."0.1.3".futures}".default = true;
    iovec."${deps.tokio_tcp."0.1.3".iovec}".default = true;
    mio."${deps.tokio_tcp."0.1.3".mio}".default = true;
    tokio_io."${deps.tokio_tcp."0.1.3".tokio_io}".default = true;
    tokio_reactor."${deps.tokio_tcp."0.1.3".tokio_reactor}".default = true;
    tokio_tcp."0.1.3".default = (f.tokio_tcp."0.1.3".default or true);
  }) [
    (features_.bytes."${deps."tokio_tcp"."0.1.3"."bytes"}" deps)
    (features_.futures."${deps."tokio_tcp"."0.1.3"."futures"}" deps)
    (features_.iovec."${deps."tokio_tcp"."0.1.3"."iovec"}" deps)
    (features_.mio."${deps."tokio_tcp"."0.1.3"."mio"}" deps)
    (features_.tokio_io."${deps."tokio_tcp"."0.1.3"."tokio_io"}" deps)
    (features_.tokio_reactor."${deps."tokio_tcp"."0.1.3"."tokio_reactor"}" deps)
  ];


# end
# tokio-threadpool-0.1.14

  crates.tokio_threadpool."0.1.14" = deps: { features?(features_.tokio_threadpool."0.1.14" deps {}) }: buildRustCrate {
    crateName = "tokio-threadpool";
    version = "0.1.14";
    description = "A task scheduler backed by a work-stealing thread pool.\n";
    authors = [ "Carl Lerche <me@carllerche.com>" ];
    sha256 = "0b6m9xvl5m93y1nmdjr161j39f4ialc39qlm4dy8ad376v7ck1kp";
    dependencies = mapFeatures features ([
      (crates."crossbeam_deque"."${deps."tokio_threadpool"."0.1.14"."crossbeam_deque"}" deps)
      (crates."crossbeam_queue"."${deps."tokio_threadpool"."0.1.14"."crossbeam_queue"}" deps)
      (crates."crossbeam_utils"."${deps."tokio_threadpool"."0.1.14"."crossbeam_utils"}" deps)
      (crates."futures"."${deps."tokio_threadpool"."0.1.14"."futures"}" deps)
      (crates."log"."${deps."tokio_threadpool"."0.1.14"."log"}" deps)
      (crates."num_cpus"."${deps."tokio_threadpool"."0.1.14"."num_cpus"}" deps)
      (crates."rand"."${deps."tokio_threadpool"."0.1.14"."rand"}" deps)
      (crates."slab"."${deps."tokio_threadpool"."0.1.14"."slab"}" deps)
      (crates."tokio_executor"."${deps."tokio_threadpool"."0.1.14"."tokio_executor"}" deps)
    ]);
  };
  features_.tokio_threadpool."0.1.14" = deps: f: updateFeatures f (rec {
    crossbeam_deque."${deps.tokio_threadpool."0.1.14".crossbeam_deque}".default = true;
    crossbeam_queue."${deps.tokio_threadpool."0.1.14".crossbeam_queue}".default = true;
    crossbeam_utils."${deps.tokio_threadpool."0.1.14".crossbeam_utils}".default = true;
    futures."${deps.tokio_threadpool."0.1.14".futures}".default = true;
    log."${deps.tokio_threadpool."0.1.14".log}".default = true;
    num_cpus."${deps.tokio_threadpool."0.1.14".num_cpus}".default = true;
    rand."${deps.tokio_threadpool."0.1.14".rand}".default = true;
    slab."${deps.tokio_threadpool."0.1.14".slab}".default = true;
    tokio_executor."${deps.tokio_threadpool."0.1.14".tokio_executor}".default = true;
    tokio_threadpool."0.1.14".default = (f.tokio_threadpool."0.1.14".default or true);
  }) [
    (features_.crossbeam_deque."${deps."tokio_threadpool"."0.1.14"."crossbeam_deque"}" deps)
    (features_.crossbeam_queue."${deps."tokio_threadpool"."0.1.14"."crossbeam_queue"}" deps)
    (features_.crossbeam_utils."${deps."tokio_threadpool"."0.1.14"."crossbeam_utils"}" deps)
    (features_.futures."${deps."tokio_threadpool"."0.1.14"."futures"}" deps)
    (features_.log."${deps."tokio_threadpool"."0.1.14"."log"}" deps)
    (features_.num_cpus."${deps."tokio_threadpool"."0.1.14"."num_cpus"}" deps)
    (features_.rand."${deps."tokio_threadpool"."0.1.14"."rand"}" deps)
    (features_.slab."${deps."tokio_threadpool"."0.1.14"."slab"}" deps)
    (features_.tokio_executor."${deps."tokio_threadpool"."0.1.14"."tokio_executor"}" deps)
  ];


# end
# tokio-timer-0.2.10

  crates.tokio_timer."0.2.10" = deps: { features?(features_.tokio_timer."0.2.10" deps {}) }: buildRustCrate {
    crateName = "tokio-timer";
    version = "0.2.10";
    description = "Timer facilities for Tokio\n";
    authors = [ "Carl Lerche <me@carllerche.com>" ];
    sha256 = "17a5irj7ph95l30845vg6hy3igc0k04bhxnqs2qww4v8ix30vbkz";
    dependencies = mapFeatures features ([
      (crates."crossbeam_utils"."${deps."tokio_timer"."0.2.10"."crossbeam_utils"}" deps)
      (crates."futures"."${deps."tokio_timer"."0.2.10"."futures"}" deps)
      (crates."slab"."${deps."tokio_timer"."0.2.10"."slab"}" deps)
      (crates."tokio_executor"."${deps."tokio_timer"."0.2.10"."tokio_executor"}" deps)
    ]);
  };
  features_.tokio_timer."0.2.10" = deps: f: updateFeatures f (rec {
    crossbeam_utils."${deps.tokio_timer."0.2.10".crossbeam_utils}".default = true;
    futures."${deps.tokio_timer."0.2.10".futures}".default = true;
    slab."${deps.tokio_timer."0.2.10".slab}".default = true;
    tokio_executor."${deps.tokio_timer."0.2.10".tokio_executor}".default = true;
    tokio_timer."0.2.10".default = (f.tokio_timer."0.2.10".default or true);
  }) [
    (features_.crossbeam_utils."${deps."tokio_timer"."0.2.10"."crossbeam_utils"}" deps)
    (features_.futures."${deps."tokio_timer"."0.2.10"."futures"}" deps)
    (features_.slab."${deps."tokio_timer"."0.2.10"."slab"}" deps)
    (features_.tokio_executor."${deps."tokio_timer"."0.2.10"."tokio_executor"}" deps)
  ];


# end
# tokio-trace-core-0.1.0

  crates.tokio_trace_core."0.1.0" = deps: { features?(features_.tokio_trace_core."0.1.0" deps {}) }: buildRustCrate {
    crateName = "tokio-trace-core";
    version = "0.1.0";
    description = "Core primitives for tokio-trace.\n";
    authors = [ "Tokio Contributors <team@tokio.rs>" ];
    sha256 = "1n96fnand06mnqfjhdicxs3qlhj8r1czjisx231hg4lszl3p5kqd";
    dependencies = mapFeatures features ([
      (crates."lazy_static"."${deps."tokio_trace_core"."0.1.0"."lazy_static"}" deps)
    ]);
  };
  features_.tokio_trace_core."0.1.0" = deps: f: updateFeatures f (rec {
    lazy_static."${deps.tokio_trace_core."0.1.0".lazy_static}".default = true;
    tokio_trace_core."0.1.0".default = (f.tokio_trace_core."0.1.0".default or true);
  }) [
    (features_.lazy_static."${deps."tokio_trace_core"."0.1.0"."lazy_static"}" deps)
  ];


# end
# tokio-udp-0.1.3

  crates.tokio_udp."0.1.3" = deps: { features?(features_.tokio_udp."0.1.3" deps {}) }: buildRustCrate {
    crateName = "tokio-udp";
    version = "0.1.3";
    description = "UDP bindings for tokio.\n";
    authors = [ "Carl Lerche <me@carllerche.com>" ];
    sha256 = "1g1x499vqvzwy7xfccr32vwymlx25zpmkx8ppqgifzqwrjnncajf";
    dependencies = mapFeatures features ([
      (crates."bytes"."${deps."tokio_udp"."0.1.3"."bytes"}" deps)
      (crates."futures"."${deps."tokio_udp"."0.1.3"."futures"}" deps)
      (crates."log"."${deps."tokio_udp"."0.1.3"."log"}" deps)
      (crates."mio"."${deps."tokio_udp"."0.1.3"."mio"}" deps)
      (crates."tokio_codec"."${deps."tokio_udp"."0.1.3"."tokio_codec"}" deps)
      (crates."tokio_io"."${deps."tokio_udp"."0.1.3"."tokio_io"}" deps)
      (crates."tokio_reactor"."${deps."tokio_udp"."0.1.3"."tokio_reactor"}" deps)
    ]);
  };
  features_.tokio_udp."0.1.3" = deps: f: updateFeatures f (rec {
    bytes."${deps.tokio_udp."0.1.3".bytes}".default = true;
    futures."${deps.tokio_udp."0.1.3".futures}".default = true;
    log."${deps.tokio_udp."0.1.3".log}".default = true;
    mio."${deps.tokio_udp."0.1.3".mio}".default = true;
    tokio_codec."${deps.tokio_udp."0.1.3".tokio_codec}".default = true;
    tokio_io."${deps.tokio_udp."0.1.3".tokio_io}".default = true;
    tokio_reactor."${deps.tokio_udp."0.1.3".tokio_reactor}".default = true;
    tokio_udp."0.1.3".default = (f.tokio_udp."0.1.3".default or true);
  }) [
    (features_.bytes."${deps."tokio_udp"."0.1.3"."bytes"}" deps)
    (features_.futures."${deps."tokio_udp"."0.1.3"."futures"}" deps)
    (features_.log."${deps."tokio_udp"."0.1.3"."log"}" deps)
    (features_.mio."${deps."tokio_udp"."0.1.3"."mio"}" deps)
    (features_.tokio_codec."${deps."tokio_udp"."0.1.3"."tokio_codec"}" deps)
    (features_.tokio_io."${deps."tokio_udp"."0.1.3"."tokio_io"}" deps)
    (features_.tokio_reactor."${deps."tokio_udp"."0.1.3"."tokio_reactor"}" deps)
  ];


# end
# tokio-uds-0.2.5

  crates.tokio_uds."0.2.5" = deps: { features?(features_.tokio_uds."0.2.5" deps {}) }: buildRustCrate {
    crateName = "tokio-uds";
    version = "0.2.5";
    description = "Unix Domain sockets for Tokio\n";
    authors = [ "Carl Lerche <me@carllerche.com>" ];
    sha256 = "1i4d9b4v9a3rza8bi1j2701w6xjvxxdpdaaw2za4h1x9qriq4rv9";
    dependencies = mapFeatures features ([
      (crates."bytes"."${deps."tokio_uds"."0.2.5"."bytes"}" deps)
      (crates."futures"."${deps."tokio_uds"."0.2.5"."futures"}" deps)
      (crates."iovec"."${deps."tokio_uds"."0.2.5"."iovec"}" deps)
      (crates."libc"."${deps."tokio_uds"."0.2.5"."libc"}" deps)
      (crates."log"."${deps."tokio_uds"."0.2.5"."log"}" deps)
      (crates."mio"."${deps."tokio_uds"."0.2.5"."mio"}" deps)
      (crates."mio_uds"."${deps."tokio_uds"."0.2.5"."mio_uds"}" deps)
      (crates."tokio_codec"."${deps."tokio_uds"."0.2.5"."tokio_codec"}" deps)
      (crates."tokio_io"."${deps."tokio_uds"."0.2.5"."tokio_io"}" deps)
      (crates."tokio_reactor"."${deps."tokio_uds"."0.2.5"."tokio_reactor"}" deps)
    ]);
  };
  features_.tokio_uds."0.2.5" = deps: f: updateFeatures f (rec {
    bytes."${deps.tokio_uds."0.2.5".bytes}".default = true;
    futures."${deps.tokio_uds."0.2.5".futures}".default = true;
    iovec."${deps.tokio_uds."0.2.5".iovec}".default = true;
    libc."${deps.tokio_uds."0.2.5".libc}".default = true;
    log."${deps.tokio_uds."0.2.5".log}".default = true;
    mio."${deps.tokio_uds."0.2.5".mio}".default = true;
    mio_uds."${deps.tokio_uds."0.2.5".mio_uds}".default = true;
    tokio_codec."${deps.tokio_uds."0.2.5".tokio_codec}".default = true;
    tokio_io."${deps.tokio_uds."0.2.5".tokio_io}".default = true;
    tokio_reactor."${deps.tokio_uds."0.2.5".tokio_reactor}".default = true;
    tokio_uds."0.2.5".default = (f.tokio_uds."0.2.5".default or true);
  }) [
    (features_.bytes."${deps."tokio_uds"."0.2.5"."bytes"}" deps)
    (features_.futures."${deps."tokio_uds"."0.2.5"."futures"}" deps)
    (features_.iovec."${deps."tokio_uds"."0.2.5"."iovec"}" deps)
    (features_.libc."${deps."tokio_uds"."0.2.5"."libc"}" deps)
    (features_.log."${deps."tokio_uds"."0.2.5"."log"}" deps)
    (features_.mio."${deps."tokio_uds"."0.2.5"."mio"}" deps)
    (features_.mio_uds."${deps."tokio_uds"."0.2.5"."mio_uds"}" deps)
    (features_.tokio_codec."${deps."tokio_uds"."0.2.5"."tokio_codec"}" deps)
    (features_.tokio_io."${deps."tokio_uds"."0.2.5"."tokio_io"}" deps)
    (features_.tokio_reactor."${deps."tokio_uds"."0.2.5"."tokio_reactor"}" deps)
  ];


# end
# tower-service-0.1.0

  crates.tower_service."0.1.0" = deps: { features?(features_.tower_service."0.1.0" deps {}) }: buildRustCrate {
    crateName = "tower-service";
    version = "0.1.0";
    description = "Trait representing an asynchronous, request / response based, client or server.\n";
    authors = [ "Carl Lerche <me@carllerche.com>" ];
    sha256 = "025bdkzn85hlg2mmxl08pv5baiznx9hk1yrcscfka9n32i6gzz25";
    dependencies = mapFeatures features ([
      (crates."futures"."${deps."tower_service"."0.1.0"."futures"}" deps)
    ]);
  };
  features_.tower_service."0.1.0" = deps: f: updateFeatures f (rec {
    futures."${deps.tower_service."0.1.0".futures}".default = true;
    tower_service."0.1.0".default = (f.tower_service."0.1.0".default or true);
  }) [
    (features_.futures."${deps."tower_service"."0.1.0"."futures"}" deps)
  ];


# end
# trust-dns-proto-0.5.0

  crates.trust_dns_proto."0.5.0" = deps: { features?(features_.trust_dns_proto."0.5.0" deps {}) }: buildRustCrate {
    crateName = "trust-dns-proto";
    version = "0.5.0";
    description = "TRust-DNS is a safe and secure DNS library. This is the foundational DNS protocol library for all TRust-DNS projects.\n";
    authors = [ "Benjamin Fry <benjaminfry@me.com>" ];
    sha256 = "0a4hhxsivy13q5zaqsjbxp1car4szvd8y9wfyvkbk7agmvbx3kh7";
    libPath = "src/lib.rs";
    libName = "trust_dns_proto";
    dependencies = mapFeatures features ([
      (crates."byteorder"."${deps."trust_dns_proto"."0.5.0"."byteorder"}" deps)
      (crates."failure"."${deps."trust_dns_proto"."0.5.0"."failure"}" deps)
      (crates."futures"."${deps."trust_dns_proto"."0.5.0"."futures"}" deps)
      (crates."idna"."${deps."trust_dns_proto"."0.5.0"."idna"}" deps)
      (crates."lazy_static"."${deps."trust_dns_proto"."0.5.0"."lazy_static"}" deps)
      (crates."log"."${deps."trust_dns_proto"."0.5.0"."log"}" deps)
      (crates."rand"."${deps."trust_dns_proto"."0.5.0"."rand"}" deps)
      (crates."smallvec"."${deps."trust_dns_proto"."0.5.0"."smallvec"}" deps)
      (crates."socket2"."${deps."trust_dns_proto"."0.5.0"."socket2"}" deps)
      (crates."tokio_executor"."${deps."trust_dns_proto"."0.5.0"."tokio_executor"}" deps)
      (crates."tokio_io"."${deps."trust_dns_proto"."0.5.0"."tokio_io"}" deps)
      (crates."tokio_reactor"."${deps."trust_dns_proto"."0.5.0"."tokio_reactor"}" deps)
      (crates."tokio_tcp"."${deps."trust_dns_proto"."0.5.0"."tokio_tcp"}" deps)
      (crates."tokio_timer"."${deps."trust_dns_proto"."0.5.0"."tokio_timer"}" deps)
      (crates."tokio_udp"."${deps."trust_dns_proto"."0.5.0"."tokio_udp"}" deps)
      (crates."url"."${deps."trust_dns_proto"."0.5.0"."url"}" deps)
    ]);
    features = mkFeatures (features."trust_dns_proto"."0.5.0" or {});
  };
  features_.trust_dns_proto."0.5.0" = deps: f: updateFeatures f (rec {
    byteorder."${deps.trust_dns_proto."0.5.0".byteorder}".default = true;
    failure."${deps.trust_dns_proto."0.5.0".failure}".default = true;
    futures."${deps.trust_dns_proto."0.5.0".futures}".default = true;
    idna."${deps.trust_dns_proto."0.5.0".idna}".default = true;
    lazy_static."${deps.trust_dns_proto."0.5.0".lazy_static}".default = true;
    log."${deps.trust_dns_proto."0.5.0".log}".default = true;
    rand."${deps.trust_dns_proto."0.5.0".rand}".default = true;
    smallvec."${deps.trust_dns_proto."0.5.0".smallvec}".default = true;
    socket2 = fold recursiveUpdate {} [
      { "${deps.trust_dns_proto."0.5.0".socket2}"."reuseport" = true; }
      { "${deps.trust_dns_proto."0.5.0".socket2}".default = true; }
    ];
    tokio_executor."${deps.trust_dns_proto."0.5.0".tokio_executor}".default = true;
    tokio_io."${deps.trust_dns_proto."0.5.0".tokio_io}".default = true;
    tokio_reactor."${deps.trust_dns_proto."0.5.0".tokio_reactor}".default = true;
    tokio_tcp."${deps.trust_dns_proto."0.5.0".tokio_tcp}".default = true;
    tokio_timer."${deps.trust_dns_proto."0.5.0".tokio_timer}".default = true;
    tokio_udp."${deps.trust_dns_proto."0.5.0".tokio_udp}".default = true;
    trust_dns_proto = fold recursiveUpdate {} [
      { "0.5.0"."data-encoding" =
        (f.trust_dns_proto."0.5.0"."data-encoding" or false) ||
        (f.trust_dns_proto."0.5.0".dnssec or false) ||
        (trust_dns_proto."0.5.0"."dnssec" or false); }
      { "0.5.0"."dnssec" =
        (f.trust_dns_proto."0.5.0"."dnssec" or false) ||
        (f.trust_dns_proto."0.5.0".dnssec-openssl or false) ||
        (trust_dns_proto."0.5.0"."dnssec-openssl" or false) ||
        (f.trust_dns_proto."0.5.0".dnssec-ring or false) ||
        (trust_dns_proto."0.5.0"."dnssec-ring" or false); }
      { "0.5.0"."openssl" =
        (f.trust_dns_proto."0.5.0"."openssl" or false) ||
        (f.trust_dns_proto."0.5.0".dnssec-openssl or false) ||
        (trust_dns_proto."0.5.0"."dnssec-openssl" or false); }
      { "0.5.0"."ring" =
        (f.trust_dns_proto."0.5.0"."ring" or false) ||
        (f.trust_dns_proto."0.5.0".dnssec-ring or false) ||
        (trust_dns_proto."0.5.0"."dnssec-ring" or false); }
      { "0.5.0"."serde" =
        (f.trust_dns_proto."0.5.0"."serde" or false) ||
        (f.trust_dns_proto."0.5.0".serde-config or false) ||
        (trust_dns_proto."0.5.0"."serde-config" or false); }
      { "0.5.0"."untrusted" =
        (f.trust_dns_proto."0.5.0"."untrusted" or false) ||
        (f.trust_dns_proto."0.5.0".dnssec-ring or false) ||
        (trust_dns_proto."0.5.0"."dnssec-ring" or false); }
      { "0.5.0".default = (f.trust_dns_proto."0.5.0".default or true); }
    ];
    url."${deps.trust_dns_proto."0.5.0".url}".default = true;
  }) [
    (features_.byteorder."${deps."trust_dns_proto"."0.5.0"."byteorder"}" deps)
    (features_.failure."${deps."trust_dns_proto"."0.5.0"."failure"}" deps)
    (features_.futures."${deps."trust_dns_proto"."0.5.0"."futures"}" deps)
    (features_.idna."${deps."trust_dns_proto"."0.5.0"."idna"}" deps)
    (features_.lazy_static."${deps."trust_dns_proto"."0.5.0"."lazy_static"}" deps)
    (features_.log."${deps."trust_dns_proto"."0.5.0"."log"}" deps)
    (features_.rand."${deps."trust_dns_proto"."0.5.0"."rand"}" deps)
    (features_.smallvec."${deps."trust_dns_proto"."0.5.0"."smallvec"}" deps)
    (features_.socket2."${deps."trust_dns_proto"."0.5.0"."socket2"}" deps)
    (features_.tokio_executor."${deps."trust_dns_proto"."0.5.0"."tokio_executor"}" deps)
    (features_.tokio_io."${deps."trust_dns_proto"."0.5.0"."tokio_io"}" deps)
    (features_.tokio_reactor."${deps."trust_dns_proto"."0.5.0"."tokio_reactor"}" deps)
    (features_.tokio_tcp."${deps."trust_dns_proto"."0.5.0"."tokio_tcp"}" deps)
    (features_.tokio_timer."${deps."trust_dns_proto"."0.5.0"."tokio_timer"}" deps)
    (features_.tokio_udp."${deps."trust_dns_proto"."0.5.0"."tokio_udp"}" deps)
    (features_.url."${deps."trust_dns_proto"."0.5.0"."url"}" deps)
  ];


# end
# trust-dns-proto-0.6.3

  crates.trust_dns_proto."0.6.3" = deps: { features?(features_.trust_dns_proto."0.6.3" deps {}) }: buildRustCrate {
    crateName = "trust-dns-proto";
    version = "0.6.3";
    description = "TRust-DNS is a safe and secure DNS library. This is the foundational DNS protocol library for all TRust-DNS projects.\n";
    authors = [ "Benjamin Fry <benjaminfry@me.com>" ];
    sha256 = "15lnb29iv97939c9jv74nccr0ddpyfg467y3n1bxdsy0g6488z21";
    libPath = "src/lib.rs";
    libName = "trust_dns_proto";
    dependencies = mapFeatures features ([
      (crates."byteorder"."${deps."trust_dns_proto"."0.6.3"."byteorder"}" deps)
      (crates."failure"."${deps."trust_dns_proto"."0.6.3"."failure"}" deps)
      (crates."futures"."${deps."trust_dns_proto"."0.6.3"."futures"}" deps)
      (crates."idna"."${deps."trust_dns_proto"."0.6.3"."idna"}" deps)
      (crates."lazy_static"."${deps."trust_dns_proto"."0.6.3"."lazy_static"}" deps)
      (crates."log"."${deps."trust_dns_proto"."0.6.3"."log"}" deps)
      (crates."rand"."${deps."trust_dns_proto"."0.6.3"."rand"}" deps)
      (crates."smallvec"."${deps."trust_dns_proto"."0.6.3"."smallvec"}" deps)
      (crates."socket2"."${deps."trust_dns_proto"."0.6.3"."socket2"}" deps)
      (crates."tokio_executor"."${deps."trust_dns_proto"."0.6.3"."tokio_executor"}" deps)
      (crates."tokio_io"."${deps."trust_dns_proto"."0.6.3"."tokio_io"}" deps)
      (crates."tokio_reactor"."${deps."trust_dns_proto"."0.6.3"."tokio_reactor"}" deps)
      (crates."tokio_tcp"."${deps."trust_dns_proto"."0.6.3"."tokio_tcp"}" deps)
      (crates."tokio_timer"."${deps."trust_dns_proto"."0.6.3"."tokio_timer"}" deps)
      (crates."tokio_udp"."${deps."trust_dns_proto"."0.6.3"."tokio_udp"}" deps)
      (crates."url"."${deps."trust_dns_proto"."0.6.3"."url"}" deps)
    ]);
    features = mkFeatures (features."trust_dns_proto"."0.6.3" or {});
  };
  features_.trust_dns_proto."0.6.3" = deps: f: updateFeatures f (rec {
    byteorder."${deps.trust_dns_proto."0.6.3".byteorder}".default = true;
    failure."${deps.trust_dns_proto."0.6.3".failure}".default = true;
    futures."${deps.trust_dns_proto."0.6.3".futures}".default = true;
    idna."${deps.trust_dns_proto."0.6.3".idna}".default = true;
    lazy_static."${deps.trust_dns_proto."0.6.3".lazy_static}".default = true;
    log."${deps.trust_dns_proto."0.6.3".log}".default = true;
    rand."${deps.trust_dns_proto."0.6.3".rand}".default = true;
    smallvec."${deps.trust_dns_proto."0.6.3".smallvec}".default = true;
    socket2 = fold recursiveUpdate {} [
      { "${deps.trust_dns_proto."0.6.3".socket2}"."reuseport" = true; }
      { "${deps.trust_dns_proto."0.6.3".socket2}".default = true; }
    ];
    tokio_executor."${deps.trust_dns_proto."0.6.3".tokio_executor}".default = true;
    tokio_io."${deps.trust_dns_proto."0.6.3".tokio_io}".default = true;
    tokio_reactor."${deps.trust_dns_proto."0.6.3".tokio_reactor}".default = true;
    tokio_tcp."${deps.trust_dns_proto."0.6.3".tokio_tcp}".default = true;
    tokio_timer."${deps.trust_dns_proto."0.6.3".tokio_timer}".default = true;
    tokio_udp."${deps.trust_dns_proto."0.6.3".tokio_udp}".default = true;
    trust_dns_proto = fold recursiveUpdate {} [
      { "0.6.3"."data-encoding" =
        (f.trust_dns_proto."0.6.3"."data-encoding" or false) ||
        (f.trust_dns_proto."0.6.3".dnssec or false) ||
        (trust_dns_proto."0.6.3"."dnssec" or false); }
      { "0.6.3"."dnssec" =
        (f.trust_dns_proto."0.6.3"."dnssec" or false) ||
        (f.trust_dns_proto."0.6.3".dnssec-openssl or false) ||
        (trust_dns_proto."0.6.3"."dnssec-openssl" or false) ||
        (f.trust_dns_proto."0.6.3".dnssec-ring or false) ||
        (trust_dns_proto."0.6.3"."dnssec-ring" or false); }
      { "0.6.3"."openssl" =
        (f.trust_dns_proto."0.6.3"."openssl" or false) ||
        (f.trust_dns_proto."0.6.3".dnssec-openssl or false) ||
        (trust_dns_proto."0.6.3"."dnssec-openssl" or false); }
      { "0.6.3"."ring" =
        (f.trust_dns_proto."0.6.3"."ring" or false) ||
        (f.trust_dns_proto."0.6.3".dnssec-ring or false) ||
        (trust_dns_proto."0.6.3"."dnssec-ring" or false); }
      { "0.6.3"."serde" =
        (f.trust_dns_proto."0.6.3"."serde" or false) ||
        (f.trust_dns_proto."0.6.3".serde-config or false) ||
        (trust_dns_proto."0.6.3"."serde-config" or false); }
      { "0.6.3"."untrusted" =
        (f.trust_dns_proto."0.6.3"."untrusted" or false) ||
        (f.trust_dns_proto."0.6.3".dnssec-ring or false) ||
        (trust_dns_proto."0.6.3"."dnssec-ring" or false); }
      { "0.6.3".default = (f.trust_dns_proto."0.6.3".default or true); }
    ];
    url."${deps.trust_dns_proto."0.6.3".url}".default = true;
  }) [
    (features_.byteorder."${deps."trust_dns_proto"."0.6.3"."byteorder"}" deps)
    (features_.failure."${deps."trust_dns_proto"."0.6.3"."failure"}" deps)
    (features_.futures."${deps."trust_dns_proto"."0.6.3"."futures"}" deps)
    (features_.idna."${deps."trust_dns_proto"."0.6.3"."idna"}" deps)
    (features_.lazy_static."${deps."trust_dns_proto"."0.6.3"."lazy_static"}" deps)
    (features_.log."${deps."trust_dns_proto"."0.6.3"."log"}" deps)
    (features_.rand."${deps."trust_dns_proto"."0.6.3"."rand"}" deps)
    (features_.smallvec."${deps."trust_dns_proto"."0.6.3"."smallvec"}" deps)
    (features_.socket2."${deps."trust_dns_proto"."0.6.3"."socket2"}" deps)
    (features_.tokio_executor."${deps."trust_dns_proto"."0.6.3"."tokio_executor"}" deps)
    (features_.tokio_io."${deps."trust_dns_proto"."0.6.3"."tokio_io"}" deps)
    (features_.tokio_reactor."${deps."trust_dns_proto"."0.6.3"."tokio_reactor"}" deps)
    (features_.tokio_tcp."${deps."trust_dns_proto"."0.6.3"."tokio_tcp"}" deps)
    (features_.tokio_timer."${deps."trust_dns_proto"."0.6.3"."tokio_timer"}" deps)
    (features_.tokio_udp."${deps."trust_dns_proto"."0.6.3"."tokio_udp"}" deps)
    (features_.url."${deps."trust_dns_proto"."0.6.3"."url"}" deps)
  ];


# end
# trust-dns-resolver-0.10.3

  crates.trust_dns_resolver."0.10.3" = deps: { features?(features_.trust_dns_resolver."0.10.3" deps {}) }: buildRustCrate {
    crateName = "trust-dns-resolver";
    version = "0.10.3";
    description = "TRust-DNS is a safe and secure DNS library. This Resolver library  uses the Client library to perform all DNS queries. The Resolver is intended to be a high-level library for any DNS record resolution see Resolver and ResolverFuture for supported resolution types. The Client can be used for other queries.\n";
    authors = [ "Benjamin Fry <benjaminfry@me.com>" ];
    sha256 = "175bmfrpfz660a8fpxi7fcxyj9fycqgyr97h9kvknblm8xjr1383";
    libPath = "src/lib.rs";
    libName = "trust_dns_resolver";
    dependencies = mapFeatures features ([
      (crates."cfg_if"."${deps."trust_dns_resolver"."0.10.3"."cfg_if"}" deps)
      (crates."failure"."${deps."trust_dns_resolver"."0.10.3"."failure"}" deps)
      (crates."futures"."${deps."trust_dns_resolver"."0.10.3"."futures"}" deps)
      (crates."lazy_static"."${deps."trust_dns_resolver"."0.10.3"."lazy_static"}" deps)
      (crates."log"."${deps."trust_dns_resolver"."0.10.3"."log"}" deps)
      (crates."lru_cache"."${deps."trust_dns_resolver"."0.10.3"."lru_cache"}" deps)
      (crates."resolv_conf"."${deps."trust_dns_resolver"."0.10.3"."resolv_conf"}" deps)
      (crates."smallvec"."${deps."trust_dns_resolver"."0.10.3"."smallvec"}" deps)
      (crates."tokio"."${deps."trust_dns_resolver"."0.10.3"."tokio"}" deps)
      (crates."trust_dns_proto"."${deps."trust_dns_resolver"."0.10.3"."trust_dns_proto"}" deps)
    ])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."ipconfig"."${deps."trust_dns_resolver"."0.10.3"."ipconfig"}" deps)
    ]) else []);
    features = mkFeatures (features."trust_dns_resolver"."0.10.3" or {});
  };
  features_.trust_dns_resolver."0.10.3" = deps: f: updateFeatures f (rec {
    cfg_if."${deps.trust_dns_resolver."0.10.3".cfg_if}".default = true;
    failure."${deps.trust_dns_resolver."0.10.3".failure}".default = true;
    futures."${deps.trust_dns_resolver."0.10.3".futures}".default = true;
    ipconfig."${deps.trust_dns_resolver."0.10.3".ipconfig}".default = true;
    lazy_static."${deps.trust_dns_resolver."0.10.3".lazy_static}".default = true;
    log."${deps.trust_dns_resolver."0.10.3".log}".default = true;
    lru_cache."${deps.trust_dns_resolver."0.10.3".lru_cache}".default = true;
    resolv_conf = fold recursiveUpdate {} [
      { "${deps.trust_dns_resolver."0.10.3".resolv_conf}"."system" = true; }
      { "${deps.trust_dns_resolver."0.10.3".resolv_conf}".default = true; }
    ];
    smallvec."${deps.trust_dns_resolver."0.10.3".smallvec}".default = true;
    tokio."${deps.trust_dns_resolver."0.10.3".tokio}".default = true;
    trust_dns_proto = fold recursiveUpdate {} [
      { "${deps.trust_dns_resolver."0.10.3".trust_dns_proto}"."dnssec-openssl" =
        (f.trust_dns_proto."${deps.trust_dns_resolver."0.10.3".trust_dns_proto}"."dnssec-openssl" or false) ||
        (trust_dns_resolver."0.10.3"."dnssec-openssl" or false) ||
        (f."trust_dns_resolver"."0.10.3"."dnssec-openssl" or false); }
      { "${deps.trust_dns_resolver."0.10.3".trust_dns_proto}"."dnssec-ring" =
        (f.trust_dns_proto."${deps.trust_dns_resolver."0.10.3".trust_dns_proto}"."dnssec-ring" or false) ||
        (trust_dns_resolver."0.10.3"."dnssec-ring" or false) ||
        (f."trust_dns_resolver"."0.10.3"."dnssec-ring" or false); }
      { "${deps.trust_dns_resolver."0.10.3".trust_dns_proto}"."mdns" =
        (f.trust_dns_proto."${deps.trust_dns_resolver."0.10.3".trust_dns_proto}"."mdns" or false) ||
        (trust_dns_resolver."0.10.3"."mdns" or false) ||
        (f."trust_dns_resolver"."0.10.3"."mdns" or false); }
      { "${deps.trust_dns_resolver."0.10.3".trust_dns_proto}"."serde-config" =
        (f.trust_dns_proto."${deps.trust_dns_resolver."0.10.3".trust_dns_proto}"."serde-config" or false) ||
        (trust_dns_resolver."0.10.3"."serde-config" or false) ||
        (f."trust_dns_resolver"."0.10.3"."serde-config" or false); }
      { "${deps.trust_dns_resolver."0.10.3".trust_dns_proto}".default = true; }
    ];
    trust_dns_resolver = fold recursiveUpdate {} [
      { "0.10.3"."dns-over-https" =
        (f.trust_dns_resolver."0.10.3"."dns-over-https" or false) ||
        (f.trust_dns_resolver."0.10.3".dns-over-https-rustls or false) ||
        (trust_dns_resolver."0.10.3"."dns-over-https-rustls" or false); }
      { "0.10.3"."dns-over-rustls" =
        (f.trust_dns_resolver."0.10.3"."dns-over-rustls" or false) ||
        (f.trust_dns_resolver."0.10.3".dns-over-https-rustls or false) ||
        (trust_dns_resolver."0.10.3"."dns-over-https-rustls" or false); }
      { "0.10.3"."dns-over-tls" =
        (f.trust_dns_resolver."0.10.3"."dns-over-tls" or false) ||
        (f.trust_dns_resolver."0.10.3".dns-over-native-tls or false) ||
        (trust_dns_resolver."0.10.3"."dns-over-native-tls" or false) ||
        (f.trust_dns_resolver."0.10.3".dns-over-openssl or false) ||
        (trust_dns_resolver."0.10.3"."dns-over-openssl" or false) ||
        (f.trust_dns_resolver."0.10.3".dns-over-rustls or false) ||
        (trust_dns_resolver."0.10.3"."dns-over-rustls" or false); }
      { "0.10.3"."dnssec" =
        (f.trust_dns_resolver."0.10.3"."dnssec" or false) ||
        (f.trust_dns_resolver."0.10.3".dnssec-openssl or false) ||
        (trust_dns_resolver."0.10.3"."dnssec-openssl" or false) ||
        (f.trust_dns_resolver."0.10.3".dnssec-ring or false) ||
        (trust_dns_resolver."0.10.3"."dnssec-ring" or false); }
      { "0.10.3"."rustls" =
        (f.trust_dns_resolver."0.10.3"."rustls" or false) ||
        (f.trust_dns_resolver."0.10.3".dns-over-rustls or false) ||
        (trust_dns_resolver."0.10.3"."dns-over-rustls" or false); }
      { "0.10.3"."serde" =
        (f.trust_dns_resolver."0.10.3"."serde" or false) ||
        (f.trust_dns_resolver."0.10.3".serde-config or false) ||
        (trust_dns_resolver."0.10.3"."serde-config" or false); }
      { "0.10.3"."serde_derive" =
        (f.trust_dns_resolver."0.10.3"."serde_derive" or false) ||
        (f.trust_dns_resolver."0.10.3".serde-config or false) ||
        (trust_dns_resolver."0.10.3"."serde-config" or false); }
      { "0.10.3"."trust-dns-https" =
        (f.trust_dns_resolver."0.10.3"."trust-dns-https" or false) ||
        (f.trust_dns_resolver."0.10.3".dns-over-https-rustls or false) ||
        (trust_dns_resolver."0.10.3"."dns-over-https-rustls" or false); }
      { "0.10.3"."trust-dns-native-tls" =
        (f.trust_dns_resolver."0.10.3"."trust-dns-native-tls" or false) ||
        (f.trust_dns_resolver."0.10.3".dns-over-native-tls or false) ||
        (trust_dns_resolver."0.10.3"."dns-over-native-tls" or false); }
      { "0.10.3"."trust-dns-openssl" =
        (f.trust_dns_resolver."0.10.3"."trust-dns-openssl" or false) ||
        (f.trust_dns_resolver."0.10.3".dns-over-openssl or false) ||
        (trust_dns_resolver."0.10.3"."dns-over-openssl" or false); }
      { "0.10.3"."trust-dns-rustls" =
        (f.trust_dns_resolver."0.10.3"."trust-dns-rustls" or false) ||
        (f.trust_dns_resolver."0.10.3".dns-over-rustls or false) ||
        (trust_dns_resolver."0.10.3"."dns-over-rustls" or false); }
      { "0.10.3"."webpki-roots" =
        (f.trust_dns_resolver."0.10.3"."webpki-roots" or false) ||
        (f.trust_dns_resolver."0.10.3".dns-over-rustls or false) ||
        (trust_dns_resolver."0.10.3"."dns-over-rustls" or false); }
      { "0.10.3".default = (f.trust_dns_resolver."0.10.3".default or true); }
    ];
  }) [
    (features_.cfg_if."${deps."trust_dns_resolver"."0.10.3"."cfg_if"}" deps)
    (features_.failure."${deps."trust_dns_resolver"."0.10.3"."failure"}" deps)
    (features_.futures."${deps."trust_dns_resolver"."0.10.3"."futures"}" deps)
    (features_.lazy_static."${deps."trust_dns_resolver"."0.10.3"."lazy_static"}" deps)
    (features_.log."${deps."trust_dns_resolver"."0.10.3"."log"}" deps)
    (features_.lru_cache."${deps."trust_dns_resolver"."0.10.3"."lru_cache"}" deps)
    (features_.resolv_conf."${deps."trust_dns_resolver"."0.10.3"."resolv_conf"}" deps)
    (features_.smallvec."${deps."trust_dns_resolver"."0.10.3"."smallvec"}" deps)
    (features_.tokio."${deps."trust_dns_resolver"."0.10.3"."tokio"}" deps)
    (features_.trust_dns_proto."${deps."trust_dns_resolver"."0.10.3"."trust_dns_proto"}" deps)
    (features_.ipconfig."${deps."trust_dns_resolver"."0.10.3"."ipconfig"}" deps)
  ];


# end
# try-lock-0.2.2

  crates.try_lock."0.2.2" = deps: { features?(features_.try_lock."0.2.2" deps {}) }: buildRustCrate {
    crateName = "try-lock";
    version = "0.2.2";
    description = "A lightweight atomic lock.";
    authors = [ "Sean McArthur <sean@seanmonstar.com>" ];
    sha256 = "1k8xc0jpbrmzp0fwghdh6pwzjb9xx2p8yy0xxnnb8065smc5fsrv";
  };
  features_.try_lock."0.2.2" = deps: f: updateFeatures f (rec {
    try_lock."0.2.2".default = (f.try_lock."0.2.2".default or true);
  }) [];


# end
# try_from-0.3.2

  crates.try_from."0.3.2" = deps: { features?(features_.try_from."0.3.2" deps {}) }: buildRustCrate {
    crateName = "try_from";
    version = "0.3.2";
    description = "TryFrom and TryInto traits for failable conversions that return a Result.";
    authors = [ "Derek Williams <derek@fyrie.net>" ];
    sha256 = "05jnndmiqz2sf8xsnf7ysaj3fpl3rhgzbfn1jx6casaahakrzald";
    dependencies = mapFeatures features ([
      (crates."cfg_if"."${deps."try_from"."0.3.2"."cfg_if"}" deps)
    ]);
    features = mkFeatures (features."try_from"."0.3.2" or {});
  };
  features_.try_from."0.3.2" = deps: f: updateFeatures f (rec {
    cfg_if."${deps.try_from."0.3.2".cfg_if}".default = true;
    try_from."0.3.2".default = (f.try_from."0.3.2".default or true);
  }) [
    (features_.cfg_if."${deps."try_from"."0.3.2"."cfg_if"}" deps)
  ];


# end
# ucd-util-0.1.3

  crates.ucd_util."0.1.3" = deps: { features?(features_.ucd_util."0.1.3" deps {}) }: buildRustCrate {
    crateName = "ucd-util";
    version = "0.1.3";
    description = "A small utility library for working with the Unicode character database.\n";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" ];
    sha256 = "1n1qi3jywq5syq90z9qd8qzbn58pcjgv1sx4sdmipm4jf9zanz15";
  };
  features_.ucd_util."0.1.3" = deps: f: updateFeatures f (rec {
    ucd_util."0.1.3".default = (f.ucd_util."0.1.3".default or true);
  }) [];


# end
# unicase-1.4.2

  crates.unicase."1.4.2" = deps: { features?(features_.unicase."1.4.2" deps {}) }: buildRustCrate {
    crateName = "unicase";
    version = "1.4.2";
    description = "A case-insensitive wrapper around strings.";
    authors = [ "Sean McArthur <sean.monstar@gmail.com>" ];
    sha256 = "0rbnhw2mnhcwrij3vczp0sl8zdfmvf2dlh8hly81kj7132kfj0mf";
    build = "build.rs";
    dependencies = mapFeatures features ([
]);

    buildDependencies = mapFeatures features ([
      (crates."version_check"."${deps."unicase"."1.4.2"."version_check"}" deps)
    ]);
    features = mkFeatures (features."unicase"."1.4.2" or {});
  };
  features_.unicase."1.4.2" = deps: f: updateFeatures f (rec {
    unicase = fold recursiveUpdate {} [
      { "1.4.2"."heapsize" =
        (f.unicase."1.4.2"."heapsize" or false) ||
        (f.unicase."1.4.2".heap_size or false) ||
        (unicase."1.4.2"."heap_size" or false); }
      { "1.4.2"."heapsize_plugin" =
        (f.unicase."1.4.2"."heapsize_plugin" or false) ||
        (f.unicase."1.4.2".heap_size or false) ||
        (unicase."1.4.2"."heap_size" or false); }
      { "1.4.2".default = (f.unicase."1.4.2".default or true); }
    ];
    version_check."${deps.unicase."1.4.2".version_check}".default = true;
  }) [
    (features_.version_check."${deps."unicase"."1.4.2"."version_check"}" deps)
  ];


# end
# unicase-2.4.0

  crates.unicase."2.4.0" = deps: { features?(features_.unicase."2.4.0" deps {}) }: buildRustCrate {
    crateName = "unicase";
    version = "2.4.0";
    description = "A case-insensitive wrapper around strings.";
    authors = [ "Sean McArthur <sean@seanmonstar.com>" ];
    sha256 = "0f4ay81kfrvs0l2frpci367j3dmnd3jx1x3q5fismmr6a4546piz";
    build = "build.rs";

    buildDependencies = mapFeatures features ([
      (crates."version_check"."${deps."unicase"."2.4.0"."version_check"}" deps)
    ]);
    features = mkFeatures (features."unicase"."2.4.0" or {});
  };
  features_.unicase."2.4.0" = deps: f: updateFeatures f (rec {
    unicase."2.4.0".default = (f.unicase."2.4.0".default or true);
    version_check."${deps.unicase."2.4.0".version_check}".default = true;
  }) [
    (features_.version_check."${deps."unicase"."2.4.0"."version_check"}" deps)
  ];


# end
# unicode-bidi-0.3.4

  crates.unicode_bidi."0.3.4" = deps: { features?(features_.unicode_bidi."0.3.4" deps {}) }: buildRustCrate {
    crateName = "unicode-bidi";
    version = "0.3.4";
    description = "Implementation of the Unicode Bidirectional Algorithm";
    authors = [ "The Servo Project Developers" ];
    sha256 = "0lcd6jasrf8p9p0q20qyf10c6xhvw40m2c4rr105hbk6zy26nj1q";
    libName = "unicode_bidi";
    dependencies = mapFeatures features ([
      (crates."matches"."${deps."unicode_bidi"."0.3.4"."matches"}" deps)
    ]);
    features = mkFeatures (features."unicode_bidi"."0.3.4" or {});
  };
  features_.unicode_bidi."0.3.4" = deps: f: updateFeatures f (rec {
    matches."${deps.unicode_bidi."0.3.4".matches}".default = true;
    unicode_bidi = fold recursiveUpdate {} [
      { "0.3.4"."flame" =
        (f.unicode_bidi."0.3.4"."flame" or false) ||
        (f.unicode_bidi."0.3.4".flame_it or false) ||
        (unicode_bidi."0.3.4"."flame_it" or false); }
      { "0.3.4"."flamer" =
        (f.unicode_bidi."0.3.4"."flamer" or false) ||
        (f.unicode_bidi."0.3.4".flame_it or false) ||
        (unicode_bidi."0.3.4"."flame_it" or false); }
      { "0.3.4"."serde" =
        (f.unicode_bidi."0.3.4"."serde" or false) ||
        (f.unicode_bidi."0.3.4".with_serde or false) ||
        (unicode_bidi."0.3.4"."with_serde" or false); }
      { "0.3.4".default = (f.unicode_bidi."0.3.4".default or true); }
    ];
  }) [
    (features_.matches."${deps."unicode_bidi"."0.3.4"."matches"}" deps)
  ];


# end
# unicode-normalization-0.1.8

  crates.unicode_normalization."0.1.8" = deps: { features?(features_.unicode_normalization."0.1.8" deps {}) }: buildRustCrate {
    crateName = "unicode-normalization";
    version = "0.1.8";
    description = "This crate provides functions for normalization of\nUnicode strings, including Canonical and Compatible\nDecomposition and Recomposition, as described in\nUnicode Standard Annex #15.\n";
    authors = [ "kwantam <kwantam@gmail.com>" ];
    sha256 = "1pb26i2xd5zz0icabyqahikpca0iwj2jd4145pczc4bb7p641dsz";
    dependencies = mapFeatures features ([
      (crates."smallvec"."${deps."unicode_normalization"."0.1.8"."smallvec"}" deps)
    ]);
  };
  features_.unicode_normalization."0.1.8" = deps: f: updateFeatures f (rec {
    smallvec."${deps.unicode_normalization."0.1.8".smallvec}".default = true;
    unicode_normalization."0.1.8".default = (f.unicode_normalization."0.1.8".default or true);
  }) [
    (features_.smallvec."${deps."unicode_normalization"."0.1.8"."smallvec"}" deps)
  ];


# end
# unicode-width-0.1.5

  crates.unicode_width."0.1.5" = deps: { features?(features_.unicode_width."0.1.5" deps {}) }: buildRustCrate {
    crateName = "unicode-width";
    version = "0.1.5";
    description = "Determine displayed width of `char` and `str` types\naccording to Unicode Standard Annex #11 rules.\n";
    authors = [ "kwantam <kwantam@gmail.com>" ];
    sha256 = "0886lc2aymwgy0lhavwn6s48ik3c61ykzzd3za6prgnw51j7bi4w";
    features = mkFeatures (features."unicode_width"."0.1.5" or {});
  };
  features_.unicode_width."0.1.5" = deps: f: updateFeatures f (rec {
    unicode_width."0.1.5".default = (f.unicode_width."0.1.5".default or true);
  }) [];


# end
# unicode-xid-0.1.0

  crates.unicode_xid."0.1.0" = deps: { features?(features_.unicode_xid."0.1.0" deps {}) }: buildRustCrate {
    crateName = "unicode-xid";
    version = "0.1.0";
    description = "Determine whether characters have the XID_Start\nor XID_Continue properties according to\nUnicode Standard Annex #31.\n";
    authors = [ "erick.tryzelaar <erick.tryzelaar@gmail.com>" "kwantam <kwantam@gmail.com>" ];
    sha256 = "05wdmwlfzxhq3nhsxn6wx4q8dhxzzfb9szsz6wiw092m1rjj01zj";
    features = mkFeatures (features."unicode_xid"."0.1.0" or {});
  };
  features_.unicode_xid."0.1.0" = deps: f: updateFeatures f (rec {
    unicode_xid."0.1.0".default = (f.unicode_xid."0.1.0".default or true);
  }) [];


# end
# untrusted-0.6.2

  crates.untrusted."0.6.2" = deps: { features?(features_.untrusted."0.6.2" deps {}) }: buildRustCrate {
    crateName = "untrusted";
    version = "0.6.2";
    description = "Safe, fast, zero-panic, zero-crashing, zero-allocation parsing of untrusted inputs in Rust.";
    authors = [ "Brian Smith <brian@briansmith.org>" ];
    sha256 = "189ir1h2xgb290bhjchwczr9ygia1f3ipsydf6pwnnb95lb8fihg";
    libPath = "src/untrusted.rs";
  };
  features_.untrusted."0.6.2" = deps: f: updateFeatures f (rec {
    untrusted."0.6.2".default = (f.untrusted."0.6.2".default or true);
  }) [];


# end
# url-1.7.2

  crates.url."1.7.2" = deps: { features?(features_.url."1.7.2" deps {}) }: buildRustCrate {
    crateName = "url";
    version = "1.7.2";
    description = "URL library for Rust, based on the WHATWG URL Standard";
    authors = [ "The rust-url developers" ];
    sha256 = "0qzrjzd9r1niv7037x4cgnv98fs1vj0k18lpxx890ipc47x5gc09";
    dependencies = mapFeatures features ([
      (crates."idna"."${deps."url"."1.7.2"."idna"}" deps)
      (crates."matches"."${deps."url"."1.7.2"."matches"}" deps)
      (crates."percent_encoding"."${deps."url"."1.7.2"."percent_encoding"}" deps)
    ]
      ++ (if features.url."1.7.2".encoding or false then [ (crates.encoding."${deps."url"."1.7.2".encoding}" deps) ] else []));
    features = mkFeatures (features."url"."1.7.2" or {});
  };
  features_.url."1.7.2" = deps: f: updateFeatures f (rec {
    encoding."${deps.url."1.7.2".encoding}".default = true;
    idna."${deps.url."1.7.2".idna}".default = true;
    matches."${deps.url."1.7.2".matches}".default = true;
    percent_encoding."${deps.url."1.7.2".percent_encoding}".default = true;
    url = fold recursiveUpdate {} [
      { "1.7.2"."encoding" =
        (f.url."1.7.2"."encoding" or false) ||
        (f.url."1.7.2".query_encoding or false) ||
        (url."1.7.2"."query_encoding" or false); }
      { "1.7.2"."heapsize" =
        (f.url."1.7.2"."heapsize" or false) ||
        (f.url."1.7.2".heap_size or false) ||
        (url."1.7.2"."heap_size" or false); }
      { "1.7.2".default = (f.url."1.7.2".default or true); }
    ];
  }) [
    (features_.encoding."${deps."url"."1.7.2"."encoding"}" deps)
    (features_.idna."${deps."url"."1.7.2"."idna"}" deps)
    (features_.matches."${deps."url"."1.7.2"."matches"}" deps)
    (features_.percent_encoding."${deps."url"."1.7.2"."percent_encoding"}" deps)
  ];


# end
# utf8-ranges-1.0.2

  crates.utf8_ranges."1.0.2" = deps: { features?(features_.utf8_ranges."1.0.2" deps {}) }: buildRustCrate {
    crateName = "utf8-ranges";
    version = "1.0.2";
    description = "Convert ranges of Unicode codepoints to UTF-8 byte ranges.";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" ];
    sha256 = "1my02laqsgnd8ib4dvjgd4rilprqjad6pb9jj9vi67csi5qs2281";
  };
  features_.utf8_ranges."1.0.2" = deps: f: updateFeatures f (rec {
    utf8_ranges."1.0.2".default = (f.utf8_ranges."1.0.2".default or true);
  }) [];


# end
# uuid-0.7.4

  crates.uuid."0.7.4" = deps: { features?(features_.uuid."0.7.4" deps {}) }: buildRustCrate {
    crateName = "uuid";
    version = "0.7.4";
    description = "A library to generate and parse UUIDs.";
    authors = [ "Ashley Mannix<ashleymannix@live.com.au>" "Christopher Armstrong" "Dylan DPC<dylan.dpc@gmail.com>" "Hunar Roop Kahlon<hunar.roop@gmail.com>" ];
    sha256 = "1kzjah6i8vf51hrla6qnplymaqx2fadhhlnbvgivgld311lqyz9m";
    dependencies = mapFeatures features ([
    ]
      ++ (if features.uuid."0.7.4".rand or false then [ (crates.rand."${deps."uuid"."0.7.4".rand}" deps) ] else []))
      ++ (if kernel == "windows" then mapFeatures features ([
]) else []);
    features = mkFeatures (features."uuid"."0.7.4" or {});
  };
  features_.uuid."0.7.4" = deps: f: updateFeatures f (rec {
    rand = fold recursiveUpdate {} [
      { "${deps.uuid."0.7.4".rand}"."stdweb" =
        (f.rand."${deps.uuid."0.7.4".rand}"."stdweb" or false) ||
        (uuid."0.7.4"."stdweb" or false) ||
        (f."uuid"."0.7.4"."stdweb" or false); }
      { "${deps.uuid."0.7.4".rand}"."wasm-bindgen" =
        (f.rand."${deps.uuid."0.7.4".rand}"."wasm-bindgen" or false) ||
        (uuid."0.7.4"."wasm-bindgen" or false) ||
        (f."uuid"."0.7.4"."wasm-bindgen" or false); }
      { "${deps.uuid."0.7.4".rand}".default = true; }
    ];
    uuid = fold recursiveUpdate {} [
      { "0.7.4"."byteorder" =
        (f.uuid."0.7.4"."byteorder" or false) ||
        (f.uuid."0.7.4".u128 or false) ||
        (uuid."0.7.4"."u128" or false); }
      { "0.7.4"."md5" =
        (f.uuid."0.7.4"."md5" or false) ||
        (f.uuid."0.7.4".v3 or false) ||
        (uuid."0.7.4"."v3" or false); }
      { "0.7.4"."nightly" =
        (f.uuid."0.7.4"."nightly" or false) ||
        (f.uuid."0.7.4".const_fn or false) ||
        (uuid."0.7.4"."const_fn" or false); }
      { "0.7.4"."rand" =
        (f.uuid."0.7.4"."rand" or false) ||
        (f.uuid."0.7.4".v4 or false) ||
        (uuid."0.7.4"."v4" or false); }
      { "0.7.4"."sha1" =
        (f.uuid."0.7.4"."sha1" or false) ||
        (f.uuid."0.7.4".v5 or false) ||
        (uuid."0.7.4"."v5" or false); }
      { "0.7.4"."std" =
        (f.uuid."0.7.4"."std" or false) ||
        (f.uuid."0.7.4".default or false) ||
        (uuid."0.7.4"."default" or false); }
      { "0.7.4"."winapi" =
        (f.uuid."0.7.4"."winapi" or false) ||
        (f.uuid."0.7.4".guid or false) ||
        (uuid."0.7.4"."guid" or false); }
      { "0.7.4".default = (f.uuid."0.7.4".default or true); }
    ];
  }) [
    (features_.rand."${deps."uuid"."0.7.4"."rand"}" deps)
  ];


# end
# v_escape-0.7.2

  crates.v_escape."0.7.2" = deps: { features?(features_.v_escape."0.7.2" deps {}) }: buildRustCrate {
    crateName = "v_escape";
    version = "0.7.2";
    description = "The simd optimized escaping code";
    authors = [ "Rust-iendo Barcelona <riendocontributions@gmail.com>" ];
    edition = "2018";
    sha256 = "05rhxmk2mzf1pcna4idilmhdqp95vdy2k3ixx7iqgncjidxkaiaw";
    libPath = "src/lib.rs";
    dependencies = mapFeatures features ([
      (crates."v_escape_derive"."${deps."v_escape"."0.7.2"."v_escape_derive"}" deps)
      (crates."version_check"."${deps."v_escape"."0.7.2"."version_check"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."version_check"."${deps."v_escape"."0.7.2"."version_check"}" deps)
    ]);
  };
  features_.v_escape."0.7.2" = deps: f: updateFeatures f (rec {
    v_escape."0.7.2".default = (f.v_escape."0.7.2".default or true);
    v_escape_derive."${deps.v_escape."0.7.2".v_escape_derive}".default = true;
    version_check."${deps.v_escape."0.7.2".version_check}".default = true;
  }) [
    (features_.v_escape_derive."${deps."v_escape"."0.7.2"."v_escape_derive"}" deps)
    (features_.version_check."${deps."v_escape"."0.7.2"."version_check"}" deps)
    (features_.version_check."${deps."v_escape"."0.7.2"."version_check"}" deps)
  ];


# end
# v_escape_derive-0.5.3

  crates.v_escape_derive."0.5.3" = deps: { features?(features_.v_escape_derive."0.5.3" deps {}) }: buildRustCrate {
    crateName = "v_escape_derive";
    version = "0.5.3";
    description = "Procedural macro package for v_escape";
    authors = [ "Rust-iendo Barcelona <riendocontributions@gmail.com>" ];
    edition = "2018";
    sha256 = "0wgyvapii8bnz2g52i3al5vycbiplr62bfmvlv2pplrj9ff40pv3";
    libPath = "src/lib.rs";
    procMacro = true;
    dependencies = mapFeatures features ([
      (crates."nom"."${deps."v_escape_derive"."0.5.3"."nom"}" deps)
      (crates."proc_macro2"."${deps."v_escape_derive"."0.5.3"."proc_macro2"}" deps)
      (crates."quote"."${deps."v_escape_derive"."0.5.3"."quote"}" deps)
      (crates."syn"."${deps."v_escape_derive"."0.5.3"."syn"}" deps)
    ]);
  };
  features_.v_escape_derive."0.5.3" = deps: f: updateFeatures f (rec {
    nom."${deps.v_escape_derive."0.5.3".nom}".default = true;
    proc_macro2."${deps.v_escape_derive."0.5.3".proc_macro2}".default = true;
    quote."${deps.v_escape_derive."0.5.3".quote}".default = true;
    syn."${deps.v_escape_derive."0.5.3".syn}".default = true;
    v_escape_derive."0.5.3".default = (f.v_escape_derive."0.5.3".default or true);
  }) [
    (features_.nom."${deps."v_escape_derive"."0.5.3"."nom"}" deps)
    (features_.proc_macro2."${deps."v_escape_derive"."0.5.3"."proc_macro2"}" deps)
    (features_.quote."${deps."v_escape_derive"."0.5.3"."quote"}" deps)
    (features_.syn."${deps."v_escape_derive"."0.5.3"."syn"}" deps)
  ];


# end
# v_htmlescape-0.4.3

  crates.v_htmlescape."0.4.3" = deps: { features?(features_.v_htmlescape."0.4.3" deps {}) }: buildRustCrate {
    crateName = "v_htmlescape";
    version = "0.4.3";
    description = "The simd optimized HTML escaping code";
    authors = [ "Rust-iendo Barcelona <riendocontributions@gmail.com>" ];
    edition = "2018";
    sha256 = "09vma0ydjnah6j7d2s7yahx6bqri54pmxj84sv9wmggnidg3d0qx";
    libPath = "src/lib.rs";
    dependencies = mapFeatures features ([
      (crates."cfg_if"."${deps."v_htmlescape"."0.4.3"."cfg_if"}" deps)
      (crates."v_escape"."${deps."v_htmlescape"."0.4.3"."v_escape"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."v_escape"."${deps."v_htmlescape"."0.4.3"."v_escape"}" deps)
    ]);
  };
  features_.v_htmlescape."0.4.3" = deps: f: updateFeatures f (rec {
    cfg_if."${deps.v_htmlescape."0.4.3".cfg_if}".default = true;
    v_escape."${deps.v_htmlescape."0.4.3".v_escape}".default = true;
    v_htmlescape."0.4.3".default = (f.v_htmlescape."0.4.3".default or true);
  }) [
    (features_.cfg_if."${deps."v_htmlescape"."0.4.3"."cfg_if"}" deps)
    (features_.v_escape."${deps."v_htmlescape"."0.4.3"."v_escape"}" deps)
    (features_.v_escape."${deps."v_htmlescape"."0.4.3"."v_escape"}" deps)
  ];


# end
# vcpkg-0.2.6

  crates.vcpkg."0.2.6" = deps: { features?(features_.vcpkg."0.2.6" deps {}) }: buildRustCrate {
    crateName = "vcpkg";
    version = "0.2.6";
    description = "A library to find native dependencies in a vcpkg tree at build\ntime in order to be used in Cargo build scripts.\n";
    authors = [ "Jim McGrath <jimmc2@gmail.com>" ];
    sha256 = "1ig6jqpzzl1z9vk4qywgpfr4hfbd8ny8frqsgm3r449wkc4n1i5x";
  };
  features_.vcpkg."0.2.6" = deps: f: updateFeatures f (rec {
    vcpkg."0.2.6".default = (f.vcpkg."0.2.6".default or true);
  }) [];


# end
# vec_map-0.8.1

  crates.vec_map."0.8.1" = deps: { features?(features_.vec_map."0.8.1" deps {}) }: buildRustCrate {
    crateName = "vec_map";
    version = "0.8.1";
    description = "A simple map based on a vector for small integer keys";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" "Jorge Aparicio <japaricious@gmail.com>" "Alexis Beingessner <a.beingessner@gmail.com>" "Brian Anderson <>" "tbu- <>" "Manish Goregaokar <>" "Aaron Turon <aturon@mozilla.com>" "Adolfo Ochagavía <>" "Niko Matsakis <>" "Steven Fackler <>" "Chase Southwood <csouth3@illinois.edu>" "Eduard Burtescu <>" "Florian Wilkens <>" "Félix Raimundo <>" "Tibor Benke <>" "Markus Siemens <markus@m-siemens.de>" "Josh Branchaud <jbranchaud@gmail.com>" "Huon Wilson <dbau.pp@gmail.com>" "Corey Farwell <coref@rwell.org>" "Aaron Liblong <>" "Nick Cameron <nrc@ncameron.org>" "Patrick Walton <pcwalton@mimiga.net>" "Felix S Klock II <>" "Andrew Paseltiner <apaseltiner@gmail.com>" "Sean McArthur <sean.monstar@gmail.com>" "Vadim Petrochenkov <>" ];
    sha256 = "1jj2nrg8h3l53d43rwkpkikq5a5x15ms4rf1rw92hp5lrqhi8mpi";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."vec_map"."0.8.1" or {});
  };
  features_.vec_map."0.8.1" = deps: f: updateFeatures f (rec {
    vec_map = fold recursiveUpdate {} [
      { "0.8.1"."serde" =
        (f.vec_map."0.8.1"."serde" or false) ||
        (f.vec_map."0.8.1".eders or false) ||
        (vec_map."0.8.1"."eders" or false); }
      { "0.8.1".default = (f.vec_map."0.8.1".default or true); }
    ];
  }) [];


# end
# version_check-0.1.5

  crates.version_check."0.1.5" = deps: { features?(features_.version_check."0.1.5" deps {}) }: buildRustCrate {
    crateName = "version_check";
    version = "0.1.5";
    description = "Tiny crate to check the version of the installed/running rustc.";
    authors = [ "Sergio Benitez <sb@sergio.bz>" ];
    sha256 = "1yrx9xblmwbafw2firxyqbj8f771kkzfd24n3q7xgwiqyhi0y8qd";
  };
  features_.version_check."0.1.5" = deps: f: updateFeatures f (rec {
    version_check."0.1.5".default = (f.version_check."0.1.5".default or true);
  }) [];


# end
# want-0.0.6

  crates.want."0.0.6" = deps: { features?(features_.want."0.0.6" deps {}) }: buildRustCrate {
    crateName = "want";
    version = "0.0.6";
    description = "Detect when another Future wants a result.";
    authors = [ "Sean McArthur <sean@seanmonstar.com>" ];
    sha256 = "03cc2lndz531a4kgql1v9kppyb1yz2abcz5l52j1gg2nypmy3lh8";
    dependencies = mapFeatures features ([
      (crates."futures"."${deps."want"."0.0.6"."futures"}" deps)
      (crates."log"."${deps."want"."0.0.6"."log"}" deps)
      (crates."try_lock"."${deps."want"."0.0.6"."try_lock"}" deps)
    ]);
  };
  features_.want."0.0.6" = deps: f: updateFeatures f (rec {
    futures."${deps.want."0.0.6".futures}".default = true;
    log."${deps.want."0.0.6".log}".default = true;
    try_lock."${deps.want."0.0.6".try_lock}".default = true;
    want."0.0.6".default = (f.want."0.0.6".default or true);
  }) [
    (features_.futures."${deps."want"."0.0.6"."futures"}" deps)
    (features_.log."${deps."want"."0.0.6"."log"}" deps)
    (features_.try_lock."${deps."want"."0.0.6"."try_lock"}" deps)
  ];


# end
# which-1.0.5

  crates.which."1.0.5" = deps: { features?(features_.which."1.0.5" deps {}) }: buildRustCrate {
    crateName = "which";
    version = "1.0.5";
    description = "A Rust equivalent of Unix command \"which\". Locate installed execuable in cross platforms.";
    authors = [ "fangyuanziti <tiziyuanfang@gmail.com>" ];
    sha256 = "1xv34mrbbafmir51c5k7dkgnpk299aga64dx71p6ijzhl14612qj";
    dependencies = mapFeatures features ([
      (crates."libc"."${deps."which"."1.0.5"."libc"}" deps)
    ]);
  };
  features_.which."1.0.5" = deps: f: updateFeatures f (rec {
    libc."${deps.which."1.0.5".libc}".default = true;
    which."1.0.5".default = (f.which."1.0.5".default or true);
  }) [
    (features_.libc."${deps."which"."1.0.5"."libc"}" deps)
  ];


# end
# widestring-0.2.2

  crates.widestring."0.2.2" = deps: { features?(features_.widestring."0.2.2" deps {}) }: buildRustCrate {
    crateName = "widestring";
    version = "0.2.2";
    description = "A wide string FFI library for converting to and from Windows Wide \"Unicode\" (UTF-16) strings.";
    authors = [ "Kathryn Long <squeeself@gmail.com>" ];
    sha256 = "07n6cmk47h8v4bvg7cwawipcn6ijqcfwhf9w6x3r2nw3ghsm2h0a";
  };
  features_.widestring."0.2.2" = deps: f: updateFeatures f (rec {
    widestring."0.2.2".default = (f.widestring."0.2.2".default or true);
  }) [];


# end
# winapi-0.2.8

  crates.winapi."0.2.8" = deps: { features?(features_.winapi."0.2.8" deps {}) }: buildRustCrate {
    crateName = "winapi";
    version = "0.2.8";
    description = "Types and constants for WinAPI bindings. See README for list of crates providing function bindings.";
    authors = [ "Peter Atashian <retep998@gmail.com>" ];
    sha256 = "0a45b58ywf12vb7gvj6h3j264nydynmzyqz8d8rqxsj6icqv82as";
  };
  features_.winapi."0.2.8" = deps: f: updateFeatures f (rec {
    winapi."0.2.8".default = (f.winapi."0.2.8".default or true);
  }) [];


# end
# winapi-0.3.7

  crates.winapi."0.3.7" = deps: { features?(features_.winapi."0.3.7" deps {}) }: buildRustCrate {
    crateName = "winapi";
    version = "0.3.7";
    description = "Raw FFI bindings for all of Windows API.";
    authors = [ "Peter Atashian <retep998@gmail.com>" ];
    sha256 = "1k51gfkp0zqw7nj07y443mscs46icmdhld442s2073niap0kkdr8";
    build = "build.rs";
    dependencies = (if kernel == "i686-pc-windows-gnu" then mapFeatures features ([
      (crates."winapi_i686_pc_windows_gnu"."${deps."winapi"."0.3.7"."winapi_i686_pc_windows_gnu"}" deps)
    ]) else [])
      ++ (if kernel == "x86_64-pc-windows-gnu" then mapFeatures features ([
      (crates."winapi_x86_64_pc_windows_gnu"."${deps."winapi"."0.3.7"."winapi_x86_64_pc_windows_gnu"}" deps)
    ]) else []);
    features = mkFeatures (features."winapi"."0.3.7" or {});
  };
  features_.winapi."0.3.7" = deps: f: updateFeatures f (rec {
    winapi = fold recursiveUpdate {} [
      { "0.3.7"."impl-debug" =
        (f.winapi."0.3.7"."impl-debug" or false) ||
        (f.winapi."0.3.7".debug or false) ||
        (winapi."0.3.7"."debug" or false); }
      { "0.3.7".default = (f.winapi."0.3.7".default or true); }
    ];
    winapi_i686_pc_windows_gnu."${deps.winapi."0.3.7".winapi_i686_pc_windows_gnu}".default = true;
    winapi_x86_64_pc_windows_gnu."${deps.winapi."0.3.7".winapi_x86_64_pc_windows_gnu}".default = true;
  }) [
    (features_.winapi_i686_pc_windows_gnu."${deps."winapi"."0.3.7"."winapi_i686_pc_windows_gnu"}" deps)
    (features_.winapi_x86_64_pc_windows_gnu."${deps."winapi"."0.3.7"."winapi_x86_64_pc_windows_gnu"}" deps)
  ];


# end
# winapi-build-0.1.1

  crates.winapi_build."0.1.1" = deps: { features?(features_.winapi_build."0.1.1" deps {}) }: buildRustCrate {
    crateName = "winapi-build";
    version = "0.1.1";
    description = "Common code for build.rs in WinAPI -sys crates.";
    authors = [ "Peter Atashian <retep998@gmail.com>" ];
    sha256 = "1lxlpi87rkhxcwp2ykf1ldw3p108hwm24nywf3jfrvmff4rjhqga";
    libName = "build";
  };
  features_.winapi_build."0.1.1" = deps: f: updateFeatures f (rec {
    winapi_build."0.1.1".default = (f.winapi_build."0.1.1".default or true);
  }) [];


# end
# winapi-i686-pc-windows-gnu-0.4.0

  crates.winapi_i686_pc_windows_gnu."0.4.0" = deps: { features?(features_.winapi_i686_pc_windows_gnu."0.4.0" deps {}) }: buildRustCrate {
    crateName = "winapi-i686-pc-windows-gnu";
    version = "0.4.0";
    description = "Import libraries for the i686-pc-windows-gnu target. Please don't use this crate directly, depend on winapi instead.";
    authors = [ "Peter Atashian <retep998@gmail.com>" ];
    sha256 = "05ihkij18r4gamjpxj4gra24514can762imjzlmak5wlzidplzrp";
    build = "build.rs";
  };
  features_.winapi_i686_pc_windows_gnu."0.4.0" = deps: f: updateFeatures f (rec {
    winapi_i686_pc_windows_gnu."0.4.0".default = (f.winapi_i686_pc_windows_gnu."0.4.0".default or true);
  }) [];


# end
# winapi-util-0.1.2

  crates.winapi_util."0.1.2" = deps: { features?(features_.winapi_util."0.1.2" deps {}) }: buildRustCrate {
    crateName = "winapi-util";
    version = "0.1.2";
    description = "A dumping ground for high level safe wrappers over winapi.";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" ];
    sha256 = "07jj7rg7nndd7bqhjin1xphbv8kb5clvhzpqpxkvm3wl84r3mj1h";
    dependencies = (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."winapi_util"."0.1.2"."winapi"}" deps)
    ]) else []);
  };
  features_.winapi_util."0.1.2" = deps: f: updateFeatures f (rec {
    winapi = fold recursiveUpdate {} [
      { "${deps.winapi_util."0.1.2".winapi}"."consoleapi" = true; }
      { "${deps.winapi_util."0.1.2".winapi}"."errhandlingapi" = true; }
      { "${deps.winapi_util."0.1.2".winapi}"."fileapi" = true; }
      { "${deps.winapi_util."0.1.2".winapi}"."minwindef" = true; }
      { "${deps.winapi_util."0.1.2".winapi}"."processenv" = true; }
      { "${deps.winapi_util."0.1.2".winapi}"."std" = true; }
      { "${deps.winapi_util."0.1.2".winapi}"."winbase" = true; }
      { "${deps.winapi_util."0.1.2".winapi}"."wincon" = true; }
      { "${deps.winapi_util."0.1.2".winapi}"."winerror" = true; }
      { "${deps.winapi_util."0.1.2".winapi}"."winnt" = true; }
      { "${deps.winapi_util."0.1.2".winapi}".default = true; }
    ];
    winapi_util."0.1.2".default = (f.winapi_util."0.1.2".default or true);
  }) [
    (features_.winapi."${deps."winapi_util"."0.1.2"."winapi"}" deps)
  ];


# end
# winapi-x86_64-pc-windows-gnu-0.4.0

  crates.winapi_x86_64_pc_windows_gnu."0.4.0" = deps: { features?(features_.winapi_x86_64_pc_windows_gnu."0.4.0" deps {}) }: buildRustCrate {
    crateName = "winapi-x86_64-pc-windows-gnu";
    version = "0.4.0";
    description = "Import libraries for the x86_64-pc-windows-gnu target. Please don't use this crate directly, depend on winapi instead.";
    authors = [ "Peter Atashian <retep998@gmail.com>" ];
    sha256 = "0n1ylmlsb8yg1v583i4xy0qmqg42275flvbc51hdqjjfjcl9vlbj";
    build = "build.rs";
  };
  features_.winapi_x86_64_pc_windows_gnu."0.4.0" = deps: f: updateFeatures f (rec {
    winapi_x86_64_pc_windows_gnu."0.4.0".default = (f.winapi_x86_64_pc_windows_gnu."0.4.0".default or true);
  }) [];


# end
# wincolor-1.0.1

  crates.wincolor."1.0.1" = deps: { features?(features_.wincolor."1.0.1" deps {}) }: buildRustCrate {
    crateName = "wincolor";
    version = "1.0.1";
    description = "A simple Windows specific API for controlling text color in a Windows console.\n";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" ];
    sha256 = "0gr7v4krmjba7yq16071rfacz42qbapas7mxk5nphjwb042a8gvz";
    dependencies = mapFeatures features ([
      (crates."winapi"."${deps."wincolor"."1.0.1"."winapi"}" deps)
      (crates."winapi_util"."${deps."wincolor"."1.0.1"."winapi_util"}" deps)
    ]);
  };
  features_.wincolor."1.0.1" = deps: f: updateFeatures f (rec {
    winapi = fold recursiveUpdate {} [
      { "${deps.wincolor."1.0.1".winapi}"."minwindef" = true; }
      { "${deps.wincolor."1.0.1".winapi}"."wincon" = true; }
      { "${deps.wincolor."1.0.1".winapi}".default = true; }
    ];
    winapi_util."${deps.wincolor."1.0.1".winapi_util}".default = true;
    wincolor."1.0.1".default = (f.wincolor."1.0.1".default or true);
  }) [
    (features_.winapi."${deps."wincolor"."1.0.1"."winapi"}" deps)
    (features_.winapi_util."${deps."wincolor"."1.0.1"."winapi_util"}" deps)
  ];


# end
# winreg-0.5.1

  crates.winreg."0.5.1" = deps: { features?(features_.winreg."0.5.1" deps {}) }: buildRustCrate {
    crateName = "winreg";
    version = "0.5.1";
    description = "Rust bindings to MS Windows Registry API";
    authors = [ "Igor Shaula <gentoo90@gmail.com>" ];
    sha256 = "1l7xs3lnjrnam6d3ms8c9b3xkiv6x6zj5siigr9zcbgw9w3kq5nh";
    dependencies = mapFeatures features ([
      (crates."winapi"."${deps."winreg"."0.5.1"."winapi"}" deps)
    ]);
    features = mkFeatures (features."winreg"."0.5.1" or {});
  };
  features_.winreg."0.5.1" = deps: f: updateFeatures f (rec {
    winapi = fold recursiveUpdate {} [
      { "${deps.winreg."0.5.1".winapi}"."handleapi" = true; }
      { "${deps.winreg."0.5.1".winapi}"."ktmw32" =
        (f.winapi."${deps.winreg."0.5.1".winapi}"."ktmw32" or false) ||
        (winreg."0.5.1"."transactions" or false) ||
        (f."winreg"."0.5.1"."transactions" or false); }
      { "${deps.winreg."0.5.1".winapi}"."minwindef" = true; }
      { "${deps.winreg."0.5.1".winapi}"."winerror" = true; }
      { "${deps.winreg."0.5.1".winapi}"."winnt" = true; }
      { "${deps.winreg."0.5.1".winapi}"."winreg" = true; }
      { "${deps.winreg."0.5.1".winapi}".default = true; }
    ];
    winreg = fold recursiveUpdate {} [
      { "0.5.1"."serde" =
        (f.winreg."0.5.1"."serde" or false) ||
        (f.winreg."0.5.1".serialization-serde or false) ||
        (winreg."0.5.1"."serialization-serde" or false); }
      { "0.5.1"."transactions" =
        (f.winreg."0.5.1"."transactions" or false) ||
        (f.winreg."0.5.1".serialization-serde or false) ||
        (winreg."0.5.1"."serialization-serde" or false); }
      { "0.5.1".default = (f.winreg."0.5.1".default or true); }
    ];
  }) [
    (features_.winapi."${deps."winreg"."0.5.1"."winapi"}" deps)
  ];


# end
# winutil-0.1.1

  crates.winutil."0.1.1" = deps: { features?(features_.winutil."0.1.1" deps {}) }: buildRustCrate {
    crateName = "winutil";
    version = "0.1.1";
    description = "Simple library providing wrappers around a handful of useful winapi calls.";
    authors = [ "Dave Lancaster <lancaster.dave@gmail.com>" ];
    sha256 = "1wvq440hl1v3a65agjbp031gw5jim3qasfvmz703dlz95pbjv45r";
    dependencies = (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."winutil"."0.1.1"."winapi"}" deps)
    ]) else []);
  };
  features_.winutil."0.1.1" = deps: f: updateFeatures f (rec {
    winapi = fold recursiveUpdate {} [
      { "${deps.winutil."0.1.1".winapi}"."processthreadsapi" = true; }
      { "${deps.winutil."0.1.1".winapi}"."winbase" = true; }
      { "${deps.winutil."0.1.1".winapi}"."wow64apiset" = true; }
      { "${deps.winutil."0.1.1".winapi}".default = true; }
    ];
    winutil."0.1.1".default = (f.winutil."0.1.1".default or true);
  }) [
    (features_.winapi."${deps."winutil"."0.1.1"."winapi"}" deps)
  ];


# end
# ws2_32-sys-0.2.1

  crates.ws2_32_sys."0.2.1" = deps: { features?(features_.ws2_32_sys."0.2.1" deps {}) }: buildRustCrate {
    crateName = "ws2_32-sys";
    version = "0.2.1";
    description = "Contains function definitions for the Windows API library ws2_32. See winapi for types and constants.";
    authors = [ "Peter Atashian <retep998@gmail.com>" ];
    sha256 = "1zpy9d9wk11sj17fczfngcj28w4xxjs3b4n036yzpy38dxp4f7kc";
    libName = "ws2_32";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."winapi"."${deps."ws2_32_sys"."0.2.1"."winapi"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."winapi_build"."${deps."ws2_32_sys"."0.2.1"."winapi_build"}" deps)
    ]);
  };
  features_.ws2_32_sys."0.2.1" = deps: f: updateFeatures f (rec {
    winapi."${deps.ws2_32_sys."0.2.1".winapi}".default = true;
    winapi_build."${deps.ws2_32_sys."0.2.1".winapi_build}".default = true;
    ws2_32_sys."0.2.1".default = (f.ws2_32_sys."0.2.1".default or true);
  }) [
    (features_.winapi."${deps."ws2_32_sys"."0.2.1"."winapi"}" deps)
    (features_.winapi_build."${deps."ws2_32_sys"."0.2.1"."winapi_build"}" deps)
  ];


# end
}
