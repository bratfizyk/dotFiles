{ config, pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
    enableNvidiaPatches = true;
    xwayland = {
      enable  = true;
    };
  };

  programs.thunar = {
    enable = true;
  }; 

  fonts = {
    fontDir.enable = true;
    packages = with pkgs; [
      meslo-lgs-nf
      font-awesome
      terminus-nerdfont
    ];
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];
  };

  environment.systemPackages = with pkgs; [
    rofi-wayland
  ];
}