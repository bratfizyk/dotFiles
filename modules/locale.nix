{ config, pkgs, ... }:

{
  time.timeZone = "Europe/Zurich";
  
  i18n = {
    defaultLocale = "en_GB.UTF-8";
    extraLocaleSettings = { };
  };

  services.xserver = {
    layout = "pl";
    xkbVariant = "";
  };

  console.keyMap = "pl2";
}