{ config, lib, pkgs, ... }:

{
    programs.vscode = {
        enable = true;
        package = pkgs.vscode;
        extensions = with pkgs.vscode-extensions; [
            bbenoist.nix
            justusadam.language-haskell
            #digitalassetholdingsllc.ghcide
            #arrterian.nix-env-selector
            #devine-davies.make-hidden
            #ecmel.vscode-html-css
            #pkief.material-icon-theme
            #equinusocio.vsc-community-material-theme
        ];
        userSettings = {
            "terminal.integrated.fontFamily" = "Hack";
            "workbench.colorTheme" = "Community Material Theme Ocean High Contrast";
            "workbench.iconTheme" = "material-icon-theme";
            "explorer.confirmDelete" = false;
            "terminal.integrated.cursorBlinking" = true;
        };
    };
}