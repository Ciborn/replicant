{
  imports = [
    ./system/boot.nix
    ./system/fonts.nix
    ./system/packages.nix
    ./users/robinb
  ];

  hardware.i2c.enable = true;
}
