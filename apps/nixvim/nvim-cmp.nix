{ config, pkgs, ... }:

{
  programs.nixvim = {
    plugins = {
      cmp_luasnip.enable = true;
      luasnip.enable = true;

      nvim-cmp = {
        enable = true;
        autoEnableSources = true;
        sources = [
          { groupIndex = 1; name = "path"; }
          { groupIndex = 1; name = "nvim_lsp"; }
	  { groupIndex = 2; name = "luasnip"; }
          { groupIndex = 2; name = "buffer"; }
        ];

	mapping = {
          "<CR>" = "cmp.mapping.confirm({ select = true })";
          "<Tab>" = {
            action = ''
              function(fallback)
	        local luasnip = require('luasnip')
                if cmp.visible() then
                  cmp.select_next_item()
                elseif luasnip.expandable() then
                  luasnip.expand()
                elseif luasnip.expand_or_jumpable() then
                  luasnip.expand_or_jump()
                elseif check_backspace() then
                  fallback()
                else
                  fallback()
                end
              end
            '';
            modes = [ "i" "s" ];
          };
        };
      };
    };

    extraConfigLua = ''
      require('luasnip.loaders.from_vscode').lazy_load()

      function check_backspace()
        local col = vim.fn.col(".") - 1
        return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
      end
    '';
  };
}
