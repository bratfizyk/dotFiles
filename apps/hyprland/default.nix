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
    flat-remix-icon-theme
    networkmanagerapplet
    numix-icon-theme
    pasystray
    qogir-icon-theme
    udiskie
  ];
}
