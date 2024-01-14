{ config, lib, pkgs, home-manager, nixpkgs, ... }:

{
  imports = [
    home-manager.nixosModules.home-manager
  ];

  cibnix.shells.zsh.enable = true;

  environment.systemPackages = with pkgs; [
    btop
    fastfetch
    htop
    nano
    tree
    vim
    wget
  ];

  hardware.pulseaudio.enable = false;

  networking.firewall.allowedTCPPorts = [ 22 80 ];
  networking.hostName = "emil";

  nixpkgs.hostPlatform.system = "x86_64-linux";
  # remove rpm support from fastfetch since we use nix (duh!), which fails to build anyways
  nixpkgs.overlays = [
    (final: prev: { fastfetch = prev.fastfetch.override { rpm = null; }; })
  ];

  services.prowlarr.enable = true;
  services.radarr.enable = true;
  services.sonarr.enable = true;

  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = false;
    settings.KbdInteractiveAuthentication = false;
  };

  services.traefik = {
    enable = true;
    staticConfigOptions.entryPoints.http.address = ":80";
    
    # TODO use a function instead
    dynamicConfigOptions.http = {
        # Prowlarr
        routers.prowlarr.rule = "Host(`prowlarr.emil`)";
        routers.prowlarr.service = "prowlarr";
        services.prowlarr.loadBalancer.servers = [{ url = "http://localhost:9696"; }];

        # Radarr
        routers.radarr.rule = "Host(`radarr.emil`)";
        routers.radarr.service = "radarr";
        services.radarr.loadBalancer.servers = [{ url = "http://localhost:7878"; }];

        # Sonarr
        routers.sonarr.rule = "Host(`sonarr.emil`)";
        routers.sonarr.service = "sonarr";
        services.sonarr.loadBalancer.servers = [{ url = "http://localhost:8989"; }];
    };
  };

  system.stateVersion = "23.11";

  users.users.robinb = {
    isNormalUser = true;
    description = "Robin Bourachot";
    extraGroups = [ "docker" "wheel" ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJAZ3hoQZX9Y5w0jLNCcKBlpKyeaaVn7zOsDoI+0ee7b robinb@yeoreum"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOsUVH8EZHld/2r6/lx89DkAMM3fTWGLnkdkpBRvsX6k robinb@hana"
    ];
  };

  virtualisation.vmVariant = {
    users.users.robinb.password = "password";
    virtualisation = {
      memorySize = 512;
      cores = 1;
      graphics = false;
    };
  };
}
