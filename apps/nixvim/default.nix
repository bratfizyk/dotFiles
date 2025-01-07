{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    ripgrep
  ];

  programs.nixvim = {
    enable = true;

    colorschemes.tokyonight.enable = true;
    plugins = {
      lualine.enable = true;
      bufferline.enable = true;

      telescope.enable = true;
      gitsigns.enable = true;
      nvim-tree = {
        enable = true;
	hijackUnnamedBufferWhenOpening = true;
	openOnSetup = true;
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
    ] ++ [
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

  };
}
