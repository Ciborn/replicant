{ config, pkgs, username, ... }:

{
  imports = [
    ../shared
    ./system/boot.nix
    ./system/hardware.nix
  ];

  environment.systemPackages = with pkgs; [
    os-prober
    steamPackages.steamcmd
  ];

  cibnix.audio.easyeffects.enable = true;
  cibnix.servers.sunshine.enable = true;

  networking.hostName = "hana"; # Define your hostname.

  # NVIDIA GPU-related configuration
  programs.hyprland.enableNvidiaPatches = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.modesetting.enable = true;

  services.xserver.displayManager = {
    autoLogin.enable = true;
    autoLogin.user = username;
  };

  system.stateVersion = "22.11";
}
