{ pkgs }

{
  environment.systemPackages = with pkgs; [
    awesome
    os-prober
    polybar
  ];
}
