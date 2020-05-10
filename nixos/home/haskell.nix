{ pkgs, ... }:

{
    home.packages = with pkgs; [
        #(import (builtins.fetchTarball "https://github.com/hercules-ci/ghcide-nix/tarball/master") {}).ghcide-ghc865
        ghc 
        cabal-install
    ];
}
