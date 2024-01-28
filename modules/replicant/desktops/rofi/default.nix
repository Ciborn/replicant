{ config, lib, pkgs, username, ... }:

with lib; let
  cfg = config.replicant.desktops.rofi;
in {
  options.replicant.desktops.rofi = {
    enable = mkEnableOption "Enable rofi";
  };

  config = mkIf cfg.enable {
    home-manager.users.${username}.programs.rofi = {
      enable = true;
      extraConfig = {
        modes = "window,drun,run,ssh";
      };
    };
  };
}
