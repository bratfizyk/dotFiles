{
  description = "Beko Legion NixOS config";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-23.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware.url = "github:bratfizyk/nixos-hardware/master";
  };

  outputs = { self, nixpkgs, home-manager, nixos-hardware, ...  }:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
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
          modules = [ ./legion/home.nix ];
        };
      };
  };
}
