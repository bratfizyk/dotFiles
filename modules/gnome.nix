{ config, pkgs, ... }:

{
  services = {
    desktopManager.gnome.enable = true;
  };

  environment.gnome.excludePackages = (with pkgs; [
    epiphany
    gnome-characters
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
