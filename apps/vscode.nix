{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    meslo-lgs-nf
  ];

  programs = {
    vscode = {
      enable = true;
      package = pkgs.vscodium-fhs;
      profiles = {
        default = {
          extensions = with pkgs.vscode-extensions; [
            bbenoist.nix
            rooveterinaryinc.roo-cline
            haskell.haskell
            james-yu.latex-workshop
            jnoortheen.nix-ide
            justusadam.language-haskell
            nonylene.dark-molokai-theme
            pkief.material-icon-theme
          ];

          userSettings = with config.stylix; {
            terminal = {
              integrated = {
                fontFamily = fonts.monospace.name;
                fontSize = 16;
                cursorBlinking = true;
              };
            };

            workbench = {
              colorTheme = "Dark (Molokai)";
              iconTheme = "material-icon-theme";
            };

            editor = {
              fontSize = 16;
              tabSize = 2;
              fontFamily = fonts.monospace.name;
            };

            explorer = {
              confirmDelete = false;
              confirmDragAndDrop = false;
            };
          };
        };
      };
    };
  };
}
