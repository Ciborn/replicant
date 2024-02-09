{ ... }:

{
  imports = [
    ./10-front/traefik.nix

    ./21-personal-services/paperless.nix
  ];
}
