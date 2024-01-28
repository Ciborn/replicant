{ pkgs, ... }:

let
  wrapElectron = (import ../../lib/wrapElectron.nix { inherit pkgs; });
in
(self: super: {
  vscode = wrapElectron { pkg = super.vscode; path = "bin/code"; };
})
