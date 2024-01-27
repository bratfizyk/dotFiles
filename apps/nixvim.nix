{ config, pkgs, ... }:

{
  programs.nixvim = {
    enable = true;
    colorschemes.tokyonight = {
      enable = true;
      style = "night";
    };
    keymaps = [
      {
        action = "<cmd>Neotree toggle<CR>";
        key = "C-b";
        mode = "n";
        options = {
          desc = "Toggle Tree View.";
        };
      }
    ];
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

      neo-tree = {
        enable = true;
      };
    };
    extraPlugins = [ ];
  };
}