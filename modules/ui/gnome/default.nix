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
        gradience
    ];

    home-manager.users.${username} = import ./dconf.nix;

    services.xserver.desktopManager.gnome.enable = true;
  };
}
