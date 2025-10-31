{
  description = "Dotfiles managed with Nix flakes and home-manager";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, nixvim, ... }:
    let
      username = "itsarminbabaei";
      macSystem = "aarch64-darwin";
      nixosSystem = "aarch64-linux";
    in {
      # Home config for macOS (standalone)
      homeConfigurations.${username} = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${macSystem};
        modules = [
          ./home.nix
          nixvim.homeManagerModules.nixvim
        ];
        extraSpecialArgs = {
          inherit username;
        };
      };

      # NixOS system config (for VM)
      nixosConfigurations.nixos-vm = nixpkgs.lib.nixosSystem {
        system = nixosSystem;
        modules = [
          ./configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.${username} = import ./home.nix;
            home-manager.extraSpecialArgs = { inherit username; };
            home-manager.sharedModules = [ nixvim.homeManagerModules.nixvim ];
          }
        ];
      };
    };
}
