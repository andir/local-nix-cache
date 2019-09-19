{ pkgsSrc ? ./nix}:
let
  pkgs = import pkgsSrc {};

in {
  pkg = (pkgs.callPackage ./nix/Cargo.nix {}).rootCrate.build;
  inherit pkgs;
  shell = pkgs.mkShell {
    nativeBuildInputs = with pkgs; [ crate2nix niv ];
    buildInputs = with pkgs; [
      sqlite
      openssl
      pkgconfig
      libnixstore-c
      avahi
      dbus
      nix-prefetch-git
    ];
    shellHook = ''
    export LIBCLANG_PATH=${pkgs.llvmPackages.clang-unwrapped.lib}/lib
    '';
  };
}
