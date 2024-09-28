{ replicant, inputs, lib, pkgs, ... }:

{
  imports = [
    ./users/robinb
  ];

  replicant.shells.fish.enable = true;
  replicant.shells.useCommonTools = true;
  
  virtualisation.docker = {
    daemon.settings.features.containerd-snapshotter = true;
    enable = true;
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
