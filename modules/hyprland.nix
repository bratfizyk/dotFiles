{ config, pkgs, extra, ... }:

{
  programs.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    xwayland = {
      enable  = true;
    };
  };

  environment.systemPackages = with pkgs; [
    hyprpolkitagent
    extra.hyprland-qtutils
  ];

  # for mounting USB drives
  services = {
    gvfs.enable = true;
    udisks2.enable = true;
  };

  fonts = {
    fontDir.enable = true;
    packages = with pkgs; [
      meslo-lgs-nf
      font-awesome
      nerd-fonts.terminess-ttf
    ];
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      #xdg-desktop-portal-gtk
      xdg-desktop-portal-wlr
    ];
  };

  security.pam.services.swaylock.fprintAuth = false;
}
