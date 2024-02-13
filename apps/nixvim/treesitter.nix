{ config, pkgs, ... }:

{
  programs.nixvim = {
    plugins = {
      treesitter = {
        enable = true;
	indent = true;
	ensureInstalled = [
	  "haskell"
	  "javascript"
	  "nix"
	  "tsx"
	  "typescript"
	  "vim"
	  "vimdoc"
	];
      };
    };
  };
}
