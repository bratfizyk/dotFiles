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
            editor = "vim";
        };
        diff = {
            tool = "gitui";
        };
        difftool = {
            prompt = false;
        };
      };
    };

    gitui = {
      enable = true;
    };
  };
}