{ pkgs, ...}:

{
    environment.pathsToLink = [ "/libexec" ];
    services.xserver = {
        enable = true;
        layout = "us";

        #xkbOptions = "grp:alt_space_toggle, ctrl:swapcaps";

        displayManager = {
            lightdm.enable = true;
            defaultSession =  "none+i3";
        };
        desktopManager = {
            xterm.enable = false;
        };

        windowManager.i3.enable = true;
    };
}