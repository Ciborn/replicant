{ pkgs }:

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
