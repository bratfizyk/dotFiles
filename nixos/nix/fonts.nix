{ config, lib, pkgs, ... }:

{
    fonts = {
        enableFontDir = true;
        fonts = with pkgs; [
            hermit
            source-code-pro
            terminus_font
            dejavu_fonts
            emacs-all-the-icons-fonts
            emojione
            fantasque-sans-mono
            fira-code
            font-awesome-ttf
            google-fonts
            hack-font
            hasklig
            iosevka
            noto-fonts-emoji
            powerline-fonts
            material-icons
        ];
    };
}