{ lib, ... }:

{
  imports = [
    ./desktops/eww
    ./desktops/gnome
    ./desktops/hyprland
    ./desktops/rofi
    ./shells/zsh
    ./tools/quarto
  ];
}
