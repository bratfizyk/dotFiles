{ pkgs, config, ... }:

{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    theme = (import ./theme.nix { inherit pkgs; inherit config; }).theme;
  };
}
