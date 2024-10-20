{ config, lib, pkgs, username, ... }:

with lib; let
  cfg = config.replicant.browsers.firefox;
in {
  options.replicant.browsers.firefox = {
    enable = mkEnableOption "Enable Firefox";
  };

  config = mkIf cfg.enable {
    programs.firefox.enable = true;

    home-manager.users.${username}.programs.firefox = {
      enable = true;

      profiles.${username} = {
        extensions = with pkgs.nur.repos.rycee.firefox-addons; [
          bitwarden
          foxyproxy-standard
          ublock-origin
        ];

        search = {
          default = "DuckDuckGo";
          force = true;

          engines = {
            "MyNixOS" = {
              urls = [{
                template = "https://mynixos.com/search";
                params = [{ name = "q"; value = "{searchTerms}"; }];
              }];

              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake-white.svg";
              definedAliases = [ "@mn" ];
            };

            "Nix Packages" = {
              urls = [{
                template = "https://search.nixos.org/packages";
                params = [
                  { name = "type"; value = "packages"; }
                  { name = "query"; value = "{searchTerms}"; }
                ];
              }];

              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = [ "@np" ];
            };

            "MyDramaList" = {
              urls = [{
                template = "https://mydramalist.com/search";
                params = [{ name = "q"; value = "{searchTerms}"; }];
              }];

              icon = builtins.fetchurl {
                sha256 = "sha256:1yv3g82hrfsg5zmj7xal5dnj7ckxmcbxlqda4c6yhr2ddyd99hcc";
                url = "https://mydramalist.com/favicon.ico";
              };
              
              definedAliases = [ "@mdl" ];
            };

            "Satisfactory Wiki" = {
              urls = [{
                template = "https://satisfactory.wiki.gg/wiki/Special:Search/{searchTerms}";
              }];

              icon = builtins.fetchurl {
                sha256 = "sha256:15lcqjazf8lb1ym7mp51j9f9r2xbxs469y370c9l898zr4p0y84y";
                url = "https://satisfactory.wiki.gg/images/4/4a/Site-favicon.ico";
              };
              
              definedAliases = [ "@sf" ];
            };

            "Google".metaData.alias = "@g"; # builtin engines only support specifying one additional alias
          };
        };

        settings = {
          "intl.locale.requested" = "fr";
        };
      };
    };
  };
}
