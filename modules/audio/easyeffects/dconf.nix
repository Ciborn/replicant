# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{ lib, ... }:

with lib.hm.gvariant;

{
  dconf.settings = {
    "com/github/wwmm/easyeffects" = {
      bypass = false;
      last-used-input-preset = "Pr\233r\233glages";
      last-used-output-preset = "Pr\233r\233glages";
    };

    "com/github/wwmm/easyeffects/streaminputs" = {
      blocklist = [];
      input-device = "alsa_input.usb-C-Media_Electronics_Inc._JBL_Quantum_Stream-00.mono-fallback";
      plugins = [ "rnnoise#0" ];
      use-default-input-device = true;
    };

    "com/github/wwmm/easyeffects/streaminputs/delay/0" = {
      time-l = 1000.0;
      time-r = 1000.0;
    };

    "com/github/wwmm/easyeffects/streaminputs/equalizer/0" = {
      bypass = true;
    };

    "com/github/wwmm/easyeffects/streaminputs/rnnoise/0" = {
      bypass = false;
      enable-vad = true;
      vad-thres = 50.0;
    };

    "com/github/wwmm/easyeffects/streamoutputs" = {
      output-device = "alsa_output.pci-0000_00_1f.3.analog-stereo";
      plugins = [ "equalizer#0" ];
      use-default-output-device = true;
    };

    "com/github/wwmm/easyeffects/streamoutputs/equalizer/0" = {
      balance = 0.0;
      bypass = false;
      input-gain = 0.0;
      num-bands = 10;
    };

    "com/github/wwmm/easyeffects/streamoutputs/equalizer/0/leftchannel" = {
      band0-frequency = 45.0;
      band0-gain = -5.199999809265137;
      band0-mode = "APO (DR)";
      band0-q = 0.20000000298023224;
      band0-type = "Bell";
      band1-frequency = 75.0;
      band1-gain = 2.0;
      band1-mode = "APO (DR)";
      band1-q = 1.399999976158142;
      band1-type = "Bell";
      band10-type = "Off";
      band11-type = "Off";
      band12-type = "Off";
      band13-type = "Off";
      band14-type = "Off";
      band15-type = "Off";
      band16-type = "Off";
      band17-type = "Off";
      band18-type = "Off";
      band19-type = "Off";
      band2-frequency = 105.0;
      band2-gain = 7.5;
      band2-mode = "APO (DR)";
      band2-q = 0.7099999785423279;
      band2-type = "Lo-shelf";
      band20-type = "Off";
      band21-type = "Off";
      band22-type = "Off";
      band23-type = "Off";
      band24-type = "Off";
      band25-type = "Off";
      band26-type = "Off";
      band27-type = "Off";
      band28-type = "Off";
      band29-type = "Off";
      band3-frequency = 210.0;
      band3-gain = 4.0;
      band3-mode = "APO (DR)";
      band3-q = 1.399999976158142;
      band3-type = "Bell";
      band30-type = "Off";
      band31-type = "Off";
      band4-frequency = 2400.0;
      band4-gain = -2.299999952316284;
      band4-mode = "APO (DR)";
      band4-q = 3.5;
      band4-type = "Bell";
      band5-frequency = 3800.0;
      band5-gain = 3.0;
      band5-mode = "APO (DR)";
      band5-q = 1.0;
      band5-type = "Bell";
      band6-frequency = 4200.0;
      band6-gain = -1.2999999523162842;
      band6-mode = "APO (DR)";
      band6-q = 4.0;
      band6-type = "Bell";
      band7-frequency = 6400.0;
      band7-gain = -6.199999809265137;
      band7-mode = "APO (DR)";
      band7-q = 4.0;
      band7-type = "Bell";
      band8-frequency = 8400.0;
      band8-gain = -1.399999976158142;
      band8-mode = "APO (DR)";
      band8-q = 4.0;
      band8-type = "Bell";
      band9-frequency = 10000.0;
      band9-gain = -4.0;
      band9-mode = "APO (DR)";
      band9-q = 0.7099999785423279;
      band9-type = "Hi-shelf";
    };

    "com/github/wwmm/easyeffects/streamoutputs/equalizer/0/rightchannel" = {
      band0-frequency = 45.0;
      band0-gain = -5.199999809265137;
      band0-mode = "APO (DR)";
      band0-q = 0.20000000298023224;
      band0-type = "Bell";
      band0-width = 4.0;
      band1-frequency = 75.0;
      band1-gain = 2.0;
      band1-mode = "APO (DR)";
      band1-q = 1.399999976158142;
      band1-type = "Bell";
      band1-width = 4.0;
      band10-type = "Off";
      band10-width = 4.0;
      band11-type = "Off";
      band11-width = 4.0;
      band12-type = "Off";
      band12-width = 4.0;
      band13-type = "Off";
      band13-width = 4.0;
      band14-type = "Off";
      band14-width = 4.0;
      band15-type = "Off";
      band15-width = 4.0;
      band16-type = "Off";
      band16-width = 4.0;
      band17-type = "Off";
      band17-width = 4.0;
      band18-type = "Off";
      band18-width = 4.0;
      band19-type = "Off";
      band19-width = 4.0;
      band2-frequency = 105.0;
      band2-gain = 7.5;
      band2-mode = "APO (DR)";
      band2-q = 0.7099999785423279;
      band2-type = "Lo-shelf";
      band2-width = 4.0;
      band20-type = "Off";
      band20-width = 4.0;
      band21-type = "Off";
      band21-width = 4.0;
      band22-type = "Off";
      band22-width = 4.0;
      band23-type = "Off";
      band23-width = 4.0;
      band24-type = "Off";
      band24-width = 4.0;
      band25-type = "Off";
      band25-width = 4.0;
      band26-type = "Off";
      band26-width = 4.0;
      band27-type = "Off";
      band27-width = 4.0;
      band28-type = "Off";
      band28-width = 4.0;
      band29-type = "Off";
      band29-width = 4.0;
      band3-frequency = 210.0;
      band3-gain = 4.0;
      band3-mode = "APO (DR)";
      band3-q = 1.399999976158142;
      band3-type = "Bell";
      band3-width = 4.0;
      band30-type = "Off";
      band30-width = 4.0;
      band31-type = "Off";
      band31-width = 4.0;
      band4-frequency = 2400.0;
      band4-gain = -2.299999952316284;
      band4-mode = "APO (DR)";
      band4-q = 3.5;
      band4-type = "Bell";
      band4-width = 4.0;
      band5-frequency = 3800.0;
      band5-gain = 3.0;
      band5-mode = "APO (DR)";
      band5-q = 1.0;
      band5-type = "Bell";
      band5-width = 4.0;
      band6-frequency = 4200.0;
      band6-gain = -1.2999999523162842;
      band6-mode = "APO (DR)";
      band6-q = 4.0;
      band6-type = "Bell";
      band6-width = 4.0;
      band7-frequency = 6400.0;
      band7-gain = -6.199999809265137;
      band7-mode = "APO (DR)";
      band7-q = 4.0;
      band7-type = "Bell";
      band7-width = 4.0;
      band8-frequency = 8400.0;
      band8-gain = -1.399999976158142;
      band8-mode = "APO (DR)";
      band8-q = 4.0;
      band8-type = "Bell";
      band8-width = 4.0;
      band9-frequency = 10000.0;
      band9-gain = -4.0;
      band9-mode = "APO (DR)";
      band9-q = 0.7099999785423279;
      band9-type = "Hi-shelf";
      band9-width = 4.0;
    };

  };
}
