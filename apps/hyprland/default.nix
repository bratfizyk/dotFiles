{ pkgs, ... }:

{
  imports = [
    ../noctalia.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    settings = import ./settings.nix;
    configType = "hyprlang";
    plugins = [ ];
  };

  programs.hyprlock = {
    enable = true;
    settings = import ./hyprlock.nix;
  };

  home = {
    packages = with pkgs; [
      # applets
      # networkmanagerapplet
      # pasystray
      udiskie
      
      # file explorer
      thunar

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
  };
}
