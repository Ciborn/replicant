{ config, pkgs, home-manager, ... }:

{
  imports = [
    ../shared
    ./system/hardware.nix
  ];

  boot.loader.grub.gfxmodeEfi = "1920x1200";
  boot.loader.efi.efiSysMountPoint = "/boot";

  hardware.opengl.extraPackages = with pkgs; [ intel-media-driver ];

  networking.hostName = "yeoreum"; # Define your hostname.

  swapDevices = [{ device = "/var/lib/swapfile"; size = 8192; }];

  system.stateVersion = "23.05";
}
