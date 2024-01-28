{ config, lib, pkgs, home-manager, nixpkgs, ... }:

{
  imports = [
    (import "${home-manager}/nixos")
    (import "${nixpkgs}/nixos/modules/virtualisation/oci-image.nix")
  ];

  chiral = {
    servers.openssh.enable = true;
  };

  replicant = {
    shells.useCommonTools = true;
    shells.zsh.enable = true;
  };

  hardware.pulseaudio.enable = false;
  
  networking.hostName = "donghoon";
  networking.nameservers = [ "8.8.8.8" "8.8.4.4" ];

  nixpkgs.hostPlatform.system = "aarch64-linux";
  nixpkgs.buildPlatform.system = "x86_64-linux";

  system.stateVersion = "23.11";

  users.users.robinb = {
    isNormalUser = true;
    description = "Robin Bourachot";
    extraGroups = [ "docker" "wheel" ];
  };

  virtualisation.vmVariant = {
    users.users.robinb.password = "password";
    virtualisation = {
      memorySize = 8192;
      cores = 4;
      graphics = false;
    };
  };
}
