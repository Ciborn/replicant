{ pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.robinb = {
    isNormalUser = true;
    description = "Robin Bourachot";
    extraGroups = [ "docker" "networkmanager" "wheel" ];
    packages = with pkgs; [ ];
  };

  home-manager.users.robinb = {
    home.stateVersion = "23.05";

    home.file.".config/awesome".source = ./services/awesome/config;
    home.file.".config/polybar/spotify" = {
      executable = true;
      source = pkgs.callPackage ../../../../pkgs/applications/polybar-spotify { };
    };

    programs.git = import ./programs/git.nix;
    programs.rofi = import ./programs/rofi.nix;
    programs.vscode = import ./programs/vscode.nix { inherit pkgs; };

    services.polybar = import ./services/polybar.nix;
  };
}
