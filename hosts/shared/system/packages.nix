{ pkgs, ... }:

{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    bitwarden
    cloudflared # TODO: should be moved to a shell.nix
    compsize
    ddcutil
    discord
    efibootmgr
    firefox
    gnupg
    gparted
    intel-gpu-tools
    mpv
    onlyoffice-bin
    pinentry
    qbittorrent
    spotify
    thunderbird
    vscode
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  nixpkgs.overlays = import ../../../overlays { inherit pkgs; };
}
