{ config, pkgs, ... }:

{
  programs.dms-shell = {
    enable = true;

    systemd.enable = true;
    systemd.restartIfChanged = true;

    enableSystemMonitoring = true;
    enableDynamicTheming = true;
    enableAudioWavelength = true;
    enableCalendarEvents = true;
  };
}
