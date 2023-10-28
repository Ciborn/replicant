{ lib, pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.robinb = {
    isNormalUser = true;
    description = "Robin Bourachot";
    extraGroups = [ "docker" "networkmanager" "wheel" ];
    packages = with pkgs; [ ];
  };

  home-manager.useGlobalPkgs = true;

  home-manager.users.robinb = {
    home.stateVersion = "23.05";

    programs.eww = import ./programs/eww { inherit pkgs; };
    programs.git = import ./programs/git.nix;
    programs.rofi = import ./programs/rofi.nix;
    programs.vscode = import ./programs/vscode.nix { inherit pkgs; };

    wayland.windowManager.hyprland = import ./programs/hyprland.nix { inherit lib; };
  };
}
