{ pkgs, config, lib, ... }:

{
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
    style = lib.mkDefault ./style.css;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        mod = "dock";
        exclusive = true;
        passthrough = false;
        gtk-layer-shell = true;
        height = 30;

        "modules-left" = [
          "hyprland/workspaces"
        ];
        "modules-center" = [
          "clock"
        ];

        "modules-right" = [
          "tray"
          "backlight"
          "pulseaudio"
          "battery"
        ];

        "hyprland/window" = {
          format = "{}";
        };

        tray = {
            "icon-size" = 15;
            "spacing" = 10;
        };

        clock = {
          "format" = "{:%a, %d-%b %H:%M}";
          "format-alt" = "{:%A, %B %d, %Y (%R)}";
          "tooltip-format"= "<tt><small>{calendar}</small></tt>";
          "calendar" = {
            "mode" = "year";
            "mode-mon-col" = 3;
            "weeks-pos" = "right";
            "on-scroll" = 1;
            "on-click-right" = "mode";
            "format" = {
              "months" = "<span color='#ffead3'><b>{}</b></span>";
              "days" = "<span color='#ecc6d9'><b>{}</b></span>";
              "weeks" = "<span color='#99ffdd'><b>W{}</b></span>";
              "weekdays" = "<span color='#ffcc66'><b>{}</b></span>";
              "today" = "<span color='#ff6699'><b><u>{}</u></b></span>";
            };
          };
          "actions" = {
            "on-click-right" = "mode";
            "on-click-forward" = "tz_up";
            "on-click-backward" = "tz_down";
            "on-scroll-up" = "shift_up";
            "on-scroll-down" = "shift_down";
          };
        };

        "backlight" = {
            "device" = "intel_backlight";
            "format" = "{icon} {percent}%";
            "format-icons" = ["󰃞" "󰃟" "󰃠"];
            "on-scroll-up" = "brightnessctl set 1%+";
            "on-scroll-down" = "brightnessctl set 1%-";
            "min-length" = 6;
        };

        "battery" = {
          "states" = {
              "good" = 95;
              "warning" = 30;
              "critical" = 20;
          };
          "format" = "{icon} {capacity}%";
          "format-charging" = " {capacity}%";
          "format-plugged" = " {capacity}%";
          "format-alt" = "{time} {icon}";
          "format-icons" = ["󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
        };

        "pulseaudio" = {
          "format" = "{icon} {volume}%";
          "tooltip" = false;
          "format-muted" = " Muted";
          "on-click" = "pamixer -t";
          "on-scroll-up" = "pamixer -i 5";
          "on-scroll-down" = "pamixer -d 5";
          "scroll-step" = 5;
          
          "format-icons" = {
            "headphone" = "";
            "hands-free" = "";
            "headset" = "";
            "phone" = "";
            "portable" = "";
            "car" = "";
            "default" = ["" "" ""];
          };
        };
      };
    };
  };
}
