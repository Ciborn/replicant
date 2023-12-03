{ config, pkgs, lib, username, ... }:

with lib; let
  cfg = config.cibnix.desktops.eww;
in {
  options.cibnix.desktops.eww = {
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

    home-manager.users.${username}.programs.vscode.extensions = pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "yuck";
        publisher = "eww-yuck";
        version = "0.0.3";
        sha256 = "sha256-DITgLedaO0Ifrttu+ZXkiaVA7Ua5RXc4jXQHPYLqrcM=";
      }
    ];
  };
}
