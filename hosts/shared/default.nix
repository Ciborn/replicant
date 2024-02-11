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

    desktops.kde.enable = true;

    development.nodejs.enable = true;
    development.python.enable = true;

    editors.vscode.enable = true;

    shells.useCommonTools = true;
    shells.zsh.enable = true;

    tools.quarto.enable = true;
  };

  networking.interfaces.tap0 = {
    ipv6.addresses = [{ address = "fca0::1"; prefixLength = 16; }];
    virtual = true;
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
