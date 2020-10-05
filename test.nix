{ pkgsSrc ? ./nix }:

let
  pkgs = import pkgsSrc {};
  drvs = (import (fetchGit ./.) { pkgsSrc = pkgs.path; });
  module = import (drvs.path + "/module.nix");
in
(import (pkgs.path + "/nixos/tests/make-test-python.nix") ({ pkgs, lib, ...}: {
  machine = { pkgs, ... }: {
    imports = [ module ];
    local-nix-cache.server.enable = true;
  };

  testScript = ''
    start_all()
    machine.wait_for_unit("multi-user.target")
    machine.wait_for_unit("local-nix-cache")
    machine.succeed("curl localhost:8083 -q")
  '';
}))
