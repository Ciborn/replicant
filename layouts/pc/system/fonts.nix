{ config, lib, pkgs, ... }:

{
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      comic-mono
      corefonts # Microsoft free fonts
      dejavu_fonts
      lexend
      line-awesome
      google-fonts
      libertine
      mononoki
      nerdfonts
      noto-fonts
      oxygenfonts
      powerline-fonts
      source-code-pro
      source-sans-pro
      source-serif-pro
      ttf_bitstream_vera
      ubuntu_font_family # Ubuntu fonts
      unifont # some international languages
    ];
    fontconfig = {
      defaultFonts = {
        monospace = [ "Comic Mono Normal" ];
        sansSerif = [ "Ubuntu" ];
        serif = [ "Source Serif Pro" ];
      };
    };
  };
}
