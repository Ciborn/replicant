# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{ lib, ... }:

with lib.hm.gvariant;

{
  dconf.settings = {
    "org/gnome/Ptyxis" = {
      default-profile-uuid = "94aa41af057350b03d99966266d4bae9";
      profile-uuids = [ "94aa41af057350b03d99966266d4bae9" "38e679fb6f7a6e7bcf96b4da66d4bb2a" ];
    };

    "org/gnome/Ptyxis/Profiles/38e679fb6f7a6e7bcf96b4da66d4bb2a" = {
      custom-command = "distrobox enter debian-toolbox-12";
      label = "Distrobox - Debian";
      use-custom-command = true;
    };

    "org/gnome/Ptyxis/Profiles/94aa41af057350b03d99966266d4bae9" = {
      label = "Profil principal";
    };
  };
}
