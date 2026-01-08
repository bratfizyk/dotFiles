{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    meslo-lgs-nf
  ];

  programs.ghostty = {
    enable = true;

    # Ghostty uses a key/value config; this generates ~/.config/ghostty/config
    settings = {
      # Similar to "Maximized" startup: start tiled but taking full space
      window-decoration = "client";     # Keep Hyprland decorations minimal
      window-padding-x = 10;
      window-padding-y = 10;

      # Font; comment out if you want to keep Ghostty defaults
      font-family = "MesloLGS NF";
      font-size = 12;

      # Scrollback
      scrollback-limit = 50000000;

      # Selection / clipboard behavior
      copy-on-select = true;
    };
  };
}

