{
  description = "Dotfiles managed with Nix flakes and home-manager";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      username = "itsarminbabaei";
      macSystem = "aarch64-darwin";
      nixosSystem = "aarch64-linux";
    in {
      # Home config for macOS (standalone)
      homeConfigurations.macos = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${macSystem};
        modules = [
          ./macos/home.nix
        ];
        extraSpecialArgs = {
          inherit username;
        };
      };

      # NixOS system config
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        system = nixosSystem;
        modules = [
          ./nixos/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.${username} = import ./nixos/home.nix;
            home-manager.extraSpecialArgs = { inherit username; };
          }
        ];
      };

      # Dev shell for macOS
      devShells.${macSystem}.default = nixpkgs.legacyPackages.${macSystem}.mkShell {
        NIX_CONFIG = "extra-experimental-features = nix-command flakes";
        nativeBuildInputs = with nixpkgs.legacyPackages.${macSystem}; [
          nix
          home-manager.packages.${macSystem}.default
          git
        ];
      };
    };
}
