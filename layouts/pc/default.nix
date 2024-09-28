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

    tools.quarto.enable = true;
  };

  systemd.network = {
    enable = true;

    netdevs."20-tap0".netdevConfig = {
      Kind = "tap";
      Name = "tap0";
    };

    networks."50-tap0" = {
      matchConfig.Name = "tap0";
      networkConfig.ConfigureWithoutCarrier = true;
      address = [ "fca0::1/16" ];
    };

    wait-online.enable = false;
  };

  home-manager.useGlobalPkgs = true;

  hardware.opentabletdriver.enable = true;

  programs.dconf.enable = true;
  programs.gnupg.agent.enable = true;
  programs.steam.enable = true;

  networking.networkmanager.enable = true;

  networking.firewall.allowedTCPPorts = [ 3000 ];

  time.timeZone = "Europe/Paris";

  services.ntp.enable = true;
}
