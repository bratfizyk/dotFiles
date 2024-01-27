{ pkgs, config, ... }:

{
  imports = [
    ../dunst
    ../rofi
    ../waybar
    ../wlogout
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    enableNvidiaPatches = true;
    xwayland.enable = true;
    settings = import ./settings.nix;
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
