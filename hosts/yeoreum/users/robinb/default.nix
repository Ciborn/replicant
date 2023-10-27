{ ... }:

{
  home-manager.users.robinb = {
    programs.waybar = import ./programs/waybar.nix;

    wayland.windowManager.hyprland = import ./programs/hyprland.nix;
  };
}
