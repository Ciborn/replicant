{ config, pkgs, home-manager, ... }:

{
  imports = [
    ./system/hardware.nix
    ./system/packages.nix
    ./users/robinb
  ];

  boot.loader.grub.gfxmodeEfi = "1920x1200";

  hardware.opengl.extraPackages = with pkgs; [
    intel-media-driver
    vaapiVdpau
    libvdpau-va-gl
  ];

  networking.hostName = "yeoreum"; # Define your hostname.

  programs.hyprland.enable = true;

  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;

  system.stateVersion = "23.05";
}
