{ pkgs, config, ... }:

{
  programs.ags = {
    enable = true;
    configDir = ./config;
  };
}
