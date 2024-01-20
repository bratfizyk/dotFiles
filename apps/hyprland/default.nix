{ pkgs, config, ... }:

{
  imports = [
    ../dunst
    ../waybar
    ../wlogout
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    enableNvidiaPatches = true;
    xwayland.enable = true;
    settings = import ./settings.nix;
  };
}
