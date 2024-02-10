{ config, pkgs, home-manager, ... }:

{
  imports = [
    ../shared
    ./system/hardware.nix
  ];

  boot.loader.grub.gfxmodeEfi = "1920x1200";
  boot.loader.efi.efiSysMountPoint = "/boot";

  networking.hostName = "yeoreum";

  swapDevices = [{ device = "/var/lib/swapfile"; size = 8192; }];

  system.stateVersion = "23.05";
}
