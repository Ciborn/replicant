{
  enable = true;
  settings = {
    "$mod" = "SUPER";
    bind = [
      "$mod,       C, killactive"
      "$mod,       F, fullscreen, 1"
      "$mod SHIFT, F, fullscreen, 0"
      "$mod, Q, exec, kitty"
    ];
    input.kb_layout = "fr,us";
    monitor = [
      "eDP-1,    1920x1200@60,  320x1440, 1" # native display
      "DP-1,     2560x1440@144, 0x0,      1" # external monitor, primary USB-C port
      "DP-2,     2560x1440@144, 0x0,      1" # external monitor, secondary USB-C port
      "HDMI-A-1, 1920x1080@60,  0x0,      1" # external monitor, HDMI port
      "        , highres,       auto,     1"
    ];
  };
}
