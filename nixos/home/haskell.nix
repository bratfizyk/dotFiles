{ pkgs, ... }:

{
    home.packages = with pkgs; [
        #cachix
        #(import (builtins.fetchTarball "https://github.com/hercules-ci/ghcide-nix/tarball/master") {}).ghcide-ghc865
        haskellPackages.ghcide
        gcc-unwrapped
        ghc 
        cabal-install
        cabal2nix
        stack
    ];
}
