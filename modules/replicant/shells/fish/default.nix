{ buildFishPlugin, config, pkgs, lib, username, ... }:

with lib; let
  cfg = config.replicant.shells.fish;
in {
  options.replicant.shells.fish = {
    enable = mkEnableOption "Enable fish";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [
      (pkgs.fishPlugins.buildFishPlugin rec {
        pname = "omf-robbyrussell";
        version = "93944745b7a2ede0be548e0c8fc160d7f2cc6af7";

        src = pkgs.fetchFromGitHub {
          owner = "oh-my-fish";
          repo = "theme-robbyrussell";
          rev = version;
          sha256 = "sha256-l/fctaS58IZKM5/MsYC+WQZ0GWZGZ6SWT+bA5QoODbU=";
        };

        patches = [
          (pkgs.writeText "fix-rr-theme.patch" ''
            diff --git a/functions/fish_prompt.fish b/functions/fish_prompt.fish
            index 157a316..296031a 100644
            --- a/functions/fish_prompt.fish
            +++ b/functions/fish_prompt.fish
            @@ -33 +33 @@ function fish_prompt
            -  set -l cwd $cyan(basename (prompt_pwd))
            +  set -l cwd $cyan(prompt_pwd)
          '')
        ];
      })
    ];

    programs.fish = {
      enable = true;

      interactiveShellInit = ''
        set fish_greeting
        set fish_prompt_pwd_dir_length 0
      '';
    };

    users.defaultUserShell = pkgs.fish;
  };
}
