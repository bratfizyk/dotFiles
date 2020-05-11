{ config, pkgs, ... }:

{
    console = {
        keyMap = "pl";
        font = "Lat2-Terminus16";
    };

    i18n = {
        defaultLocale = "en_US.UTF-8";
    };

    time.timeZone = "Europe/Zurich";
}