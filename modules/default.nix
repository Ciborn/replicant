{ lib, ... }:

{
  imports = [
    ./audio/easyeffects
    ./audio/pipewire

    ./desktops/eww
    ./desktops/gnome
    ./desktops/hyprland
    ./desktops/kde
    ./desktops/rofi

    ./development/nodejs
    ./development/python

    ./servers/sunshine

    ./shells/zsh
    
    ./tools/quarto
  ];
}
