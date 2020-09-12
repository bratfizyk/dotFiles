{ pkgs, ... }:

{
    home.packages = with pkgs; [
        kate
        ranger
        vim
        qutebrowser
        discord
        slack-dark
        pcmanfm
    ];
}