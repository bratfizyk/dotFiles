{ config, pkgs, ...}:

{
    programs.home-manager.enable = true;
    nixpkgs.config.allowUnfree = true;

    imports = [
        ./home/shell.nix
        ./home/i3.nix
        ./home/git.nix
        ./home/haskell.nix
        ./home/vscode.nix
    ];

    home.packages = with pkgs; [
        kate
        ranger
    ];

    home.sessionVariables = {
        EDITOR = "urxvt";
    };
}
