{ config, lib, pkgs, username, ... }:

with lib; let
  cfg = config.replicant.servers.sunshine;
in {
  options.replicant.servers.sunshine = {
    enable = mkEnableOption "Enable Sunshine";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      sunshine
    ];

    nixpkgs.config.cudaSupport = true;

    # see https://github.com/NixOS/nixpkgs/pull/235655
    nixpkgs.overlays = [
      (final: prev: { sunshine = prev.sunshine.override { stdenv = pkgs.cudaPackages.backendStdenv; }; })
    ];

    networking.firewall.allowedTCPPorts = [ 47984 47989 48010 ];
    networking.firewall.allowedUDPPorts = [ 47998 47999 48000 48010 ];

    # allow packets from router at 1900/udp and ?????-?????/udp
    networking.firewall.extraCommands = ''
      iptables -A INPUT -i wlo1 -p udp -s 192.168.1.1 -j ACCEPT
    '';

    # see https://nixos.wiki/wiki/Extend_NixOS
    systemd.user.services.sunshine = {
      wantedBy = [ "graphical-session.target" ];
      serviceConfig = {
        ExecStart = "${pkgs.sunshine}/bin/sunshine";
        Restart = "always";
      };
    };
  };
}
