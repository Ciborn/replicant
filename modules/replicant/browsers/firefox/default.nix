{ config, lib, pkgs, username, ... }:

with lib; let
  cfg = config.replicant.browsers.firefox;
in {
  options.replicant.browsers.firefox = {
    enable = mkEnableOption "Enable Firefox";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ firefox ];

    programs.firefox = {
      enable = true;
      # nativeMessagingHosts.packages = mkIf config.replicant.desktops.kde.enable [ pkgs.plasma5Packages.plasma-browser-integration ];
    };

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

            "Google".metaData.alias = "@g"; # builtin engines only support specifying one additional alias
          };
        };
      };
    };
  };
}
