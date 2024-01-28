{ config, pkgs, lib, useranme, ... }:

with lib; let
  cfg = config.replicant.desktops.eww;
in {
  options.replicant.desktops.eww = {
    enable = mkEnableOption "Enable eww";
  };

  config = mkIf cfg.enable {
    home-manager.users.${username} = {
      programs.eww = {
        configDir = ./config;
        enable = true;
        package = pkgs.eww-wayland;
      };

      programs.vscode.extensions = pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "yuck";
          publisher = "eww-yuck";
          version = "0.0.3";
          sha256 = "sha256-DITgLedaO0Ifrttu+ZXkiaVA7Ua5RXc4jXQHPYLqrcM=";
        }
      ];
    };
  };
}
