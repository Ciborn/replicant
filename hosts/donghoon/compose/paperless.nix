{ lib, mkTraefikLabels, ... }:

{
  project.name = "paperless";

  networks.traefik.external = true;

  services.paperless = { config, ... }: let
    conf = config.nixos.evaluatedConfig.services.paperless;
  in
  {
    nixos.configuration = {
      nixpkgs.overlays = [ (self: super: {
        openjdk8 = super.openjdk8.override { headless = true; }; # https://github.com/NixOS/nixpkgs/issues/265675
      }) ];

      services.paperless.enable = true;
      system.stateVersion = "23.11";
    };

    nixos.useSystemd = true;

    service.labels = mkTraefikLabels "paperless" {
      entrypoints = [ "lan" "wan" ];
      sub = "documents";
      port = toString conf.port;
    };

    service.networks = [ "traefik" ];
    service.volumes = [ "/var/lib/compose/paperless/data:${conf.dataDir}" ];

    service.useHostStore = true;
  };
}
