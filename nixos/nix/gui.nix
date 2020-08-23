{ pkgs, lib, ...}:

{
    environment.pathsToLink = [ "/libexec" ];
    services.xserver = {
        enable = true;
        layout = "pl";
        #videoDrivers = [ "NVidia" ];

        displayManager = {
            lightdm = {
                enable = true;
            };
            defaultSession =  "none+i3";
        };

        desktopManager = {
            xterm.enable = false;
        };

        windowManager = {
            i3 = {
                enable = true;
                package = pkgs.i3-gaps;
            };
        };

        resolutions = lib.mkOverride 9 [{ x = 1920; y = 1080; }];
    };
}