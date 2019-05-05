{ pkgsSrc ? (import ./pkgs.nix)}:
let
  pkgs = import pkgsSrc {};
  libnixstore-c = pkgs.callPackage (pkgs.fetchFromGitHub {
    owner = "andir";
    repo = "libnixstore-c";
    rev = "fa0bb095033cff87e30b9ed6a1e659fa248b867e";
    sha256 = "042afj357j2bq9y0nlcx1ps8g32yg00j4y9fn6fcvd70zrcsv4dk";
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
  # Since I require a patch to the nix-daemon provide a compatible nix package
  inherit (libnixstore-c) nix;
  path = ./.;

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
