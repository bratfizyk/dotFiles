{ lib, pkgs, osConfig, ... }:

{
  home.packages = [
    pkgs.hunspellDicts.en-gb-ize
    pkgs.hunspellDicts.pl-pl
    pkgs.libreoffice
  ];
}