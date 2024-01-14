{ lib, pkgs, ... }:

let
  electronWrapper = (import ../../../overlays/electron.nix { inherit pkgs; });
in
{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    bitwarden
    btop
    cloudflared # TODO: should be moved to a shell.nix
    compsize
    ddcutil
    discord
    efibootmgr
    fastfetch
    firefox
    gnupg
    gparted
    htop
    intel-gpu-tools
    lm_sensors
    nano
    onlyoffice-bin
    pciutils
    pinentry
    qbittorrent
    spotify
    thunderbird
    tree
    usbutils
    vim
    vscode
    wget
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # see https://github.com/NixOS/nixpkgs/pull/98350
  # see https://github.com/suderman/nixos/blob/8d0157ac2f6820de86ecdf5b21434d0279a39dfb/overlays/lib/enableWayland.nix
  nixpkgs.overlays = [
    (final: prev: {
      discord = electronWrapper { pkg = prev.discord; path = "opt/Discord/Discord"; };
      spotify = electronWrapper { pkg = prev.spotify; path = "bin/spotify"; };
      vscode = electronWrapper { pkg = prev.vscode; path = "bin/code"; };
    })
  ];
}
