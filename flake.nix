{
  description = "Beko Legion NixOS config";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-23.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nixvim = {
      url = "github:nix-community/nixvim/nixos-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, nixos-hardware, nixvim, ...  }:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = import nixpkgs { 
        inherit system;
        config.allowUnfree = true;
      };
    in {
      nixosConfigurations = {
        beko-nixos = lib.nixosSystem {
          inherit system;
          modules = [ 
            nixos-hardware.nixosModules.lenovo-legion-16achg6-hybrid
            ./legion/configuration.nix
          ];
        };
      };
      homeConfigurations = {
        beko = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            nixvim.homeManagerModules.nixvim
            ./legion/home.nix
          ];
        };
      };
  };
}