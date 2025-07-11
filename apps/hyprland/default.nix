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
    settings = {
      border-size = 3;
      border-radius = 5;
      default-timeout = 3000;
      icons = true;
    };
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
