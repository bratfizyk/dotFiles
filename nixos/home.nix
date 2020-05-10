{ config, pkgs, ...}:

{
    programs.home-manager.enable = true;

    home.packages = with pkgs; [
        kate
        ranger
    ];

    home.sessionVariables = {
        EDITOR = "urxvt";
    };
}
