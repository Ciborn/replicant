{ pkgs, ... }:

let
  wrapElectron = (import ../../lib/wrapElectron.nix { inherit pkgs; });
in
(self: super: {
  discord = wrapElectron { pkg = super.discord; path = "opt/Discord/Discord"; };
})
