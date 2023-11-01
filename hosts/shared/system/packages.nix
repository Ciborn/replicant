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
    eww-wayland
    firefox
    glxinfo
    gnupg
    htop
    intel-gpu-tools
    kitty
    libnotify
    nano
    neofetch
    pciutils
    pinentry
    playerctl
    python3
    rofi
    spotify
    stress
    sysbench
    s-tui
    tree
    usbutils
    vim
    vscode
    wget
    wlr-randr
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
}
