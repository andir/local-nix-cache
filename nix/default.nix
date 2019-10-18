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
           rev = "b0b1bc6da463c5c65dc1335e44dd60b98a65134d";
           sha256 = "1nllgp0a66av6ji4irfw4ir414lrlx3v725jxyqxwx8krkcch1j5";
         }) {};
         nix = self.libnixstore-c.nix;
       })
      (_: super: {
        defaultCrateOverrides = super.defaultCrateOverrides // (super.callPackage ./crate-overrides.nix {});
      })

    ];
  }//args);
in pkgs
