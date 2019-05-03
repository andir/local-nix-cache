{ pkgsSrc ? (import ./pkgs.nix)}:
let
  pkgs = import pkgsSrc {};
  libnixstore-c = pkgs.callPackage (pkgs.fetchFromGitHub {
    owner = "andir";
    repo = "libnixstore-c";
    rev = "48c99afdd1fcf8a840820cd961be3b6f1944cb6e";
    sha256 = "134w6pyn060piaa6akxshgc0d1p2b9si1q72y1r7k46cazp52sqi";
  }) {};

in {
  shell = pkgs.mkShell {
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
