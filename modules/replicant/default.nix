{ lib, ... }:

{
  imports = [
    ./audio/easyeffects
    ./audio/pipewire

    ./browsers/firefox

    ./desktops
    ./desktops/eww
    ./desktops/gnome
    ./desktops/hyprland
    ./desktops/kde
    ./desktops/rofi

    ./development/c-sharp
    ./development/nodejs
    ./development/python
    ./development/vagrant

    ./editors/vscode

    ./media/mpv

    ./servers/sunshine

    ./shells
    ./shells/fish
    ./shells/zsh

    ./system/plymouth
    
    ./tools/ptyxis
    ./tools/quarto
  ];
}
