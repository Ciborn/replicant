{ ... }:

let
  ip = "fc14::101";
in
{
  containers.traefik = {
    # meta
    autoStart = true;

    # networking
    hostAddress6  = "${ip}a";
    localAddress6 = "${ip}b";
    privateNetwork = true;

    config = { config, ... }: {
      networking.firewall.allowedTCPPorts = [ 80 443 ];
      networking.firewall.allowedUDPPorts = [ 80 443 ]; # HTTP/3

      services.traefik = {
        enable = true;

        staticConfigOptions = {
          api = { };
          
          entryPoints = {
            http.address = ":80";
            https.address = ":443";
          };
        };
      };

      system.stateVersion = "23.11";
    };
  };
}
