{ config, lib, pkgs, username, ... }:

with lib; let
  cfg = config.cibnix.audio.easyeffects;
in {
  options.cibnix.audio.easyeffects = {
    enable = mkEnableOption "Enable EasyEffects";
  };

  config = mkIf cfg.enable {
    programs.dconf.enable = true;

    home-manager.users.${username} = {
      imports = [ ./dconf.nix ];
      services.easyeffects.enable = true;
    };
  };
}
