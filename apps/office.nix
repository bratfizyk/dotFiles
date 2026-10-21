{ lib, pkgs, osConfig, ... }:

{
  home.packages = with pkgs; [
    libreoffice-stable
    hunspell
    hunspellDicts.en_US
    hunspellDicts.pl_PL
    hyphenDicts.en_US
    hyphenDicts.pl_PL

    onlyoffice-desktopeditors
  ];
}
