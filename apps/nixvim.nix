{ config, pkgs, ... }:

{
  programs.nixvim = {
    enable = true;
    colorschemes.gruvbox.enable = true;
    plugins.lightline.enable = true;
    extraPlugins = [ 
      pkgs.vimPlugins.gruvbox
    ];
  };
}