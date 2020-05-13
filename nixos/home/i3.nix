{ pkgs, ... }:

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
    ];

    xsession.windowManager.i3 = {
        enable = true;
        #package = pkgs.i3-gaps;
        
        config = {
            modifier = mod;
            fonts = ["Hack 12"];
            gaps = {
                # inner = 20;
                # outer = 30;
                # smartGaps = true;
            };

            #   keybindings = lib.mkOptionDefault {
            #     "${mod}+p" = "exec ${pkgs.dmenu}/bin/dmenu_run";
            #   };

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
        '';
    };
}