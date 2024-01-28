{ pkgs }:

# see https://github.com/NixOS/nixpkgs/pull/98350
# see https://github.com/suderman/nixos/blob/8d0157ac2f6820de86ecdf5b21434d0279a39dfb/overlays/lib/enableWayland.nix
{ pkg, path }:
  pkgs.symlinkJoin {
    name = pkg.name;
    paths = [ pkg ];
    buildInputs = [ pkgs.makeWrapper ];
    postBuild = "wrapProgram $out/${path} --add-flags \"--force-device-scale-factor=1\"";
    pname = pkg.pname;
    version = pkg.version;
    meta = pkg.meta;
  }
