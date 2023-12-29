{ config, pkgs, lib, username, ... }:

with lib; let
  cfg = config.cibnix.shells.zsh;
in {
  options.cibnix.shells.zsh = {
    enable = mkEnableOption "Enable zsh";
  };

  config = mkIf cfg.enable {
    nixpkgs.overlays = [
      (final: prev: {
        oh-my-zsh = prev.oh-my-zsh.overrideAttrs (old: {
          patches = (old.patches or []) ++ [
            (pkgs.writeText "fix-rr-theme.patch" ''
              diff --git a/themes/robbyrussell.zsh-theme b/themes/robbyrussell.zsh-theme
              index 173e6d57..35ac104c 100644
              --- a/themes/robbyrussell.zsh-theme
              +++ b/themes/robbyrussell.zsh-theme
              @@ -1,1 +1,1 @@
              -PROMPT="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ ) %{$fg[cyan]%}%c%{$reset_color%}"
              +PROMPT="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ ) %{$fg[cyan]%}%~%{$reset_color%}"
            '')
          ];
        });
      })
    ];

    programs.zsh = {
      enable = true;
      ohMyZsh = {
          enable = true;
          plugins = [ "git" ];
          theme = "robbyrussell";
      };
    };

    users.defaultUserShell = pkgs.zsh;
  };
}
