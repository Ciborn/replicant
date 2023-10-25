{
  enable = true;
  script = "polybar top &";
  settings = {
    "colors" = {
      background     = "#282A2E";
      background-alt = "#373B41";
      foreground     = "#C5C8C6";
      primary        = "#F0C674";
      secondary      = "#8ABEB7";
      alert          = "#A54242";
      disabled       = "#707880";
    };
    "bar/top" = {
      width = "100%";
      height = "22pt";
      # radius = 6;

      # dpi = 96

      background = "\${colors.background}";
      foreground = "\${colors.foreground}";

      line-size = "3pt";

      # border-size = "4pt";
      # border-color = "#00000000";

      padding-left = 0;
      padding-right = 1;

      module-margin = 1;

      separator = "|";
      separator-foreground = "\${colors.disabled}";

      font = [ "Comic Mono:size=10;4" "Comic Neue:size=11:weight=bold;3"  ];

      modules-left = "xworkspaces spotify";
      modules-center = "date";
      modules-right = "filesystem pulseaudio xkeyboard memory cpu wlan eth";

      cursor-click = "pointer";
      cursor-scroll = "ns-resize";

      enable-ipc = true;

      underline-size = 2;

      # tray-position = right

      # wm-restack = generic
      # wm-restack = bspwm
      # wm-restack = i3

      # override-redirect = true
    };
    "module/xworkspaces" = {
      type = "internal/xworkspaces";

      label-active = "%name%";
      label-active-background = "\${colors.background-alt}";
      label-active-underline= "\${colors.primary}";
      label-active-padding = 1;

      label-occupied = "%name%";
      label-occupied-padding = 1;

      label-urgent = "%name%";
      label-urgent-background = "\${colors.alert}";
      label-urgent-padding = 1;

      label-empty = "%name%";
      label-empty-foreground = "\${colors.disabled}";
      label-empty-padding = 1;
    };
    "module/date" = {
      type = "internal/date";
      interval = 1;
      
      date = "%d/%m";
      time = "%H:%M";

      label = "%{F#C5C8C6}%date% %{F#F0C674}%time%";
    };
    "module/filesystem" = {
      type = "internal/fs";
      interval = 25;

      mount = [ "/" ];

      label-mounted = "%{F#F0C674}%mountpoint%%{F-} %percentage_used%%";

      label-unmounted = "%mountpoint%";
      label-unmounted-foreground = "\${colors.disabled}";
    };
    "module/xkeyboard" = {
      type = "internal/xkeyboard";
      blacklist = [ "num lock" ];

      label-layout = "%layout%";
      label-layout-foreground = "\${colors.primary}";

      label-indicator-padding = 2;
      label-indicator-margin = 1;
      label-indicator-foreground = "\${colors.background}";
      label-indicator-background = "\${colors.secondary}";
    };
    "module/memory" = {
      type = "internal/memory";
      interval = 2;

      format-prefix = "RAM ";
      format-prefix-foreground = "\${colors.primary}";
      label = "%percentage_used:2%%";
    };
    "settings" = {
      screenchange-reload = true;
      pseudo-transparency = true;
    };
    "module/cpu" = {
      type = "internal/cpu";
      interval = 2;

      format-prefix = "CPU ";
      format-prefix-foreground = "\${colors.primary}";
      label = "%percentage:2%%";
    };
    "network-base" = {
      type = "internal/network";
      interval = 5;
      format-connected = "<label-connected>";
      format-disconnected = "<label-disconnected>";
      label-disconnected = "%{F#F0C674}%ifname%%{F#707880} off";
    };
    "module/wlan" = {
      "inherit" = "network-base";
      interface-type = "wireless";
      label-connected = "%{F#F0C674}%ifname%%{F-} %essid% %local_ip%";
    };
    "module/eth" = {
      "inherit" = "network-base";
      interface-type = "wired";
      label-connected = "%{F#F0C674}%ifname%%{F-} %local_ip%";
    };
    "module/spotify" = {
      type = "custom/script";
      tail = true;
      interval = 1;

      format-prefix = "Playing ";
      format-prefix-font = 2;
      format-prefix-foreground = "\${colors.primary}";
      format = "<label>";

      label-font = 2;

      exec = "~/.config/polybar/spotify/bin/get_spotify_status.sh";
    };
  };
}

#    [module/pulseaudio]
#    type = internal/pulseaudio
#
#    format-volume-prefix = "VOL "
#    format-volume-prefix-foreground = ${colors.primary}
#    format-volume = <label-volume>
#
#    label-volume = %percentage%%
#
#    label-muted = muted
#    label-muted-foreground = ${colors.disabled}
