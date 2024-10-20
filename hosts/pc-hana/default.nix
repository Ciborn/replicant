{ config, inputs, pkgs, unstable-pkgs, ... }:

{
  imports = [
    inputs.aagl.nixosModules.default
    inputs.nixos-hardware.nixosModules.common-gpu-nvidia-nonprime
    ../../layouts/pc
    ./system/boot.nix
    ./system/hardware.nix
  ];

  boot.binfmt.emulatedSystems = [ "aarch64-linux" ];

  environment.systemPackages = with pkgs; [
    heroic
    os-prober
    unstable-pkgs.osu-lazer-bin
    prismlauncher
    qmk
  ];

  networking.hostName = "hana";

  # NVIDIA GPU-related configuration
  nixpkgs.config.cudaSupport = true;
  hardware.nvidia.modesetting.enable = true;
  virtualisation.docker.enableNvidia = true;

  hardware.opentabletdriver.enable = true;

  programs.adb.enable = true;
  users.users.robinb.extraGroups = ["adbusers"];

  programs.anime-game-launcher.enable = true;

  services.displayManager = {
    autoLogin.enable = true;
    autoLogin.user = "robinb";
  };

  replicant.desktops.de = "kde";

  system.stateVersion = "22.11";
}
