{ config, inputs, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    bitwarden
    cloudflared # TODO: should be moved to a shell.nix
    compsize
    ddcutil
    discord
    efibootmgr
    gnupg
    gparted
    intel-gpu-tools
    jetbrains.datagrip
    mpv
    mpvScripts.mpris
    onlyoffice-bin
    pinentry
    protonvpn-gui
    qbittorrent
    spotify
    thunderbird
    vscode
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  nixpkgs.overlays = import ../../../overlays { inherit config pkgs; } ++ [ inputs.nur.overlay ];
}
