{ config, pkgs, ... }:

{
  services.xserver = {
    desktopManager.gnome.enable = true;
  };

  environment.gnome.excludePackages = (with pkgs; [
    atomix
    cheese
    gnome-characters
    gnome-music
    gnome-photos
    gnome-terminal
    gnome-tour
    geary
    gedit
    iagno
    epiphany
    hitori
    tali
    totem
  ]) ++ (with pkgs.gnome; [
  ]);
}
