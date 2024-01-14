{ config, lib, pkgs, home-manager, nixpkgs, ... }:

{
  imports = [
    (import "${home-manager}/nixos")
    (import "${nixpkgs}/nixos/modules/installer/sd-card/sd-image-aarch64-installer.nix")
  ];

  cibnix.shells.zsh.enable = true;

  environment.systemPackages = with pkgs; [
    btop
    fastfetch
    htop
    lm_sensors
    nano
    pciutils
    tree
    vim
    wakeonlan
    wget
  ];

  hardware.enableRedistributableFirmware = true;
  hardware.pulseaudio.enable = false;

  networking.firewall.allowedTCPPorts = [ 22 ];
  
  networking.hostName = "donghoon";
  networking.nameservers = [ "8.8.8.8" "8.8.4.4" ];
  networking.wireless.enable = true;
  networking.wireless.interfaces = [ "wlan0" ];
  networking.wireless.networks = { };

  nixpkgs.hostPlatform.system = "aarch64-linux";
  # nixpkgs.hostPlatform.system = "x86_64-linux";
  nixpkgs.buildPlatform.system = "x86_64-linux";

  # remove rpm support from fastfetch since we use nix (duh!), which fails to build anyways
  nixpkgs.overlays = [
    (final: prev: { fastfetch = prev.fastfetch.override { rpm = null; }; })
  ];

  sdImage.compressImage = false;

  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = false;
    settings.KbdInteractiveAuthentication = false;
  };

  system.stateVersion = "23.11";

  users.users.robinb = {
    isNormalUser = true;
    description = "Robin Bourachot";
    extraGroups = [ "docker" "wheel" ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJAZ3hoQZX9Y5w0jLNCcKBlpKyeaaVn7zOsDoI+0ee7b robinb@yeoreum"
    ];
  };

  virtualisation.vmVariant = {
    users.users.robinb.password = "password";
    virtualisation = {
      memorySize = 256;
      cores = 4;
      graphics = false;
    };
  };
}
