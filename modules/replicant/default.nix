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

    ./servers/sunshine

    ./shells
    ./shells/zsh
    
    ./tools/quarto
  ];
}
