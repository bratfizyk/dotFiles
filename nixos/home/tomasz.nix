{ pkgs, ... }:

{
    home.packages = with pkgs; [
        python39
        python39Packages.virtualenv
        sphinx
    ];
}