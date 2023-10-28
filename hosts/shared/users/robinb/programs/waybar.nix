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
        format = "<big>{:%H:%M}</big>\n<small>{:%A, %d\/%m\/%Y}</small>";
      };
    };
  };
  style = ''
    * {
      color: white;
    }

    window#waybar {
      background: transparent;
    }

    #clock {
      color: blue;
    }
  '';
  systemd.enable = true;
}
