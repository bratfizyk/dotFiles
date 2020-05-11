{ pkgs, ... }:

let 
    mod = "Mod4";
in {
    #xsession.scriptPath = ".hm-xsession"; # Ref: https://discourse.nixos.org/t/opening-i3-from-home-manager-automatically/4849/8

    home.packages = with pkgs; [
        dmenu
        i3status
        i3status-rust
        i3lock
        i3blocks
    ];

    xsession.windowManager.i3 = {
        enable = true;
        package = pkgs.i3-gaps;
        
        config = {
            modifier = mod;
            fonts = ["pango:DejaVu Sans Mono" "FontAwesome 12"];

            #   keybindings = lib.mkOptionDefault {
            #     "${mod}+p" = "exec ${pkgs.dmenu}/bin/dmenu_run";
            #   };

            bars = [
                {
                    position = "top";
                    statusCommand = "${pkgs.i3status-rust}/bin/i3status-rs ${./i3status.toml}";
                }
            ];
        };
        extraConfig = ''
            for_window [class="floating"] floating enable;
            
        '';
    };
}