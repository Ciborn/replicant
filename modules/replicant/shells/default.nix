{ config, pkgs, lib, username, ... }:

with lib; let
  cfg = config.replicant.shells;
in {
  options.replicant.shells = {
    useCommonTools = mkEnableOption "Use common shell tools";
  };

  config = mkIf cfg.useCommonTools {
    environment.systemPackages = with pkgs; [
        btop
        fastfetch
        htop
        lm_sensors
        nano
        pciutils
        tree
        vim
        wget
    ];
  };
}
