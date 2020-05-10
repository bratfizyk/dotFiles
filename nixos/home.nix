{ config, pkgs, ...}:

{
    programs.home-manager.enable = true;

    imports = [
        ./home/shell.nix
        ./home/git.nix
        ./home/haskell.nix
    ];

    home.packages = with pkgs; [
        kate
        ranger
    ];

    home.sessionVariables = {
        EDITOR = "urxvt";
    };
}
