{ ... }:

{
  home-manager.users.robinb = {
    home.stateVersion = "23.05";

    programs.git = import ./programs/git.nix;
  };
}
