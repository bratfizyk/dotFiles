{ pkgs, ... }:

{
    services.random-background = {
        enable = true;
        imageDirectory = "%h/dotFiles/nixos/resources";
        display = "fill";
    };

    home.packages = with pkgs; [
        feh
    ];
}