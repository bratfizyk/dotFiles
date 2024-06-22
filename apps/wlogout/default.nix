{ pkgs, config, ... }:

{
  programs.wlogout = {
    enable = true;
    layout = import ./layout.nix;
    style = (import ./style.nix { inherit pkgs; inherit config; }).style;
  };
}
