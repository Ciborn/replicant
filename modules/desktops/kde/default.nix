{ config, lib, pkgs, username, ... }:

with lib; let
  cfg = config.cibnix.desktops.kde;
in {
  options.cibnix.desktops.kde = {
    enable = mkEnableOption "Enable KDE";
  };

  config = mkIf cfg.enable {
    services.xserver.enable = true;
    services.xserver.displayManager.sddm.enable = true;
    services.xserver.desktopManager.plasma5.enable = true;
  };
}