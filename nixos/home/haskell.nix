{ pkgs, ... }:

{
    home.packages = with pkgs; [
        haskellPackages.ghcide
        haskellPackages.haskell-language-server
        gcc-unwrapped
        ghc 
        cabal-install
        cabal2nix
        stack
    ];
}
