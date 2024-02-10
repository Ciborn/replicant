{ config, ... }:

let
  port = config.services.paperless.port;
  service = "paperless";
  ip = "fca0:0001:2101::1";
in
{
  containers.${service} = {
    # meta
    autoStart = true;

    # networking
    hostBridge = "br0";
    localAddress6 = "${ip}/16";
    privateNetwork = true;

    config = { config, ... }: {
      networking.firewall.allowedTCPPorts = [ port ];

      services.paperless = {
        address = "[fca0:0001:1001::1]";
        enable = true;
      };

      system.stateVersion = "23.11";
    };
  };

  containers.traefik.config.services.traefik.dynamicConfigOptions.http = {
    routers."${service}-http" = {
      entrypoints = "http";
      rule = "Host(`${service}.donghoon`)";
      inherit service;
    };

    services.${service}.loadBalancer.servers = [{ url = "http://[${ip}]:${toString port}"; }];
  };
}
