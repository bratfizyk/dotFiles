{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    meslo-lgs-nf
  ];

  programs = {
    vscode = {
      enable = true;
      package = pkgs.vscodium-fhs;
      extensions = with pkgs.vscode-extensions; [
        bbenoist.nix
        haskell.haskell
        jnoortheen.nix-ide
        pkief.material-icon-theme
      ];
      userSettings = {
        terminal = {
          integrated = {
            fontFamily = "MesloLGS NF";
            fontSize = 16;
            cursorBlinking = true;
          };
        };

        workbench = {
          colorTheme = "Dark Modern";
          iconTheme = "material-icon-theme";
        };

        editor = {
          fontSize = 16;
          tabSize = 2;
        };

        explorer = {
          confirmDelete = false;
          confirmDragAndDrop = false;
        };
      };
    };
  };
}