{ config, lib, pkgs, username, ... }:

with lib; let
  cfg = config.replicant.system.plymouth;

  mkInstallPhase = path: ''
    mkdir -p $out/share/plymouth/themes/${path}
    cp * $out/share/plymouth/themes/${path}
    find $out/share/plymouth/themes/ -name \*.plymouth -exec sed -i "s@\/usr\/@$out\/@" {} \;
  '';
in {
  options.replicant.system.plymouth = {
    enable = mkEnableOption "Enable Plymouth";
  };

  config = mkIf cfg.enable {
    boot.plymouth = {
      enable = true;
      theme = "plymouth-cat";

      themePackages = [
        (pkgs.stdenv.mkDerivation rec {
          name = "plymouth-lone";

          src = pkgs.fetchFromGitHub {
            owner = "adi1090x";
            repo = "plymouth-themes";
            rev = "5d8817458d764bff4ff9daae94cf1bbaabf16ede";
            sha256 = "sha256-e3lRgIBzDkKcWEp5yyRCzQJM6yyTjYC5XmNUZZroDuw=";
          };

          sourceRoot = "${src.name}/pack_3/lone";
          installPhase = mkInstallPhase name;
        })
        (pkgs.stdenv.mkDerivation rec {
          name = "plymouth-cat";
          src = ./themes/plymouth-cat;
          installPhase = mkInstallPhase name;
        })
      ];
    };
  };
}
