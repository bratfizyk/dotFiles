{ pkgs, config, extra, ... }:

{
  imports = [
    ../rofi
    ../swaylock.nix
    ../waybar
    ../wlogout
  ];

  services.mako = {
    enable = true;
    icons = true;
    borderSize = 3;
    borderRadius = 5;
    defaultTimeout = 3000;
  };

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
    blueberry
    
    # file explorer
    nemo-with-extensions

    # calculator
    qalculate-gtk

    # icons
    flat-remix-icon-theme
    numix-icon-theme
    #vimix-icon-theme
    #kora-icon-theme

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
