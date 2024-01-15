{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    meslo-lgs-nf
  ];

  programs = {
    alacritty = {
      enable = true;
      settings = {
        window = {
          startup_mode = "Maximized";
          opacity = 0.8;
          padding = { x = 10; y = 10; };
          #decorations = "None";
        };

        font = {
          normal.family = "Meslo LGS NF";
          size = 12;
        };

        scrolling = {
          history = 10000;
          autoscroll = false;
        };

        selection = {
          save_to_clipboard = true;
        };

        colors = {
          primary = {
            foreground = "#839496";
            background = "#002b36";
            draw_bold_text_with_bright_colors = true;
          };

          cursor = {
            text   = "#002b36";
            cursor = "#839496";
          };

          normal = {
            black   = "#073642";
            red     = "#dc322f";
            green   = "#859900";
            yellow  = "#b58900";
            blue    = "#268bd2";
            magenta = "#d33682";
            cyan    = "#2aa198";
            white   = "#eee8d5";
          };

          # bright = {
          #   black   = "#002b36";
          #   red     = "#cb4b16";
          #   green   = "#586e75";
          #   yellow  = "#657b83";
          #   blue    = "#839496";
          #   magenta = "#6c71c4";
          #   cyan    = "#93a1a1";
          #   white   = "#fdf6e3";
          # };
        };
      };
    };
  };
}