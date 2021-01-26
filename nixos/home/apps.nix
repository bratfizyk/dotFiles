{ pkgs, ... }:

{
    home.packages = with pkgs; [
        kate
        notepadqq
        ranger
        vim
        qutebrowser
        brave
        discord
        slack-dark
        pcmanfm
    ];
}