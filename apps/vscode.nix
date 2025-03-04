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
            haskell.haskell
            jnoortheen.nix-ide
            pkief.material-icon-theme
            nonylene.dark-molokai-theme
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
