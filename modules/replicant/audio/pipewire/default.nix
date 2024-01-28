{ config, lib, pkgs, username, ... }:

with lib; let
  cfg = config.replicant.audio.pipewire;
in {
  options.replicant.audio.pipewire = {
    enable = mkEnableOption "Enable Pipewire";
  };

  config = mkIf cfg.enable {
    hardware.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
    };
  };
}
