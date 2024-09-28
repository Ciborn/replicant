{ config, pkgs, lib, username, ... }:

with lib; let
  cfg = config.replicant.desktops;
in {
  options.replicant.desktops = {
    de = mkOption {
      default = null;
      description = "Choose your DE";
      type = types.enum ["gnome" "kde"];
    };
  };

  config.replicant.desktops = {
    gnome.enable = mkIf (cfg.de == "gnome") true;
    kde.enable = mkIf (cfg.de == "kde") true;
  };
}
