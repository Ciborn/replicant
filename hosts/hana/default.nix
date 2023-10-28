{ config, pkgs, ... }:

{
  imports = [
    ./system/boot.nix
    ./system/hardware.nix
    ./system/packages.nix
    ./users/robinb
  ];

  networking.hostName = "hana"; # Define your hostname.

  programs.hyprland.enableNvidiaPatches = true;

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia.modesetting.enable = true;

  system.stateVersion = "22.11";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  virtualisation.docker.enable = true;
  virtualisation.docker.storageDriver = "btrfs";
}
