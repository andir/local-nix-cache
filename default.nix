{ pkgsSrc ? (import ./pkgs.nix)}:
let
  pkgs = import pkgsSrc {};
in {
  shell = pkgs.mkShell {
    buildInputs = with pkgs; [
      sqlite
      openssl
      pkgconfig
    ];
  };
}
