{ replicant, inputs, lib, pkgs, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    inputs.nixos-hardware.nixosModules.common-pc-ssd
    ../common
    ./system/boot.nix
    ./system/fonts.nix
    ./system/hardware.nix
    ./system/locale.nix
    ./system/packages.nix
    ./users/robinb
  ];

  replicant = {
    audio.easyeffects.enable = true;
    audio.pipewire.enable = true;

    browsers.firefox.enable = true;

    development.nodejs.enable = true;
    development.python.enable = true;
    development.vagrant.enable = true;

    editors.vscode.enable = true;

    media.mpv.enable = true;

    system.plymouth.enable = true;

    tools.quarto.enable = true;
  };

  home-manager.useGlobalPkgs = true;

  programs.dconf.enable = true;
  programs.gnupg.agent.enable = true;
  programs.steam.enable = true;
  programs.virt-manager.enable = true;

  networking.firewall.allowedTCPPorts = [ 3000 ];
  networking.networkmanager.enable = true;

  systemd.services.NetworkManager-wait-online.enable = false;

  virtualisation.libvirtd.enable = true;

  time.timeZone = "Europe/Paris";

  services.ntp.enable = true;
}
