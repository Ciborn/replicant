{ pkgs, ... }:

let
  wrapElectron = (import ../../lib/wrapElectron.nix { inherit pkgs; });
in
(self: super: {
  spotify = wrapElectron { pkg = super.spotify; path = "bin/spotify"; };
})
