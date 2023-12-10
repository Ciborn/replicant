{ lib, ... }:

{
  imports = [
    ./desktops/eww
    ./desktops/gnome
    ./desktops/hyprland
    ./desktops/rofi
    ./development/nodejs
    ./development/python
    ./shells/zsh
    ./tools/quarto
  ];
}
