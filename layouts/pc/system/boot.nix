{ pkgs, ... }:

{
  # Bootloader.
  boot.kernelModules = [ "i2c-dev" ];

  boot.kernel.sysctl = {
    "kernel.core_pattern" = "|/bin/false";
    "vm.swappiness" = 0;
  };

  boot.initrd.systemd.enable = true;

  boot.loader.efi.canTouchEfiVariables = false;

  boot.loader.grub = {
    device = "nodev";
    efiInstallAsRemovable = true;
    efiSupport = true;
    enable = true;
    timeoutStyle = "hidden";
  };
  boot.loader.timeout = 1;
}
