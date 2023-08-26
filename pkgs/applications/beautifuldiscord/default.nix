{ pkgs, fetchurl }:

# inspired by https://github.com/leovoel/BeautifulDiscord/pull/63#issue-386608805
pkgs.python311Packages.buildPythonApplication {
  name = "beautifuldiscord";
  version = "0.2.0";
  src = fetchurl {
    url = "https://github.com/leovoel/BeautifulDiscord/archive/7d79336a1ffa01d89258074d8701860fab865585.zip";
    hash = "sha256-G77hkWn+Obt/ahXwUF7TBc26QZlRh0J/OG9N8yPh+mg=";
  };
  doCheck = false;
  patches = [
    (pkgs.writeText "fix-executable-finder.patch" ''
      diff --git a/beautifuldiscord/app.py b/beautifuldiscord.patch/app.py
      index 643e934..5bb0dbf 100644
      --- a/beautifuldiscord/app.py
      +++ b/beautifuldiscord.patch/app.py
      @@ -171,1 +171,1 @@ def discord_process():
      -            if exe.startswith('Discord') and not exe.endswith('Helper'):
      +            if exe.startswith('.Discord-wrapped') and not exe.endswith('Helper'):
    '')
  ];
  propagatedBuildInputs = with pkgs.python311Packages; [ psutil ];
}
