{ pkgs, config, extra, ... }:

{
  imports = [
    ../rofi
    ../swaylock.nix
    ../waybar
    ../wlogout
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    settings = import ./settings.nix;
    plugins = [ ];
  };

  home.packages = with pkgs; [
    # applets
    networkmanagerapplet
    pasystray
    udiskie

    # file explorer
    pcmanfm

    # calculator
    qalculate-gtk

    # icons
    flat-remix-icon-theme
    numix-icon-theme
    qogir-icon-theme
    kora-icon-theme

    # screenshots
    grim
    slurp
    swappy
    wl-clipboard

    # screen sharing
    pipewire
    wireplumber

    # wallpaper
    swaybg

    # notifications
    swaynotificationcenter

    #
    wl-gammarelay-rs

    # A tool for reading key codes
    wev
  ];
}
