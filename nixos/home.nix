{ config, pkgs, ...}:

{
    programs.home-manager.enable = true;
    nixpkgs.config.allowUnfree = true;

    imports = [
        ./home/xresources.nix
        ./home/rxvt.nix
        ./home/shell.nix
        ./home/i3.nix
        ./home/git.nix
        ./home/haskell.nix
        ./home/vscode.nix
    ];

    services.network-manager-applet.enable = true;

    home.packages = with pkgs; [
        kate
        ranger
        vim
        firefox
        qutebrowser
    ];

    home.sessionVariables = {
        EDITOR = "urxvt";
    };
}
