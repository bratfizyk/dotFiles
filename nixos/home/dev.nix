{ pkgs, ... }:

{
    home.packages = with pkgs; [
        yarn
        yarn2nix
        nodejs-14_x
        sqlite
        sqlitebrowser
        nodePackages.typescript
    ];
}