{
  description = "Beko Legion NixOS config";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixpkgs-old.url = "nixpkgs/2ff53fe64443980e139eaa286017f53f88336dd0";

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
      lib = nixpkgs.lib;
      old-pkgs = import inputs.nixpkgs-old { inherit system; };
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
      extra = {
        beKode = inputs.beKode.packages.${system}.default;
        gnucash = old-pkgs.gnucash;
      };
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
            nur.modules.nixos.default

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = { inherit extra; };
              home-manager.users.beko = {
                imports = [
                  ./configs/legion/home.nix
                ];
              };
            }
          ];
        };
      };
    };
}
