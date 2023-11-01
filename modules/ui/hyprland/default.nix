{ config, lib, pkgs, username, ... }:

with lib; let
  cfg = config.cibnix.ui.hyprland;
in {
  options.cibnix.ui.hyprland = {
    enable = mkEnableOption "Enable Hyprland";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      wlr-randr
    ];

    home-manager.users.${username}.wayland.windowManager.hyprland = {
      enable = true;
      settings = {
        "$mod" = "SUPER";
        bind = [
          "$mod,       C,                    killactive"
          "$mod,       F,                    fullscreen, 1"
          "$mod SHIFT, F,                    fullscreen, 0"
          "$mod,       R,                    exec, rofi -show drun"
          "$mod,       Q,                    exec, kitty"
          ",           XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%+"
          ",           XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%-"
        ];
        decoration = {
          active_opacity = 0.95;
          inactive_opacity = 0.8;
          rounding = 4;
        };
        exec-once = [ "eww open bar" ];
        general = {
          gaps_out = 10;
        };
        input.kb_layout = "fr,us";
      };
    };

    programs.hyprland.enable = true;
  };
}
