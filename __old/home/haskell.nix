{ pkgs, ... }:

{
    home.packages = with pkgs; [
        gcc-unwrapped
        ghc 
        cabal-install
        cabal2nix
        stack
        haskellPackages.ghcide
        haskellPackages.haskell-language-server
    ];

}
