{ replicant, home-manager, nixos-hardware, lib, pkgs, ... }:

{
  imports = [
    home-manager.nixosModules.home-manager
    nixos-hardware.nixosModules.common-cpu-intel
    nixos-hardware.nixosModules.common-pc-ssd
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

    desktops.kde.enable = true;

    development.nodejs.enable = true;
    development.python.enable = true;

    editors.vscode.enable = true;

    shells.useCommonTools = true;
    shells.zsh.enable = true;

    tools.quarto.enable = true;
  };

  programs.firefox.enable = true;
  programs.steam.enable = true;

  programs.gnupg.agent = {
    enable = true;
    pinentryFlavor = "tty";
  };

  virtualisation.docker.enable = true;
  virtualisation.docker.storageDriver = "btrfs";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.networkmanager.enable = true;

  networking.firewall.allowedTCPPorts = [ 3000 ];
}
