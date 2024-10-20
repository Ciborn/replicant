{ config, inputs, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    bitwarden
    cloudflared # TODO: should be moved to a shell.nix
    compsize
    ddcutil
    efibootmgr
    gnupg
    gparted
    intel-gpu-tools
    jetbrains.datagrip
    jellyfin-media-player
    obsidian
    onlyoffice-bin
    pinentry
    qbittorrent
    spotify
    teams-for-linux
    thunderbird
    ungoogled-chromium
    vesktop
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  nixpkgs.overlays = import ../../../overlays { inherit config lib pkgs; } ++ [ inputs.nur.overlay ];
}
