{ config, home-manager, inputs, pkgs, ... }:

{
  imports = [
    inputs.nixos-hardware.nixosModules.common-cpu-intel
    inputs.nixos-hardware.nixosModules.common-pc-laptop
    ../../layouts/pc
    ./system/hardware.nix
  ];

  boot.loader.grub.gfxmodeEfi = "1920x1200";
  boot.loader.efi.efiSysMountPoint = "/boot";

  networking.hostName = "yeoreum";

  replicant.desktops.kde.enable = false;
  replicant.desktops.gnome.enable = true;

  swapDevices = [{ device = "/var/lib/swapfile"; size = 8192; }];

  system.stateVersion = "23.05";
}
