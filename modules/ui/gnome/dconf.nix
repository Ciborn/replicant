# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{ lib, ... }:

with lib.hm.gvariant;

{
  dconf.settings = {
    "apps/seahorse/listing" = {
      keyrings-selected = [ "openssh:///home/robinb/.ssh" ];
    };

    "apps/seahorse/windows/key-manager" = {
      height = 476;
      width = 935;
    };

    "com/github/GradienceTeam/Gradience" = {
      enabled-plugins = [ "firefox_gnome_theme" ];
      first-run = false;
      last-opened-version = "0.4.1";
      window-fullscreen = false;
      window-height = 700;
      window-maximized = false;
      window-width = 1000;
    };

    "org/gnome/Console" = {
      last-window-size = mkTuple [ 1148 505 ];
      theme = "auto";
    };

    "org/gnome/Totem" = {
      active-plugins = [ "vimeo" "variable-rate" "skipto" "screenshot" "screensaver" "save-file" "rotation" "recent" "movie-properties" "open-directory" "mpris" "autoload-subtitles" "apple-trailers" ];
      subtitle-encoding = "UTF-8";
    };

    "org/gnome/calculator" = {
      accuracy = 9;
      angle-units = "degrees";
      base = 10;
      button-mode = "basic";
      number-format = "automatic";
      show-thousands = false;
      show-zeroes = false;
      source-currency = "";
      source-units = "degree";
      target-currency = "";
      target-units = "radian";
      word-size = 64;
    };

    "org/gnome/desktop/app-folders" = {
      folder-children = [ "Utilities" "YaST" ];
    };

    "org/gnome/desktop/app-folders/folders/Utilities" = {
      apps = [ "gnome-abrt.desktop" "gnome-system-log.desktop" "nm-connection-editor.desktop" "org.gnome.baobab.desktop" "org.gnome.Connections.desktop" "org.gnome.DejaDup.desktop" "org.gnome.Dictionary.desktop" "org.gnome.DiskUtility.desktop" "org.gnome.eog.desktop" "org.gnome.Evince.desktop" "org.gnome.FileRoller.desktop" "org.gnome.fonts.desktop" "org.gnome.seahorse.Application.desktop" "org.gnome.tweaks.desktop" "org.gnome.Usage.desktop" "vinagre.desktop" ];
      categories = [ "X-GNOME-Utilities" ];
      name = "X-GNOME-Utilities.directory";
      translate = true;
    };

    "org/gnome/desktop/app-folders/folders/YaST" = {
      categories = [ "X-SuSE-YaST" ];
      name = "suse-yast.directory";
      translate = true;
    };

    "org/gnome/desktop/background" = {
      color-shading-type = "solid";
      picture-options = "zoom";
      picture-uri = "file:///run/current-system/sw/share/backgrounds/gnome/blobs-l.svg";
      picture-uri-dark = "file:///run/current-system/sw/share/backgrounds/gnome/blobs-d.svg";
      primary-color = "#241f31";
      secondary-color = "#000000";
    };

    "org/gnome/desktop/calendar" = {
      show-weekdate = true;
    };

    "org/gnome/desktop/input-sources" = {
      sources = [ (mkTuple [ "xkb" "fr" ]) ];
      xkb-options = [ "terminate:ctrl_alt_bksp" ];
    };

    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      document-font-name = "Noto Sans 10";
      font-antialiasing = "rgba";
      font-hinting = "full";
      font-name = "Noto Sans 10";
      monospace-font-name = "Comic Mono 10";
      show-battery-percentage = true;
      text-scaling-factor = 1.0;
      toolkit-accessibility = false;
    };

    "org/gnome/desktop/notifications" = {
      application-children = [ "org-gnome-settings" "discord" "firefox" "gnome-power-panel" "spotify" "org-gnome-shell-extensions" "org-gnome-console" ];
    };

    "org/gnome/desktop/notifications/application/discord" = {
      application-id = "discord.desktop";
    };

    "org/gnome/desktop/notifications/application/firefox" = {
      application-id = "firefox.desktop";
    };

    "org/gnome/desktop/notifications/application/gnome-power-panel" = {
      application-id = "gnome-power-panel.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-console" = {
      application-id = "org.gnome.Console.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-settings" = {
      application-id = "org.gnome.Settings.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-shell-extensions" = {
      application-id = "org.gnome.Shell.Extensions.desktop";
    };

    "org/gnome/desktop/notifications/application/org-qbittorrent-qbittorrent" = {
      application-id = "org.qbittorrent.qBittorrent.desktop";
    };

    "org/gnome/desktop/notifications/application/spotify" = {
      application-id = "spotify.desktop";
    };

    "org/gnome/desktop/peripherals/keyboard" = {
      numlock-state = true;
    };

    "org/gnome/desktop/peripherals/mouse" = {
      natural-scroll = false;
    };

    "org/gnome/desktop/peripherals/touchpad" = {
      tap-to-click = true;
      two-finger-scrolling-enabled = true;
    };

    "org/gnome/desktop/privacy" = {
      old-files-age = mkUint32 30;
      recent-files-max-age = -1;
    };

    "org/gnome/desktop/screensaver" = {
      color-shading-type = "solid";
      picture-options = "zoom";
      picture-uri = "file:///run/current-system/sw/share/backgrounds/gnome/blobs-l.svg";
      primary-color = "#241f31";
      secondary-color = "#000000";
    };

    "org/gnome/desktop/session" = {
      idle-delay = mkUint32 300;
    };

    "org/gnome/desktop/wm/preferences" = {
      button-layout = "appmenu:minimize,maximize,close";
      titlebar-font = "Noto Sans Bold 11";
    };

    "org/gnome/evolution-data-server" = {
      migrated = true;
    };

    "org/gnome/file-roller/listing" = {
      list-mode = "as-folder";
      name-column-width = 250;
      show-path = false;
      sort-method = "name";
      sort-type = "ascending";
    };

    "org/gnome/file-roller/ui" = {
      sidebar-width = 200;
      window-height = 480;
      window-width = 600;
    };

    "org/gnome/gnome-system-monitor" = {
      current-tab = "processes";
      maximized = false;
      network-total-in-bits = false;
      show-dependencies = false;
      show-whose-processes = "user";
      window-state = mkTuple [ 1082 625 ];
    };

    "org/gnome/gnome-system-monitor/disktreenew" = {
      col-6-visible = true;
      col-6-width = 0;
    };

    "org/gnome/gnome-system-monitor/proctree" = {
      columns-order = [ 0 1 2 3 4 6 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 ];
      sort-col = 15;
      sort-order = 0;
    };

    "org/gnome/nautilus/preferences" = {
      default-folder-viewer = "icon-view";
      migrated-gtk-settings = true;
      search-filter-time-type = "last_modified";
    };

    "org/gnome/nautilus/window-state" = {
      initial-size = mkTuple [ 1099 550 ];
    };

    "org/gnome/nm-applet/eap/246b0aef-a10f-4562-aa07-f5ed3e7b47f0" = {
      ignore-ca-cert = false;
      ignore-phase2-ca-cert = false;
    };

    "org/gnome/nm-applet/eap/8c26329a-7ba1-450e-9599-96a9d4fe9d57" = {
      ignore-ca-cert = false;
      ignore-phase2-ca-cert = false;
    };

    "org/gnome/settings-daemon/plugins/color" = {
      night-light-enabled = true;
      night-light-temperature = mkUint32 3700;
    };

    "org/gnome/shell" = {
      command-history = [ "r" ];
      disable-user-extensions = false;
      disabled-extensions = [ "places-menu@gnome-shell-extensions.gcampax.github.com" ];
      enabled-extensions = [ "dash-to-panel@jderose9.github.com" ];
      favorite-apps = [ "firefox.desktop" "discord.desktop" "spotify.desktop" ];
      last-selected-power-profile = "power-saver";
      welcome-dialog-last-shown-version = "44.5";
    };

    "org/gnome/shell/extensions/dash-to-panel" = {
      animate-appicon-hover = false;
      animate-appicon-hover-animation-extent = "{'RIPPLE': 4, 'PLANK': 4, 'SIMPLE': 1}";
      appicon-margin = 2;
      appicon-padding = 6;
      available-monitors = [ 1 0 ];
      dot-color-1 = "#b27070";
      dot-color-2 = "#b27070";
      dot-color-3 = "#b27070";
      dot-color-4 = "#b27070";
      dot-color-dominant = false;
      dot-color-override = true;
      dot-position = "BOTTOM";
      dot-size = 1;
      dot-style-focused = "SEGMENTED";
      focus-highlight-color = "#ffffff";
      focus-highlight-dominant = true;
      focus-highlight-opacity = 10;
      group-apps = false;
      group-apps-label-font-color = "#ffffff";
      group-apps-label-font-color-minimized = "#ffffff";
      group-apps-label-font-size = 13;
      group-apps-label-font-weight = "lighter";
      group-apps-label-max-width = 190;
      group-apps-use-fixed-width = true;
      group-apps-use-launchers = false;
      hide-overview-on-startup = false;
      hotkeys-overlay-combo = "TEMPORARILY";
      intellihide = false;
      intellihide-hide-from-windows = false;
      intellihide-show-in-fullscreen = false;
      intellihide-use-pressure = false;
      isolate-monitors = false;
      isolate-workspaces = false;
      leftbox-padding = -1;
      leftbox-size = 13;
      panel-anchors = ''
        {"0":"MIDDLE","1":"MIDDLE"}
      '';
      panel-element-positions = ''
        {"0":[{"element":"showAppsButton","visible":true,"position":"stackedTL"},{"element":"activitiesButton","visible":false,"position":"stackedTL"},{"element":"leftBox","visible":false,"position":"stackedTL"},{"element":"taskbar","visible":true,"position":"stackedTL"},{"element":"centerBox","visible":true,"position":"stackedBR"},{"element":"rightBox","visible":true,"position":"stackedBR"},{"element":"dateMenu","visible":true,"position":"stackedBR"},{"element":"systemMenu","visible":true,"position":"stackedBR"},{"element":"desktopButton","visible":true,"position":"stackedBR"}],"1":[{"element":"showAppsButton","visible":true,"position":"stackedTL"},{"element":"activitiesButton","visible":false,"position":"stackedTL"},{"element":"leftBox","visible":false,"position":"stackedTL"},{"element":"taskbar","visible":true,"position":"stackedTL"},{"element":"centerBox","visible":true,"position":"stackedBR"},{"element":"rightBox","visible":true,"position":"stackedBR"},{"element":"dateMenu","visible":true,"position":"stackedBR"},{"element":"systemMenu","visible":true,"position":"stackedBR"},{"element":"desktopButton","visible":true,"position":"stackedBR"}]}
      '';
      panel-element-positions-monitors-sync = true;
      panel-lengths = ''
        {"0":100,"1":100}
      '';
      panel-positions = ''
        {"0":"BOTTOM"}
      '';
      panel-sizes = ''
        {"0":40,"1":40}
      '';
      primary-monitor = 1;
      show-appmenu = true;
      show-apps-icon-file = "";
      show-apps-icon-side-padding = 8;
      show-apps-override-escape = true;
      status-icon-padding = 4;
      trans-bg-color = "#0e0101";
      trans-dynamic-anim-target = 0.7;
      trans-gradient-bottom-color = "#561717";
      trans-gradient-bottom-opacity = 0.2;
      trans-gradient-top-color = "#851a1a";
      trans-gradient-top-opacity = 0.15;
      trans-panel-opacity = 0.0;
      trans-use-custom-bg = true;
      trans-use-custom-gradient = false;
      trans-use-custom-opacity = true;
      trans-use-dynamic-opacity = true;
      tray-padding = -1;
      tray-size = 13;
      window-preview-title-position = "TOP";
    };

    "org/gnome/shell/world-clocks" = {
      locations = "@av []";
    };

    "org/gnome/tweaks" = {
      show-extensions-notice = false;
    };

    "org/gtk/gtk4/settings/color-chooser" = {
      custom-colors = [ (mkTuple [ 0.7 0.441 ]) (mkTuple [ 0.321569 0.580392 ]) (mkTuple [ 5.4902e-2 3.922e-3 ]) ];
      selected-color = mkTuple [ true 0.7 ];
    };

    "org/gtk/gtk4/settings/file-chooser" = {
      date-format = "regular";
      location-mode = "path-bar";
      show-hidden = false;
      show-size-column = true;
      show-type-column = true;
      sidebar-width = 140;
      sort-column = "name";
      sort-directories-first = false;
      sort-order = "ascending";
      type-format = "category";
      view-type = "list";
      window-size = mkTuple [ 845 327 ];
    };

    "org/gtk/settings/file-chooser" = {
      date-format = "regular";
      location-mode = "path-bar";
      show-hidden = true;
      show-size-column = true;
      show-type-column = true;
      sidebar-width = 203;
      sort-column = "name";
      sort-directories-first = false;
      sort-order = "ascending";
      type-format = "category";
      window-position = mkTuple [ 678 218 ];
      window-size = mkTuple [ 1203 902 ];
    };
  };
}
