{ ... }:

{
  # Bootloader.
  # boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot";

  boot.loader.grub = {
    device = "nodev";
    efiInstallAsRemovable = false;
    efiSupport = true;
    enable = true;
  };
}
