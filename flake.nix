{
  description = "Beko Legion NixOS config";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:nixos/nixos-hardware/master";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, home-manager, nixvim, nixos-hardware, nur, stylix, ...  }:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
          permittedInsecurePackages = [
            # For godot_4-mono
            "dotnet-sdk-6.0.428"
          ];
        };
      };
      extra = { };
    in {
      nixosConfigurations = {
        beko-nixos = lib.nixosSystem {
          inherit system;
          inherit pkgs;
          specialArgs = { inherit extra; };
          modules = [ 
            nixos-hardware.nixosModules.lenovo-legion-16achg6-hybrid
            ./configs/legion/configuration.nix
            stylix.nixosModules.stylix
            nixvim.nixosModules.nixvim
            nur.modules.nixos.default

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = { inherit extra; };
              home-manager.users.beko = {
                imports = [
                  nixvim.homeManagerModules.nixvim
                  ./configs/legion/home.nix
                ];
              };
            }
          ];
        };
      };
    };
}
