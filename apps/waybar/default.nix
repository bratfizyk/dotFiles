{ pkgs, config, ... }:

{
    imports = [
    ../wlogout
  ];

  programs.waybar = {
    enable = true;
    style = (import ./style.nix).style;
    settings = import ./settings.nix;
  };

  home.packages = with pkgs; [
    pavucontrol
  ];
}