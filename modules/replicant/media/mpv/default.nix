{ config, lib, pkgs, username, ... }:

with lib; let
  cfg = config.replicant.media.mpv;
in {
  options.replicant.media.mpv = {
    enable = mkEnableOption "Enable mpv";
  };

  config = mkIf cfg.enable {
    home-manager.users.${username}.programs.mpv = {
      enable = true;
      scripts = with pkgs.mpvScripts; [ mpris ];
    };
  };
}
