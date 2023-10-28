{ pkgs, home-manager, ... }:

let
  beautifuldiscord = pkgs.callPackage ../../../pkgs/applications/beautifuldiscord { };
in
{
  imports = [
    (import "${home-manager}/nixos")
  ];

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
    home-manager
    htop
    intel-gpu-tools
    kitty
    nano
    neofetch
    nwg-drawer
    pciutils
    playerctl
    pw-volume
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
