{ config, pkgs, lib, username, ... }:

with lib; let
  cfg = config.replicant.development.vagrant;
in {
  options.replicant.development.vagrant = {
    enable = mkEnableOption "Install Vagrant";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      vagrant
    ];
  };
}
