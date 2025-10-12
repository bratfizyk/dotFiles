{ pkgs, config, ... }:

{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi;
    theme = (import ./theme.nix { inherit pkgs; inherit config; }).theme;
  };
}
