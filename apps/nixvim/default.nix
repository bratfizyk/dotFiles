{ config, pkgs, ... }:

{
  imports = [
    ./bufferline.nix
    ./neogit.nix
    ./neo-tree.nix
    # ./nvim-cmp.nix
    ./telescope.nix
    ./treesitter.nix
  ];

  programs.nixvim = {
    enable = true;

    options = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
    };

    globals = {
      mapleader = " ";
    };

    colorschemes.tokyonight = {
      enable = true;
      style = "night";
    };
 
    plugins = {
      comment-nvim.enable = true;
      lightline.enable = true;
      lualine.enable = true;
      neo-tree.enable = true;
      lsp = {
        enable = true;
        servers = {
          hls.enable = true;
        };
      };
    };

    extraPlugins = [ ];
  };
}
