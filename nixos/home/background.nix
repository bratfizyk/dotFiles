{ pkgs, ... }:

{
    services.random-background = {
        enable = true;
        imageDirectory = "/home/beko/dotfiles/nixos/resources/";
        display = "fill";
    };

    home.packages = with pkgs; [
        feh
        imlib2
    ];
}