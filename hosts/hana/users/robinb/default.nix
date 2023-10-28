{ pkgs, ... }:

{
  home-manager.users.robinb = {
    home.file.".config/awesome".source = ./services/awesome/config;
    home.file.".config/polybar/spotify" = {
      executable = true;
      source = pkgs.callPackage ../../../../pkgs/applications/polybar-spotify { };
    };

    programs.rofi = import ./programs/rofi.nix;

    services.polybar = import ./services/polybar.nix;
  };
}
