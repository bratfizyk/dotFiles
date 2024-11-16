{ pkgs, config, ... }:

{
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
    #theme = (import ./theme.nix { inherit pkgs; inherit config; }).theme;
  };
}
