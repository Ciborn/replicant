{ pkgs, home-manager, ... }:

let
  beautifuldiscord = pkgs.callPackage ../../../pkgs/applications/beautifuldiscord { };
in
{
  imports = [
    (import "${home-manager}/nixos")
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
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
    polybar
    python3
    spotify
    stress
    sysbench
    s-tui
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    vscode
    wayland
    wget
  ];
}
