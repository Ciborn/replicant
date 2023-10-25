# https://nixos.wiki/wiki/Shell_Scripts#Packaging
{
  lib,
  makeWrapper,
  pkgs,
  stdenv
}:

stdenv.mkDerivation {
  pname = "polybar-spotify";
  version = "04028707e6d7b167adf9913d889b8509d13160ec";
  src = pkgs.fetchFromGitHub {
    # https://github.com/PrayagS/polybar-spotify
    owner = "PrayagS";
    repo = "polybar-spotify";
    rev = "04028707e6d7b167adf9913d889b8509d13160ec";
    hash = "sha256-OACxS/Mq9KXdFBjfTs3mx/bOXIMW/fjQsIdPMdpP9Tk=";
  };
  patches = [
    (pkgs.writeText "format.patch" ''
      diff --git a/polybar-spotify/get_spotify_status.sh b/polybar-spotify.patch/get_spotify_status.sh
      index b7e8613..d069bbf 100755
      --- a/get_spotify_status.sh
      +++ b/get_spotify_status.sh
      @@ -17,1 +17,1 @@ PLAYER="spotify"
      -FORMAT="{{ title }} - {{ artist }}"
      +FORMAT="{{ artist }} - {{ title }}"
    '')
  ];
  buildInputs = [ pkgs.bash pkgs.coreutils pkgs.gnugrep pkgs.playerctl pkgs.procps ];
  nativeBuildInputs = [ makeWrapper ];
  installPhase = ''
    mkdir -p $out/bin
    cp get_spotify_status.sh $out/bin/get_spotify_status.sh
    wrapProgram $out/bin/get_spotify_status.sh \
    --prefix PATH : ${lib.makeBinPath [ pkgs.bash pkgs.coreutils pkgs.gnugrep pkgs.playerctl pkgs.procps ]}
  '';
}
