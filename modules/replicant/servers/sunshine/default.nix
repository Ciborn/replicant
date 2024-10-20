{ config, lib, pkgs, username, ... }:

with lib; let
  cfg = config.replicant.servers.sunshine;
in {
  options.replicant.servers.sunshine = {
    enable = mkEnableOption "Enable Sunshine";
  };

  config = mkIf cfg.enable {
    services.sunshine = {
      enable = true;
      capSysAdmin = true;
      openFirewall = true;

      # see https://github.com/NixOS/nixpkgs/pull/235655
      package = (pkgs.sunshine.overrideAttrs (oldAttrs: rec {
        buildInputs = oldAttrs.buildInputs ++ [ pkgs.bash ];

        postFixup = ''
          wrapProgram $out/bin/sunshine \
            --prefix PATH : ${lib.makeBinPath [ pkgs.bash ]} \
            --prefix DISPLAY : ":0"
        '';
      })).override {
        stdenv = pkgs.cudaPackages.backendStdenv;
      };

      applications.apps = [
        {
          name = "MoonDeckStream";
          cmd = "bash -c \"LD_LIBRARY_PATH=$NIX_LD_LIBRARY_PATH /home/robinb/Téléchargements/squashfs-root/AppRun --exec MoonDeckStream\"";
          auto-detach = "false";
        }
        {
          name = "Desktop";
          image = "desktop.png";
        }
      ];

      settings = {
        output_name = "0";
      };
    };

    nixpkgs.config.cudaSupport = true;

    networking.firewall.allowedTCPPorts = [ 59999 ]; # MoonDeckStream
    networking.firewall.allowedUDPPorts = [ 47999 ]; # MoonDeckStream

    # # allow packets from router at 1900/udp and ?????-?????/udp
    # networking.firewall.extraCommands = ''
    #   iptables -A INPUT -i wlo1 -p udp -s 192.168.1.1 -j ACCEPT
    # '';
  };
}
