{ pkgs, lib, ... }:

let 
    mod = "Mod4";
in {
    home.packages = with pkgs; [
        dmenu
        i3-gaps
        i3status
        i3status-rust
        i3lock
        i3blocks
        pulsemixer
        #pasystray
    ];

    xsession.windowManager.i3 = {
        enable = true;
        package = pkgs.i3-gaps;
        
        config = {
            modifier = mod;
            fonts = ["Hack 12"];
            gaps = {
                inner = 15;
                outer = 10;
                smartGaps = true;
            };

            #keybindings = lib.mkOptionDefault {
                # on VM: fix resolution
                #"${mod}+Shift+x" = "exec xrandr -s 1600x900; exec xrandr -s 1920x1080";
            #};

            bars = [
                {
                    position = "top";
                    statusCommand = "${pkgs.i3status-rust}/bin/i3status-rs ${./i3status.toml}";
                    fonts = ["Hack 12"];
                }
            ];
        };
        extraConfig = ''
            for_window [class="floating"] floating enable;
            for_window [class=^.*"] border pixel 0;

            bindsym XF86AudioRaiseVolume exec --no-startup-id pactl set-sink-volume 0 +2%
            bindsym XF86AudioLowerVolume exec --no-startup-id pactl set-sink-volume 0 -2%
            bindsym XF86AudioMute exec --no-startup-id pactl set-sink-mute 0 toggle
        '';
    };
}