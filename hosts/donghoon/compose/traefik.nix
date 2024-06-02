{ config, lib, ... }:

{
  project.name = "traefik";

  networks.traefik.name = "traefik";

  services.traefik = {
    nixos.configuration.services.traefik = {
      enable = true;

      staticConfigOptions = {
        api = { };
        
        entryPoints = {
          lan = { address = ":80"; };
          wan = { address = ":443"; http3 = {}; };
          metrics = { address = ":9091"; };
        };

        experimental.http3 = true;

        metrics.prometheus = {
          addEntryPointsLabels = true;
          addRoutersLabels = true;
          addServicesLabels = true;
          entryPoint = "metrics";
        };

        providers.docker.network = "traefik";
      };
    };

    nixos.configuration.system.stateVersion = "23.11";
    nixos.configuration.users.groups.podman = {
      gid = 1101;
      members = [ "traefik" ];
    };

    nixos.useSystemd = true;

    service.networks = [ "traefik" ];
    service.ports = [ "80:80" "443:443" "9091:9091" ];
    service.volumes = [ "/var/run/docker.sock:/var/run/docker.sock" ];

    service.useHostStore = true;
  };
}
