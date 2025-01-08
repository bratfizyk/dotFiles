{ pkgs, lib, ... }:

{
  plugins = {
    bufferline.enable = true;
  };
  keymaps = [
   {
      action = "<cmd>BufferLineCycleNext<cr>";
      key = "<leader>bn";
      mode = "n";
      options = {
        desc = "Switch to the next buffer.";
      };
    }
    {
      action = "<cmd>BufferLineCyclePrev<cr>";
      key = "<leader>bp";
      mode = "n";
      options = {
        desc = "Switch to the previous buffer.";
      };
    }
  ];
}
