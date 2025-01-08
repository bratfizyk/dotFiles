{ pkgs, lib, ... }:

{
  plugins = {
    telescope.enable = true;
  };
  keymaps = [
    {
      action = "<cmd>Telescope find_files<cr>";
      key = "<leader>ff";
      mode = "n";
      options = {
        desc = "Show Telescope File Finder.";
      };
    }
    {
      action = "<cmd>Telescope live_grep<cr>";
      key = "<leader>fg";
      mode = "n";
      options = {
        desc = "Show Telescope File Grep.";
      };
    }
    {
      action = "<cmd>Telescope buffers<cr>";
      key = "<leader>fb";
      mode = "n";
      options = {
        desc = "Show Telescope Buffers.";
      };
    }
    {
      action = "<cmd>Telescope help_tags<cr>";
      key = "<leader>fh";
      mode = "n";
      options = {
        desc = "Show Telescope Help Tags.";
      };
    }
  ];
}
