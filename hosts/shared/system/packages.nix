{ pkgs, ... }:

let
  beautifuldiscord = pkgs.callPackage ../../../pkgs/applications/beautifuldiscord { };
in
{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    beautifuldiscord
    bitwarden
    btop
    ddcutil
    discord
    efibootmgr
    fastfetch
    firefox
    glxinfo
    gnupg
    htop
    intel-gpu-tools
    kitty
    libguestfs-with-appliance
    lm_sensors
    nano
    onlyoffice-bin
    pciutils
    pinentry
    playerctl
    qbittorrent
    spotify
    steamPackages.steamcmd
    stress
    sysbench
    s-tui
    thunderbird
    tree
    usbutils
    vim
    vscode
    wget
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
}
