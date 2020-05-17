{ config, lib, pkgs, ... }:

{
    programs.vscode = {
        enable = true;
        package = pkgs.vscode;
        extensions = with pkgs.vscode-extensions; [
            bbenoist.Nix
            justusadam.language-haskell
        ];
        userSettings = {
            "terminal.integrated.fontFamily" = "Hack";
            "workbench.colorTheme" = "Material Theme High Contrast";
            "workbench.iconTheme" = "eq-material-theme-icons-palenight";
        };
    };
}