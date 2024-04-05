{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    # (import "${inputs.nixpkgs}/nixos/modules/virtualisation/oci-image.nix")
    inputs.arion.nixosModules.arion
    inputs.home-manager.nixosModules.home-manager
    ./compose
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
  networking.useDHCP = false;

  nixpkgs.hostPlatform.system = "x86_64-linux";
  # nixpkgs.hostPlatform.system = "aarch64-linux";
  # nixpkgs.buildPlatform.system = "x86_64-linux";

  system.stateVersion = "23.11";

  users.users.robinb = {
    isNormalUser = true;
    description = "Robin Bourachot";
    extraGroups = [ "podman" "wheel" ];
  };

  users.groups.podman.gid = 1101;

  environment.systemPackages = with pkgs; [
    docker-client
  ];

  virtualisation.vmVariant = {
    # create bridge to host's tap0 interface
    networking.bridges.br0.interfaces = [ "eth1" ];
    networking.interfaces.br0.ipv6.addresses = [{ address = "fca0::10"; prefixLength = 16; }];

    users.users.robinb.password = "password";

    virtualisation = {
      cores = 4;
      graphics = false;
      memorySize = 8192;

      qemu.networkingOptions = [
        "-device virtio-net,netdev=tap"
        "-netdev tap,id=tap,ifname=tap0,script=no,downscript=no"
      ];
    };
  };
}
