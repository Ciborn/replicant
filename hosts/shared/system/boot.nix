{ ... }:

{
  # Bootloader.
  boot.kernelModules = [ "i2c-dev" ];

  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot";

  boot.loader.grub = {
    device = "nodev";
    efiInstallAsRemovable = false;
    efiSupport = true;
    enable = true;
  };
}
