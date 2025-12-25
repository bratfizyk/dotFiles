{ pkgs, ... }:

{
  home.packages = with pkgs; [
    tig
  ];
    
  programs = {
    git = {
      enable = true;
      settings = {
        user = {
          name = "Alojzy Leszcz";
          email = "alojzy.leszcz.semester130@passinbox.com";
        };
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
