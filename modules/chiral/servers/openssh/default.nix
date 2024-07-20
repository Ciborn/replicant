{ config, lib, pkgs, ... }:

with lib; let
  cfg = config.chiral.servers.openssh;
in {
  options.chiral.servers.openssh = {
    enable = mkEnableOption "Enable OpenSSH";
  };

  config = mkIf cfg.enable {
    services.openssh = {
      enable = true;
      settings.PasswordAuthentication = false;
      settings.KbdInteractiveAuthentication = false;
    };
  };
}
