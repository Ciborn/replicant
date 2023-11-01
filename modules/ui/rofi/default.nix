{ config, lib, pkgs, username, ... }:

with lib; let
  cfg = config.cibnix.ui.rofi;
in {
  options.cibnix.ui.rofi = {
    enable = mkEnableOption "Enable rofi";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      rofi
    ];

    home-manager.users.${username}.programs.rofi = {
      enable = true;
      extraConfig = {
        modes = "window,drun,run,ssh";
      };
    };
  };
}
