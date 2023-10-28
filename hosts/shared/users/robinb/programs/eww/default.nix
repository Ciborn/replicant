{ pkgs }:

{
  configDir = ./config;
  enable = true;
  package = pkgs.eww-wayland;
}
