{ ... }:

{
  # Bootloader.
  boot.kernelModules = [ "i2c-dev" ];

  boot.kernel.sysctl = {
    "vm.swappiness" = 0;
  };

  boot.plymouth.enable = true;

  boot.loader.efi.canTouchEfiVariables = false;

  boot.loader.grub = {
    device = "nodev";
    efiInstallAsRemovable = true;
    efiSupport = true;
    enable = true;
  };
}
