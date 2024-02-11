{ config, lib, ... }:

let
  mkContainer = (import ../../../../lib/mkContainer.nix { }).mkContainer;

  ip = "fca0:0001:1001::1";
in
{
  containers.traefik = mkContainer { inherit ip; } {
    config = { config, ... }: {
      networking.firewall.allowedTCPPorts = [ 80 443 9091 ];
      networking.firewall.allowedUDPPorts = [ 443 ]; # HTTP/3

      services.traefik = {
        enable = true;

        staticConfigOptions = {
          api = { };
          
          entryPoints = {
            http.address = ":80";

            https.address = ":443";
            https.http3 = { };

            metrics.address = ":9091";
          };

          experimental.http3 = true;

          metrics.prometheus = {
            addEntryPointsLabels = true;
            addRoutersLabels = true;
            addServicesLabels = true;
            entryPoint = "metrics";
          };
        };
      };

      system.stateVersion = "23.11";
    };
  };
}
