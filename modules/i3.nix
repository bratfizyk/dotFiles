{ config, pkgs, ... }:

# ToDo: Untested and most likely doesn't work
{
  services.xserver = {
    windowManager.i3.enable = true;
    desktopManager.session = [
      {
        name = "home-manager";
        start = ''
          ${pkgs.runtimeShell} $HOME/.hm-xsession &
          waitPID=$!
        '';
      }
    ];
  };
}