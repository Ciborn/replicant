{ replicant, inputs, lib, pkgs, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    inputs.nixos-hardware.nixosModules.common-cpu-intel
    inputs.nixos-hardware.nixosModules.common-pc-ssd
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

    desktops.kde.enable = true;

    development.nodejs.enable = true;
    development.python.enable = true;

    editors.vscode.enable = true;

    media.mpv.enable = true;

    shells.fish.enable = true;
    shells.useCommonTools = true;

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

  programs.gnupg.agent.enable = true;
  programs.steam.enable = true;

  virtualisation.docker.enable = true;
  virtualisation.docker.storageDriver = "btrfs";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.networkmanager.enable = true;

  networking.firewall.allowedTCPPorts = [ 3000 ];
}
