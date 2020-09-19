{ pkgs, ... }:

{
    home.packages = with pkgs; [
        dconf
        lxappearance
    ];

    xsession.pointerCursor = {
        package = pkgs.capitaine-cursors;
        name = "capitaine-cursors";
        size = 18;
    };

    gtk = {
        enable = true;
        theme = {
            name = "Arc-Dark";
            package = pkgs.arc-theme;
        };
        iconTheme = {
            name = "Arc";
            package = pkgs.arc-icon-theme;
        };
    };
}