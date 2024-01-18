{ pkgs, config, ... }:

{
  programs.waybar = {
    enable = true;
    style = (import ./style.nix).style;
    settings = (import ./settings.nix {inherit config;}).settings;
  };
}