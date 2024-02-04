{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    tig
  ];
    
  programs = {
    git = {
      package = pkgs.gitAndTools.gitFull;
      enable = true;
      userName = "Alojzy Leszcz";
      userEmail = "aleszcz@pm.me";
      extraConfig = {
        core = {
            editor = "nvim";
        };
        diff = {
            tool = "gitui";
        };
        difftool = {
            prompt = false;
        };
	pull = {
	    rebase = false;
	};
      };
    };

    gitui = {
      enable = true;
    };
  };
}
