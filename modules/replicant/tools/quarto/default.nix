{ config, pkgs, lib, username, ... }:

with lib; let
  cfg = config.replicant.tools.quarto;
in {
  options.replicant.tools.quarto = {
    enable = mkEnableOption "Enable Quarto";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; mkIf cfg.enable [
      quarto
    ];

    home-manager.users.${username}.programs.vscode.extensions = pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "quarto";
        publisher = "quarto";
        version = "1.107.0";
        sha256 = "sha256-wRAB9C1vBgqI/+mhyz4nfvLgHzYKEmAYs1R5Nbdl490=";
      }
    ];
  };
}
