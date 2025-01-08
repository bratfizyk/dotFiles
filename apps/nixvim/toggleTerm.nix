{ pkgs, lib, ... }:

{
  plugins = {
    toggleterm.enable = true;
  };

  keymaps = [
    {
      action = "<cmd>ToggleTerm size=20 direction=horizontal<cr>";
      key = "<C-`>";
      mode = ["n" "i" "v" "s" "t"];
      options = {
        desc = "Toggle Termianl panel.";
      };
    }
    {
      action = "<C-\\><C-n>";
      key = "<esc>";
      mode = "t";
      options = {
        desc = "Exit Terminal mode and return to Normal.";
      };	
    }
  ];
}
