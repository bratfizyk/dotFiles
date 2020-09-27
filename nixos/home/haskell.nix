{ pkgs, ... }:

{
    home.packages = with pkgs; [
        haskellPackages.ghcide
        gcc-unwrapped
        ghc 
        cabal-install
        cabal2nix
        stack
    ];
}
