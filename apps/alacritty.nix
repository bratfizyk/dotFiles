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
          padding = { x = 10; y = 10; };
        };

        # font = {
        #   normal.family = "Meslo LGS NF";
        #   size = 12;
        # };

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
