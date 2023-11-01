{ config, pkgs, lib, username, ... }:

with lib; let
  cfg = config.cibnix.ui.eww;
in {
  options.cibnix.ui.eww = {
    enable = mkEnableOption "Enable eww";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; mkIf cfg.enable [
      eww-wayland
    ];

    home-manager.users.${username}.programs.eww = {
      configDir = ./config;
      enable = true;
      package = pkgs.eww-wayland;
    };
  };
}
