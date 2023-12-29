{ lib, pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.robinb = {
    isNormalUser = true;
    description = "Robin Bourachot";
    extraGroups = [ "docker" "networkmanager" "wheel" ];
  };

  home-manager.useGlobalPkgs = true;

  home-manager.users.robinb = {
    home.stateVersion = "23.05";

    programs.git = import ./programs/git.nix;
    programs.vscode = import ./programs/vscode.nix { inherit pkgs; };
  };
}
