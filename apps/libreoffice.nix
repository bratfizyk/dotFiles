{ lib, pkgs, osConfig, ... }:

let
  libreoffice = 
    if (osConfig.services.xserver.desktopManager.plasma5.enable == true)
        then pkgs.libreoffice-qt
        else pkgs.libreoffice;
in
{
  home.packages = [
    pkgs.hunspellDicts.en-gb-ize
    pkgs.hunspellDicts.pl-pl
    libreoffice
  ];
}