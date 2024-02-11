{ lib, ... }:

{
  imports = [
    ./servers/openssh
    ./servers/traefik
  ];
}
