{ config, pkgs, lib, username, ... }:

with lib; let
  cfg = config.replicant.development.python;
in {
  options.replicant.development.python = {
    enable = mkEnableOption "Install Python-related development tools";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      python3
      uv
    ];

    home-manager.users.${username}.programs.vscode.extensions = with pkgs.vscode-extensions; [
      ms-python.python
      ms-python.vscode-pylance
      ms-toolsai.jupyter
    ];
  };
}
