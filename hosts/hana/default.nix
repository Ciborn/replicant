{ config, pkgs, ... }:

{
  imports = [
    ./system/boot.nix
    ./system/hardware.nix
    ./users/robinb
  ];

  networking.hostName = "hana"; # Define your hostname.

  services.xserver = {
    enable = true;
    desktopManager.gnome.enable = true;
    displayManager = {
      defaultSession = "none+awesome";
      gdm.enable = true;
    };
    xkbVariant = "";
    videoDrivers = [ "nvidia" ];
    windowManager.awesome.enable = true;
  };

  services.autorandr = import ./services/autorandr.nix;

  hardware.nvidia.modesetting.enable = true;

  system.stateVersion = "22.11";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  virtualisation.docker.enable = true;
  virtualisation.docker.storageDriver = "btrfs";
}
