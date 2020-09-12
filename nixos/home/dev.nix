{ pkgs, ... }:

{
    home.packages = with pkgs; [
        yarn
        yarn2nix
        nodejs-12_x
    ];
}