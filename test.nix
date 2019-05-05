let
  pkgs = import <nixpkgs> {};
  drvs = (import (fetchGit ./.) { pkgsSrc = pkgs.path; });
  module = import (drvs.path + "/module.nix");
in
(import (pkgs.path + "/nixos/tests/make-test.nix") ({ pkgs, lib, ...}: {
  machine = { pkgs, ... }: {
    imports = [ module ];
    local-nix-cache.server.enable = true;
  };

  testScript = ''
    startAll;
    $machine->waitForUnit('multi-user.target');
    $machine->waitForUnit('local-nix-cache');
    $machine->succeed('curl localhost:8083 -q');
  '';
}))
