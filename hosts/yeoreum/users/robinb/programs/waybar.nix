{
  enable = true;
  settings = {
    bar = {
      layer = "top";
      position = "top";
      height = 30;

      modules-left = [];
      modules-center = [ "clock" ];
      modules-right = [];

      clock = {
        format = "{:%H:%M}";
      };
    };
  };
  systemd.enable = true;
}
