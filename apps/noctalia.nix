{ pkgs, ... }:

{
  programs.noctalia = {
    enable = true;

    settings = {
      bar = {
        order = [ "main" ];
        main = {
          enabled = true;
          position = "top";
          margin_ends = 0;
          start = [ "workspaces" ];
          center = [ "clock" ];
          end = [ "tray" "volume" "network" "battery" "bluetooth" ];
        };
      };
      widget = {
        clock = {
          format = "{:%H:%M · %a, %d %b}";
        };
      };
    };
  };
}