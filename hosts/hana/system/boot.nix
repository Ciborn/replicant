{ ... }:

{
  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usbhid" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "iwlwifi" "kvm-intel" ];
  boot.extraModulePackages = [ ];

  boot.loader.grub.gfxmodeEfi = "2560x1440";
  boot.loader.grub.useOSProber = true;
}
