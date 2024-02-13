{ pkgs, config, extra, ... }:

{
  imports = [
    ../dunst
    ../rofi
    ../swaylock.nix
    ../waybar
    ../wlogout
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    settings = import ./settings.nix;
    plugins = [
      extra.hyprland.plugins.hycov
    ];
  };

  home.packages = with pkgs; [
    # applets
    networkmanagerapplet
    pasystray
    udiskie

    # icons
    flat-remix-icon-theme
    numix-icon-theme
    qogir-icon-theme

    # screenshots
    grim
    slurp
    swappy
    wl-clipboard

    # screen sharing
    pipewire
    wireplumber

    # wallpaper
    swww

    # A tool for reading key codes
    # wev
  ];
}
