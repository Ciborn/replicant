{ config, pkgs, lib, username, ... }:

with lib; let
  cfg = config.replicant.development.c-sharp;
in {
  options.replicant.development.c-sharp = {
    enable = mkEnableOption "Enable C#-related development tools";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; mkIf cfg.enable [
      dotnetCorePackages.sdk_8_0
    ];

    home-manager.users.${username}.programs.vscode.extensions = with pkgs.vscode-extensions; [
			ms-dotnettools.csdevkit
    ];
  };
}
