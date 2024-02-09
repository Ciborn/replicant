{ config, lib, pkgs, home-manager, nixpkgs, ... }:

{
  imports = [
    # (import "${nixpkgs}/nixos/modules/virtualisation/oci-image.nix")
    home-manager.nixosModules.home-manager
    ./containers
  ];

  chiral = {
    servers.openssh.enable = true;
  };

  replicant = {
    shells.useCommonTools = true;
    shells.zsh.enable = true;
  };

  hardware.pulseaudio.enable = false;

  networking = {
    hostName = "donghoon";

    nat = {
      enable = true;
      enableIPv6 = true;
      externalInterface = "eth0";
      internalInterfaces = [ "ve-+" ];
    };
  };

  nixpkgs.hostPlatform.system = "x86_64-linux";
  # nixpkgs.hostPlatform.system = "aarch64-linux";
  # nixpkgs.buildPlatform.system = "x86_64-linux";

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
