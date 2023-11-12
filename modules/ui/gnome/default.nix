{ config, lib, pkgs, username, ... }:

with lib; let
  cfg = config.cibnix.ui.gnome;
in {
  options.cibnix.ui.gnome = {
    enable = mkEnableOption "Enable GNOME";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
        dconf2nix
        gnome.gnome-tweaks
        gnomeExtensions.dash-to-panel
        gnomeExtensions.gsconnect
        gradience
    ];

    home-manager.users.${username} = import ./dconf.nix;

    programs.kdeconnect.enable = true;
    programs.kdeconnect.package = pkgs.gnomeExtensions.gsconnect;

    services.xserver.desktopManager.gnome.enable = true;
  };
}
