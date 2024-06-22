{ pkgs, config, ... }:

{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
 #   theme = ./theme.rafi;
  };

  home.packages = with pkgs; [
    montserrat
  ];
}
