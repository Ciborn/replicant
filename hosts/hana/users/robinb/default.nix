{ pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.robinb = {
    isNormalUser = true;
    description = "Robin Bourachot";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [ ];
  };

  home-manager.users.robinb = {
    home.stateVersion = "23.05";

    programs.git = import ./programs/git.nix;
    programs.vscode = import ./programs/vscode.nix { inherit pkgs; };

    services.polybar = import ./services/polybar.nix;
  };
}
