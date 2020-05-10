{ config, lib, pkgs, ... }:

{
    fonts = {
        enableFontDir = true;
        fonts = with pkgs; [
            hermit
            source-code-pro
            terminus_font
            dejavu_fonts
            fira-code
            font-awesome-ttf
            google-fonts
            hack-font
            powerline-fonts
            material-icons
        ];
    };
}