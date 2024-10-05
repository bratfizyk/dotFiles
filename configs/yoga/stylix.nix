{ config, pkgs, ... }:

{
  stylix = {
    enable = true;
    image = ../../assets/wallpapers/Gedeon.jpg;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-city-dark.yaml";
    fonts = {
      sansSerif = {
        package = pkgs.noto-fonts;
        name = "Noto Sans";
      };
      monospace = {
        package = pkgs.meslo-lgs-nf;
        name = "MesloLGS NF";
      };
      emoji = {
        package = pkgs.noto-fonts-emoji-blob-bin;
        name = "Noto Color Emoji";
      };
    };
    cursor = {
      package = pkgs.vimix-cursor-theme;
      name = "Vimix-Cursors";
    };
    opacity.terminal = 0.8;
    polarity = "dark";
  };
}