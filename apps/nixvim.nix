{ config, pkgs, ... }:

{
  programs.nixvim = {
    enable = true;
    colorschemes.tokyonight = {
      enable = true;
      style = "night";
    };
    plugins = {
      lsp = {
        enable = true;
        servers = {
          hls.enable = true;
        };
      };
      nvim-cmp = {
        enable = true;
        autoEnableSources = true;
        sources = [
          { name = "nvim_lsp"; }
          { name = "path"; }
          { name = "buffer"; }
        ];
      };
    };
    extraPlugins = [ ];
  };
}