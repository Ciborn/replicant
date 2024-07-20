{ replicant, inputs, lib, pkgs, ... }:

{
  imports = [
    ./users/robinb
  ];

  replicant.shells.fish.enable = true;
  replicant.shells.useCommonTools = true;
  
  virtualisation.docker.enable = true;
  virtualisation.docker.storageDriver = "btrfs";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
