{ config, lib, pkgs, username, ... }:

with lib; let
  cfg = config.replicant.desktops.gnome;
in {
  options.replicant.desktops.gnome = {
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

    # programs.firefox.nativeMessagingHosts.packages = with pkgs; [
    #   gnome-browser-connector
    # ];

    programs.kdeconnect.enable = true;
    programs.kdeconnect.package = pkgs.gnomeExtensions.gsconnect;

    services.displayManager.defaultSession = "gnome";
    services.xserver.desktopManager.gnome.enable = true;
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.enable = true;
  };
}
