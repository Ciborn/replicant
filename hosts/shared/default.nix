{ cibnix, home-manager, lib, pkgs, ... }:

{
  imports = [
    (import "${home-manager}/nixos")
    ./system/boot.nix
    ./system/fonts.nix
    ./system/hardware.nix
    ./system/locale.nix
    ./system/packages.nix
    ./system/sound.nix
    ./users/robinb
  ];

  environment.sessionVariables = {
    NIXOS_OZONE_WL          = "1";
    WLR_NO_HARDWARE_CURSORS = "1";
  };

  cibnix.desktops.kde.enable = true;
  cibnix.development.nodejs.enable = true;
  cibnix.development.python.enable = true;
  cibnix.shells.zsh.enable = true;
  cibnix.tools.quarto.enable = true;

  programs.firefox.enable = true;
  programs.steam.enable = true;

  programs.gnupg.agent = {
    enable = true;
    pinentryFlavor = "tty";
  };

  virtualisation.docker.enable = true;
  virtualisation.docker.storageDriver = "btrfs";

  # Enable CUPS to print documents.
  services.printing.enable = true;

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
