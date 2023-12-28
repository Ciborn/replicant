{ config, pkgs, ... }:

{
  imports = [
    ../shared
    ./system/boot.nix
    ./system/hardware.nix
  ];

  environment.systemPackages = with pkgs; [ os-prober ];

  cibnix.audio.easyeffects.enable = true;

  networking.hostName = "hana"; # Define your hostname.

  programs.hyprland.enableNvidiaPatches = true;

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia.modesetting.enable = true;

  system.stateVersion = "22.11";
}
