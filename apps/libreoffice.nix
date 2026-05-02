{ lib, pkgs, osConfig, ... }:

{
  home.packages = with pkgs; [
    hunspellDicts.en-gb-ize
    hunspellDicts.pl-pl
    #libreoffice
    onlyoffice-desktopeditors
  ];
}
