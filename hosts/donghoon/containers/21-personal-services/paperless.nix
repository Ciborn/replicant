{ config, lib, ... }:

let
  mkContainer = (import ../../../../lib/mkContainer.nix { }).mkContainer;

  port = config.services.paperless.port;
  service = "paperless";
  ip = "fca0:0001:2101::1";
in
{
  containers.${service} = mkContainer { inherit ip; } {
    # meta
    autoStart = true;

    # networking
    hostBridge = "br0";
    localAddress6 = "${ip}/16";
    privateNetwork = true;

    config = { config, ... }: {
      networking.firewall.allowedTCPPorts = [ port ];

      services.paperless = {
        address = "[::]";
        enable = true;
      };

      system.stateVersion = "23.11";
    };
  };

  chiral.servers.traefik.services.paperless = {
    routers.http.subdomain = service;
    url = "http://[${ip}]:${toString port}";
  };
}
