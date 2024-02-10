{ config, pkgs, ... }:

{
  programs.nixvim = {
    plugins = {
      neo-tree.enable = true;
    };
    keymaps = [
      {
        action = "<cmd>Neotree toggle<CR>";
        key = "<C-b>";
        mode = "n";
        options = {
          desc = "Toggle Tree View.";
        };
      }
      {
        action = "<C-w><Left>";
        key = "<C-Left>";
        mode = "n";
        options = {
          desc = "Switch to the left buffer.";
        };
      }
      {
        action = "<C-w><Right>";
        key = "<C-Right>";
        mode = "n";
        options = {
          desc = "Switch to the right buffer.";
        };
      }
    ];
  };
}

