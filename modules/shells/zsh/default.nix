{ config, pkgs, lib, username, ... }:

with lib; let
  cfg = config.cibnix.tools.quarto;
in {
  options.cibnix.shells.zsh = {
    enable = mkEnableOption "Enable zsh";
  };

  config = mkIf cfg.enable {
    programs.zsh.ohMyZsh = {
        enable = true;
        plugins = [ "git" ];
        theme = "robbyrussell";
    };
  };
}
