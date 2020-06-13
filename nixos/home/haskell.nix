{ pkgs, ... }:

{
    home.packages = with pkgs; [
        cachix
        (import (builtins.fetchTarball "https://github.com/hercules-ci/ghcide-nix/tarball/master") {}).ghcide-ghc865
        gcc-unwrapped
        ghc 
        cabal-install
        cabal2nix
        zlib
        zlib.dev
        haskellPackages.zlib
        haskellPackages.zlib-bindings
    ];
}
