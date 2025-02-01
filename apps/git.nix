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
      userEmail = "alojzy.leszcz.semester130@passinbox.com";
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
