{ ... }:

{
  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usbhid" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "iwlwifi" "kvm-intel" ];
  boot.extraModulePackages = [ ];

  # Bootloader.
  # boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  boot.loader.grub = {
    device = "nodev";
    efiSupport = true;
    enable = true;
    gfxmodeEfi = "2560x1440";
    useOSProber = true;
  };
}
