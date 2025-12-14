{
  description = "Beko Legion NixOS config";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixpkgs-old.url = "nixpkgs/ebb6e6a83649d4660051436ba2f654e2c63be383";
    nixos-hardware.url = "github:nixos/nixos-hardware/master";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    beKode = {
      url = "github:bratfizyk/beKode";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, home-manager, nixos-hardware, nur, stylix, ...  }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
          allowBroken = false;
          permittedInsecurePackages = [ ];
        };
      };
      oldPkgs = import inputs.nixpkgs-old {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };
      extra = {
        beKode = inputs.beKode.packages.${system}.default;
        wechat = oldPkgs.wechat;
      };
    in {
      nixosConfigurations = {
        beko-nixos = nixpkgs.lib.nixosSystem {
          inherit system;
          inherit pkgs;
          specialArgs = { inherit extra; };
          modules = [ 
            nixos-hardware.nixosModules.lenovo-legion-16achg6-hybrid
            ./configs/legion/configuration.nix
            stylix.nixosModules.stylix
            nur.modules.nixos.default

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = { inherit extra; };
              home-manager.users = {
                beko = {
                  imports = [
                    ./configs/legion/home.nix
                  ];
                };
                steam = {
                  imports = [
                    ./configs/legion/steam.nix
                  ];
                };
              };
            }
          ];
        };
      };
    };
}
