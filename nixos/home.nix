{ config, pkgs, ...}:

{
    programs.home-manager.enable = true;
    nixpkgs.config.allowUnfree = true;
    services.network-manager-applet.enable = true;

    imports = [
        ./home/background.nix
        ./home/xresources.nix
        ./home/rxvt.nix
        ./home/shell.nix
        ./home/i3.nix
        ./home/gtk.nix

        ./home/git.nix
        ./home/chromium.nix
        ./home/haskell.nix
        ./home/vscode.nix
        ./home/dev.nix
        ./home/apps.nix
        ./home/tomasz.nix
    ];

    home.sessionVariables = {
        EDITOR = "urxvt";
    };
}
