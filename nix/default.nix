{ ... }@args:
let
  sources = import ./sources.nix;

  pkgs = import sources.nixpkgs-channels ({
    overlays = [
      (_: _: { inherit (import sources.niv {}) niv; })
    ];
  }//args);
in pkgs
