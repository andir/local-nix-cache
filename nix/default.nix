{ ... }@args:
let
  sources = import ./sources.nix;

  pkgs = import sources.nixpkgs ({
    overlays = [
      (_: _: { inherit (import sources.niv {}) niv; })
      (_: super: { crate2nix = super.callPackage sources.crate2nix {}; })
      (self: super: {
         libnixstore-c = super.callPackage (super.fetchFromGitHub {
           owner = "andir";
           repo = "libnixstore-c";
           rev = "fa0bb095033cff87e30b9ed6a1e659fa248b867e";
           sha256 = "042afj357j2bq9y0nlcx1ps8g32yg00j4y9fn6fcvd70zrcsv4dk";
         }) {};
         nix = self.libnixstore-c.nix;
       })
      (_: super: {
        defaultCrateOverrides = super.defaultCrateOverrides // (super.callPackage ./crate-overrides.nix {});
      })

    ];
  }//args);
in pkgs
