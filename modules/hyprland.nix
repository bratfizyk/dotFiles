{ config, pkgs, ... }:

# Just a stub for now
{
  programs.hyprland = {
    enable = true;
    xwayland = {
      enable  = true;
    };
  };

  fonts.fontDir.enable = true;
  fonts.packages = with pkgs; [
    meslo-lgs-nf
  ];
}