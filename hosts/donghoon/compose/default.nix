args@{ lib, ... }:

let
  hosts = {
    lan = ".donghoon";
    wan = ".cib.sh";
  };

  mkTraefikLabels = name: { entrypoints, sub ? name, port }: lib.mkMerge [
    ({ "traefik.enable" = "true"; })
    (lib.mkIf (port != null) {
      "traefik.http.services.${name}.loadbalancer.server.port" = port;
    })
    (lib.attrsets.mergeAttrsList (map (entrypoint: {
      "traefik.http.routers.${name}-${entrypoint}.rule" = "Host(`${sub}${hosts.${entrypoint}}`)";
      "traefik.http.routers.${name}-${entrypoint}.entrypoints" = entrypoint;
    }) entrypoints))
  ];

  mkCompose = path: { settings = import path (args // { inherit mkTraefikLabels; }); };
in
{
  virtualisation.arion = {
    backend = "podman-socket";

    projects = {
      paperless = mkCompose ./paperless.nix;
      traefik = mkCompose ./traefik.nix;
    };
  };
}
