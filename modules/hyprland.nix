{ config, pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
    enableNvidiaPatches = true;
    xwayland = {
      enable  = true;
    };
  };

  fonts.fontDir.enable = true;
  fonts.packages = with pkgs; [
    meslo-lgs-nf
  ];

  environment.systemPackages = with pkgs; [
    rofi-wayland
  ];
}