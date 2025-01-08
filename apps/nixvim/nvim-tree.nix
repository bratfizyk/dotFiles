{ pkgs, lib, ... }:

{
  plugins = {
    nvim-tree = {
      enable = true;
      hijackUnnamedBufferWhenOpening = true;
      openOnSetup = true;
      filters.dotfiles = true;
    };
    web-devicons.enable = true;
  };

  keymaps = [
    {
      action = "<cmd>NvimTreeToggle<CR>";
      key = "<C-b>";
      mode = "n";
      options = {
        desc = "Toggle Tree View.";
      };
    }
  ];
}

