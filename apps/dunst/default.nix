{ pkgs, config, ... }:

{
  services.dunst = {
    enable = true;
    package = pkgs.dunst;
    configFile = ./dunstrc;
  };

  home.packages = with pkgs; [
    hicolor-icon-theme
  ];
}