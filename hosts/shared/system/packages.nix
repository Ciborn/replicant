{ pkgs, ... }:

let
  beautifuldiscord = pkgs.callPackage ../../../pkgs/applications/beautifuldiscord { };
in
{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    beautifuldiscord
    btop
    ddcutil
    discord
    efibootmgr
    firefox
    glxinfo
    gnupg
    htop
    intel-gpu-tools
    kitty
    nano
    neofetch
    onlyoffice-bin
    pciutils
    pinentry
    playerctl
    python3
    spotify
    stress
    sysbench
    s-tui
    tree
    usbutils
    vim
    vscode
    wget
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
}
