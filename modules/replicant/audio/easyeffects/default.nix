{ config, lib, pkgs, username, ... }:

with lib; let
  cfg = config.replicant.audio.easyeffects;

  # workaround for RNNoise 0.2 being bad
  easyeffects = pkgs.easyeffects.override {
    rnnoise = pkgs.stdenv.mkDerivation (rec {
      pname = "rnnoise";
      version = "2021-01-22";

      src = pkgs.fetchFromGitHub {
        owner = "xiph";
        repo = "rnnoise";
        rev = "1cbdbcf1283499bbb2230a6b0f126eb9b236defd";
        sha256 = "1y0rzgmvy8bf9a431garpm2w177s6ajgf79y5ymw4yb0pik57rwb";
      };

      nativeBuildInputs = [ pkgs.autoreconfHook ];

      postInstall = ''
        install -Dt $out/bin examples/.libs/rnnoise_demo
      '';

      meta = with lib; {
        description = "Recurrent neural network for audio noise reduction";
        homepage = "https://people.xiph.org/~jm/demo/rnnoise/";
        license = licenses.bsd3;
        maintainers = [ maintainers.nh2 ];
        mainProgram = "rnnoise_demo";
        platforms = platforms.all;
      };
    });
  };
in {
  options.replicant.audio.easyeffects = {
    enable = mkEnableOption "Enable EasyEffects";
  };

  config = mkIf cfg.enable {
    home-manager.users.${username} = {
      imports = [ ./dconf.nix ];
      services.easyeffects.enable = true;
      services.easyeffects.package = easyeffects;
    };
  };
}
