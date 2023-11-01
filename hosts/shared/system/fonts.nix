{ config, lib, pkgs, ... }:

{
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      #font-awesome_4
      comic-mono
      corefonts # Microsoft free fonts
      dejavu_fonts
      fira
      fira-mono
      lexend
      line-awesome
      google-fonts
      libertine
      mononoki
      nerdfonts
      open-sans
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
      antialias = true;
      cache32Bit = true;
      hinting.enable = true;
      hinting.autohint = true;
      defaultFonts = {
        monospace = [ "Comic Mono Normal" ];
        sansSerif = [ "Open Sans" ];
        serif = [ "Source Serif Pro" ];
      };
    };
  };
}
