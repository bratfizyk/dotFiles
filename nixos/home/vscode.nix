{ config, lib, pkgs, ... }:

{
    programs.vscode = {
        enable = true;
        package = pkgs.vscodium;
        extensions = with pkgs.vscode-extensions; [
            bbenoist.Nix
            justusadam.language-haskell
        ];
        userSettings = {
            "terminal.integrated.fontFamily" = "Hack";
        };
    };
}