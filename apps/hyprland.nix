{ pkgs, ... }:

{
  programs.waybar = {
    enable = true;
  };

  wayland.windowManager.hyprland = {
    enable = true;
    enableNvidiaPatches = true;
    xwayland.enable = true;
    settings = {
      "$mod" = "SUPER";
      bind = [
        "$mod, M, exit,"
        "$mod, C, killactive,"
        "$mod, S, exec, rofi -show drun -show-icons"
        "$mod, Return, exec, alacritty"
      ];
      exec-once = [
        "waybar &"
      ];
    };
    extraConfig = ''
      monitor=eDP, 1920x1200, 0x0, 1
      monitor=HDMI-1-0, 1920x1200, 1920x0, 1
    '';
  };
}