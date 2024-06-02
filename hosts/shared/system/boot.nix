{ ... }:

{
  # Bootloader.
  boot.kernelModules = [ "i2c-dev" ];

  boot.kernel.sysctl = {
    "vm.swappiness" = 0;
  };

  boot.loader.efi.canTouchEfiVariables = true;

  boot.loader.grub = {
    device = "nodev";
    efiInstallAsRemovable = false;
    efiSupport = true;
    enable = true;
  };
}
