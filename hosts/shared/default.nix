{ replicant, home-manager, nixos-hardware, lib, pkgs, ... }:

{
  imports = [
    home-manager.nixosModules.home-manager
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
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  networking.firewall.allowedTCPPorts = [ 3000 ];

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;
}
