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

  networking.interfaces.tap0 = {
    ipv6.addresses = [{ address = "fca0::1"; prefixLength = 16; }];
    virtual = true;
  };

  programs.gnupg.agent.enable = true;
  programs.steam.enable = true;

  virtualisation.docker.enable = true;
  virtualisation.docker.storageDriver = "btrfs";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.networkmanager.enable = true;

  networking.firewall.allowedTCPPorts = [ 3000 ];
}
