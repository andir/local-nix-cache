{ lib, config, pkgs, ... }:
let
  cfg = config.local-nix-cache;
  drvs = import ./default.nix { pkgsSrc = pkgs.path; };
in
with lib; {

  options.local-nix-cache = {
    server = {
      enable = mkEnableOption "enable the local nix serve service";
      address = mkOption {
        default = "localhost";
        type = types.str;
        description = ''
          The addresses to listen on.
        '';
      };
      port = mkOption {
        default = 8083;
        type = types.port;
        description = ''
          The HTTP port to listen on.
        '';
      };
    };
    client = {
      # pretty much useless for now but well someone might want it...
      enable = mkEnableOption "Use the specified 'local' cache in addition to the other substituters that you configured.";
      substituter = mkOption {
        default = "";
        types = types.str;
        description = ''
          the url of the local substituter to use
        '';
      };
    };
  };

  config = mkIf (cfg.server.enable || cfg.client.enable) {
    nix.binaryCaches = mkIf cfg.client.enable (mkBefore [ cfg.client.substituter ]);
    nix.package = mkIf cfg.server.enable (mkForce drvs.nix);
    systemd.services."local-nix-cache" = mkIf cfg.server.enable {
      wantedBy = [ "multi-user.target" ];
      path = [
        drvs.pkg
      ];
      script = ''
        local-nix-cache --port ${toString cfg.server.port}
      '';
    };
  };
}
