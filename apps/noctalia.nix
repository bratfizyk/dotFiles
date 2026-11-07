{ ... }:

{
  programs.noctalia = {
    enable = true;

    settings = {
      # Dark theme
      theme = {
        mode = "dark";
        shell_mode = "dark";
        builtin = "Catppuccin";
      };

      # Glass appearance for floating panels
      shell = {
        corner_radius_scale = 1.2;

        button_borders = true;
        input_borders = true;
        popup_borders = true;
        card_borders = true;

        panel = {
          transparency_mode = "glass";
          borders = true;
          border_color = "outline_variant";
          border_width = 1.0;
          shadow = true;
        };

        shadow = {
          direction = "down";
          alpha = 0.45;
        };
      };

      bar = {
        order = [ "main" ];
        main = {
          enabled = true;
          position = "top";
          
          # Floating dimensions
          thickness = 40;
          margin_ends = 0;
          margin_edge = 6;

          # Glass effect
          background_opacity = 0.78;
          compositor_blur = true;

          # Rounded appearance
          radius = 14;
          border = "outline_variant";
          border_width = 1.0;
          shadow = true;

          # Spacing
          padding = 12;
          widget_spacing = 8;

          scale = 1.0;
          font_scale = 0.95;

          start = [ "workspaces" ];
          center = [ "clock" "control-center" ];
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
