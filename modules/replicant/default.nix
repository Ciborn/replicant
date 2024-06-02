{ lib, ... }:

{
  imports = [
    ./audio/easyeffects
    ./audio/pipewire

    ./browsers/firefox

    ./desktops/eww
    ./desktops/gnome
    ./desktops/hyprland
    ./desktops/kde
    ./desktops/rofi

    ./development/nodejs
    ./development/python

    ./editors/vscode

    ./media/mpv

    ./servers/sunshine

    ./shells
    ./shells/fish
    ./shells/zsh
    
    ./tools/quarto
  ];
}
