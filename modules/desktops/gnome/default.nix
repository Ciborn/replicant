{ config, lib, pkgs, username, ... }:

with lib; let
  cfg = config.cibnix.desktops.gnome;
in {
  options.cibnix.desktops.gnome = {
    enable = mkEnableOption "Enable GNOME";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
        dconf2nix
        gnome.gnome-color-manager
        gnome.gnome-tweaks
        gnomeExtensions.dash-to-panel
        gnomeExtensions.gsconnect
        gradience
    ];

    programs.kdeconnect.enable = true;
    programs.kdeconnect.package = pkgs.gnomeExtensions.gsconnect;

    services.xserver.desktopManager.gnome.enable = true;
    services.xserver.enable = true;
    services.xserver.displayManager.gdm.enable = true;
  };
}
