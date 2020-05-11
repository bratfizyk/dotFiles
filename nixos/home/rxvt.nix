{ pkgs, ... }:

{
    home.packages = with pkgs; [
        clipmenu
    ];

    programs.urxvt = {
        enable = true;
        fonts = [
            xft:Hermit Light:size=10
        ];
        keybindings = {
            "Shift-Control-C" = "CM_ONESHOT=1 clipmenud";
            "Shift-Control-V" = "clipmenu";
        };
        scroll.bar.enable = false;
    };
}