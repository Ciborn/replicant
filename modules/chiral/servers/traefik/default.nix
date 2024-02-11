{ config, lib, pkgs, ... }:

with lib; let
  cfg = config.chiral.servers.traefik;

  hosts = {
    http = ".donghoon";
    https = ".cib.sh";
  };
in {
  options.chiral.servers.traefik = {
    services = mkOption {
      type = with types; attrsOf (submodule ({ name, ... }: {
        options = {
          routers = mkOption {
            type = with types; attrsOf (submodule ({ ... }: {
              options = {
                rule = mkOption {
                  description = "The rule to pass to Traefik's config (overrides subdomain).";
                  type = with types; nullOr str;
                };

                subdomain = mkOption {
                  default = name;
                  description = "The subdomain of the service's host.";
                  type = with types; nullOr str;
                };
              };
            }));
          };

          proxyUrl = mkOption {
            description = "The IP:port combination of the service.";
            type = types.str;
          };
        };
      }));
    };
  };

  config = {
    containers.traefik.config.services.traefik.dynamicConfigOptions.http = {
      routers = mapAttrs (router: conf: {
        entryPoints = conf.entrypoint;
        rule = "Host(`${conf.subdomain}${hosts.${conf.entrypoint}}`)";
        inherit (conf) service;
      }) (lib.attrsets.mergeAttrsList (attrValues (mapAttrs (service: conf: mapAttrs' (entrypoint: conf: nameValuePair "${service}-${entrypoint}" (lib.attrsets.mergeAttrsList [ { inherit entrypoint service; } conf ])) conf.routers) cfg.services)));

      services = mapAttrs (service: conf: {
        loadBalancer.servers = [{ url = conf.proxyUrl; }];
      }) cfg.services;
    };
  };
}
