{ config, pkgs, ... }:

{
    console = {
        keyMap = "pl";
        font = "Lat2-Terminus16";
    };

    i18n = {
        defaultLocale = "pl_PL.UTF-8";
    };

    time.timeZone = "Europe/Zurich";
}