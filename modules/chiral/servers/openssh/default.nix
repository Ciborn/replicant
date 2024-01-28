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

    users.users.robinb.openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOsUVH8EZHld/2r6/lx89DkAMM3fTWGLnkdkpBRvsX6k robinb@hana"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJAZ3hoQZX9Y5w0jLNCcKBlpKyeaaVn7zOsDoI+0ee7b robinb@yeoreum"
    ];
  };
}
