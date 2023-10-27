{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    waybar
    wlr-randr
  ];
}
