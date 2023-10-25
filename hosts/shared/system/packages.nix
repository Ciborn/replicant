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
    awesome
    beautifuldiscord
    btop
    discord
    efibootmgr
    firefox
    glxinfo
    gnome.gnome-terminal
    gnome.gnome-tweaks
    home-manager
    htop
    kitty
    nano
    neofetch
    nwg-drawer
    os-prober
    playerctl
    polybar
    pw-volume
    python3
    rofi
    spotify
    stress
    sysbench
    s-tui
    vim
    vscode
    wget
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
}
