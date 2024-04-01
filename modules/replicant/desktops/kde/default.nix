{ config, lib, pkgs, username, ... }:

with lib; let
  cfg = config.replicant.desktops.kde;
in {
  options.replicant.desktops.kde = {
    enable = mkEnableOption "Enable KDE";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      libsForQt5.kcalc
      libsForQt5.filelight
    ];

    services.xserver.enable = true;
    services.xserver.displayManager.sddm.enable = true;
    services.xserver.desktopManager.plasma5.enable = true;
  };
}
