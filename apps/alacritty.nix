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
          decorations = "None";
          decorations_theme_variant = "Dark";
          padding = { x = 16; y = 14; };
          dynamic_padding = true;
        };

        cursor = {
          style = {
            shape = "Beam";
            blinking = "On";
          };
        };

        scrolling = {
          history = 10000;
        };

        selection = {
          save_to_clipboard = true;
        };
      };
    };
  };
}
