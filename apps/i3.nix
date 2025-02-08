{ pkgs, ... }:

let
  mod = "Mod4";
in
{
  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3-gaps;
    config = {
      terminal = "alacritty";
      menu = "rofi -show drun -me-select-entry '' -me-accept-entry MousePrimary";   
      gaps = {
        outer = 10;
        inner = 5;
        smartGaps = true;
      };

      startup = [
        {
          command = "xrandr --output HDMI-1-0 --auto --right-of eDP --mode 1920x1200";
          always = false;
          notification = false;
        }
      ];

      keybindings = {
        "${mod}+Shift+r" = "restart";
        "${mod}+Shift+e" = "exit";
        "${mod}+Shift+q" = "kill";

        "${mod}+Return" = "exec alacritty";
        "${mod}+d" = "exec rofi -show drun -me-select-entry '' -me-accept-entry MousePrimary";
      };
    };
  };

}
