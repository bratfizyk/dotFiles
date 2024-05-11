{
  description = "Beko Legion NixOS config";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware.url = "github:nixos/nixos-hardware/master";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur.url = github:nix-community/NUR;
  };

  outputs = inputs@{ self, nixpkgs, home-manager, nixos-hardware, nixvim, nur, ...  }:
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
            ./legion/configuration.nix

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = {
                inherit extra;
              };
              home-manager.users.beko = {
                imports = [
                  nixvim.homeManagerModules.nixvim
                  nur.nixosModules.nur
                  ./legion/home.nix
                ];
              };
            }
          ];
        };
      };
  };
}
