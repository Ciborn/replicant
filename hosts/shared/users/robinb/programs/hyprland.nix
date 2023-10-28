{ lib }:

{
  enable = true;
  settings = {
    "$mod" = "SUPER";
    bind = [
      "$mod,       C,                    killactive"
      "$mod,       F,                    fullscreen, 1"
      "$mod SHIFT, F,                    fullscreen, 0"
      "$mod,       R,                    exec, rofi -show drun"
      "$mod,       Q,                    exec, kitty"
      ",           XF86AudioRaiseVolume, exec, pw-volume change +0.5%"
      ",           XF86AudioLowerVolume, exec, pw-volume change -0.5%"
    ];
    decoration = {
      active_opacity = 0.95;
      inactive_opacity = 0.8;
      rounding = 4;
    };
    general = {
      gaps_out = 10;
    };
    input.kb_layout = "fr,us";
  };
}
