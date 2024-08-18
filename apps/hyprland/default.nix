{ pkgs, config, extra, ... }:

{
  imports = [
    ../ags
    ../swaylock.nix
    ../wlogout
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    settings = import ./settings.nix;
    plugins = with pkgs; [ ];
  };

  home.packages = with pkgs; [
    # applets
    networkmanagerapplet
    pasystray
    udiskie

    # file explorer
    nemo

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

    # night vision (blue filter)
    wl-gammarelay-rs

    # A tool for reading key codes
    wev
  ];
}
