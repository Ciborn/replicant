{ config, inputs, pkgs, ... }:

{
  imports = [
    inputs.aagl.nixosModules.default
    inputs.nixos-hardware.nixosModules.common-gpu-nvidia-nonprime
    ../shared
    ./system/boot.nix
    ./system/hardware.nix
  ];

  boot.binfmt.emulatedSystems = [ "aarch64-linux" ];

  environment.systemPackages = with pkgs; [
    os-prober
    osu-lazer-bin
    prismlauncher
    steamPackages.steamcmd
  ];

  networking.hostName = "hana";

  # NVIDIA GPU-related configuration
  nixpkgs.config.cudaSupport = true;
  hardware.nvidia.modesetting.enable = true;
  virtualisation.docker.enableNvidia = true;

  programs.anime-game-launcher.enable = true;

  services.displayManager = {
    autoLogin.enable = true;
    autoLogin.user = "robinb";
  };

  system.stateVersion = "22.11";
}
