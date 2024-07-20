{ pkgs, ... }:

{
  # fileSystems."/mnt/ehdd" = {
  #   device = "/dev/disk/by-uuid/3ebcc48f-709a-4c67-a461-2886b08fbd80";
  #   fsType = "btrfs";
  # };

  hardware.i2c.enable = true;

  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      vaapiVdpau
      libvdpau-va-gl
    ];
  };
}
