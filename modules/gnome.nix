{ config, pkgs, ... }:

{
  services.xserver = {
    desktopManager.gnome.enable = true;
  };

  environment.gnome.excludePackages = (with pkgs; [
    cheese
    gnome-photos
    gnome-terminal
    gnome-tour
    geary
    gedit
    epiphany
    totem
  ]) ++ (with pkgs.gnome; [
    gnome-music
    gnome-characters
    tali
    iagno
    hitori
    atomix
  ]);
}
