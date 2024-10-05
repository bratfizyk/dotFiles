{
  description = "Beko Legion NixOS config";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ags = {
      url = "github:Aylur/ags";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    nixos-hardware.url = "github:nixos/nixos-hardware/master";
    nur.url = "github:nix-community/NUR";
  };

  outputs = inputs@{ self, nixpkgs, home-manager, nixos-hardware, nur, stylix, ags, ...  }:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; config.allowUnfree = true; };
      extra = { };
    in {
      nixosConfigurations = {
        beko-nixos = lib.nixosSystem {
          inherit system;
          inherit pkgs;
          specialArgs = {
            inherit extra;
          };
          modules = [ 
            nixos-hardware.nixosModules.lenovo-legion-16achg6-hybrid
            ./configs/legion/configuration.nix
            stylix.nixosModules.stylix

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = {
                inherit extra;
              };
              home-manager.users.beko = {
                imports = [
                  nur.nixosModules.nur
                  ags.homeManagerModules.default 
                  ./configs/legion/home.nix
                ];
              };
            }
          ];
        };
        beko-yoga = lib.nixosSystem {
          inherit system;
          inherit pkgs;
          specialArgs = {
            inherit extra;
          };
          modules = [ 
            #nixos-hardware.nixosModules.lenovo-legion-16achg6-hybrid
            ./configs/yoga/configuration.nix
            stylix.nixosModules.stylix

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = {
                inherit extra;
              };
              home-manager.users.beko = {
                imports = [
                  nur.nixosModules.nur
                  ags.homeManagerModules.default
                  ./configs/yoga/home.nix
                ];
              };
            }
          ];
        };
        beko-scaffold = lib.nixosSystem {
          inherit system;
          inherit pkgs;
          modules = [ 
            nixos-hardware.nixosModules.lenovo-legion-16achg6-hybrid
            ./configs/scaffold/configuration.nix

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = {
                inherit extra;
              };
              home-manager.users.beko = {
                imports = [
                  nur.nixosModules.nur
                  ./configs/scaffold/home.nix
                ];
              };
            }
          ];
        };
      };
    };
}
