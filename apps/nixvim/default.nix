{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    ripgrep
  ];

  programs.nixvim = {
    enable = true;

    imports = [
      ./bufferline.nix
      ./nvim-tree.nix
      ./telescope.nix
      ./toggleTerm.nix
    ];

    colorschemes.tokyonight.enable = true;
    plugins = {
      lualine.enable = true;
      gitsigns.enable = true;
    };

    keymaps = [
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
      {
        action = "<C-w><Up>";
        key = "<C-Up>";
        mode = "n";
        options = {
          desc = "Switch to the buffer above.";
        };
      }
      {
        action = "<C-w><Down>";
        key = "<C-Down>";
        mode = "n";
        options = {
          desc = "Switch to the buffer below.";
        };
      }
    ];
  };
}
