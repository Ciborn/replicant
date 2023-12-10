{ config, pkgs, lib, username, ... }:

with lib; let
  cfg = config.cibnix.development.nodejs;
in {
  options.cibnix.development.nodejs = {
    enable = mkEnableOption "Enable Nodejs-related development tools";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; mkIf cfg.enable [
      corepack_20
      nest-cli
      nodejs_20
      typescript
    ];

    home-manager.users.${username}.programs.vscode.extensions = pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "volar";
        publisher = "Vue";
        version = "1.8.25";
        sha256 = "sha256-3RQ8dBy83QblARNMjy5RliVYSxEUdJA/3yyWcLK0wVQ=";
      }
    ];
  };
}
