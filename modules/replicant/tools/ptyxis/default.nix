{ config, lib, pkgs, username, ... }:

with lib; let
  cfg = config.replicant.tools.ptyxis;
in {
  options.replicant.tools.ptyxis = {
    enable = mkEnableOption "Enable Ptyxis";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      ptyxis
    ];

    home-manager.users.${username} = {
      imports = [ ./dconf.nix ];
    };
  };
}
