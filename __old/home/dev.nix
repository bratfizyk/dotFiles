{ pkgs, ... }:

{
    home.packages = with pkgs; [
        colmena
        doctl
        yarn
        yarn2nix
        nodejs-14_x
        nodePackages.typescript
        sqlite
        sqlitebrowser
    ];
}