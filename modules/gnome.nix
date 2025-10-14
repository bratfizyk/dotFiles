{ config, pkgs, ... }:

{
  services = {
    desktopManager.gnome.enable = true;
  };

  environment.gnome.excludePackages = (with pkgs; [
    atomix
    cheese
    epiphany
    gnome-characters
    gnome-music
    gnome-photos
    gnome-terminal
    gnome-tour
    geary
    gedit
    hitori
    iagno
    qgnomeplatform
    qgnomeplatform-qt6
    tali
    totem
  ]);
}
