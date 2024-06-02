{ config, pkgs, lib, username, ... }:

with lib; let
  cfg = config.replicant.development.nodejs;
in {
  options.replicant.development.nodejs = {
    enable = mkEnableOption "Enable Nodejs-related development tools";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; mkIf cfg.enable [
      corepack_20
      nest-cli
      nodejs_20
      typescript
    ];

    home-manager.users.${username}.programs.vscode.extensions = with pkgs.vscode-extensions; [
      bradlc.vscode-tailwindcss
      dbaeumer.vscode-eslint
    ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "volar";
        publisher = "Vue";
        version = "2.0.16";
        sha256 = "0ffn9daz1y02fb8j7js0nrrbkxrkhabgz6dl5zw871csp8bmnc25";
      }
    ];
  };
}
