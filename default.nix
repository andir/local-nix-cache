{ pkgsSrc ? (import ./pkgs.nix)}:
let
  pkgs = import pkgsSrc {};
  libnixstore-c = pkgs.callPackage (pkgs.fetchFromGitHub {
    owner = "andir";
    repo = "libnixstore-c";
    rev = "2ce29c26a4bca55bb5b83fa97f045659675bcfa7";
    sha256 = "1jk798ck2ppkkw9i1p07rqk0xsi9bv89a62idwmzgxw6lniipby0";
  }) {};

  cratesIO = pkgs.callPackage ./crates-io.nix {};
  crates = pkgs.callPackage ./Cargo.nix { inherit cratesIO; };
  crateOverrides = (pkgs.defaultCrateOverrides // {
    actix-http = attrs: {
      edition = "2018";
    };

    bzip2-sys = attrs: {
      buildInputs = [ pkgs.bzip2 ];
      propagatedBuildInputs = [ pkgs.bzip2 ];
      extraLinkFlags = [ "-L${pkgs.bzip2.out}/lib" ];
    };

    libnixstore-sys = attrs: {
      propagatedBuildInputs = [ libnixstore-c ];
      buildInputs = [ libnixstore-c ];
      nativeBuildInputs = [ pkgs.pkgconfig ];
      LIBCLANG_PATH= "${pkgs.llvmPackages.clang-unwrapped.lib}/lib";
      EXTRA_INCLUDE = "${pkgs.stdenv.cc.libc_dev}/include";
    };

    local-nix-cache = attrs: {
      buildInputs = [ libnixstore-c ];
#      extraLinkFlags = [ "-L${pkgs.bzip2}/lib" "-lbz2"];
    };
  });

in {
  inherit crates;
#  crates = pkgs.lib.mapAttrs (n: v: v.override { inherit crateOverrides; }) crates;
  pkg = (crates.local_nix_cache {}).override {
    inherit crateOverrides;
  };
  shell = pkgs.mkShell {
    nativeBuildInputs = with pkgs; [ carnix ];
    buildInputs = with pkgs; [
      sqlite
      openssl
      pkgconfig
      libnixstore-c
    ];
    shellHook = ''
    export LIBCLANG_PATH=${pkgs.llvmPackages.clang-unwrapped.lib}/lib
    '';

  };
}
