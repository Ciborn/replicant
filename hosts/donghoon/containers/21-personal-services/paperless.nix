{ config, ... }:

let
  ip = "fc14::211";
  port = config.services.paperless.port;
  service = "paperless";
in
{
  containers.${service} = {
    # meta
    autoStart = true;

    # networking
    hostAddress6  = "${ip}a";
    localAddress6 = "${ip}b";
    privateNetwork = true;

    config = { config, ... }: {
      networking.firewall.allowedTCPPorts = [ port ];

      services.paperless = {
        address = "fc14::101b";
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

    services.${service}.loadBalancer.servers = [{ url = "http://[${ip}b]:${toString port}"; }];
  };
}
