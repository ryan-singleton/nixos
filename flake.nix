{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-nightly = {
      url = "github:nix-community/flake-firefox-nightly";
      inputs.nixpkgs.follows = "nixpkgs";

    };
    lsfg-vk.url = "path:./pkgs/lsfg-vk";
  };

  outputs = { self, nixpkgs, lsfg-vk, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          {
            environment.systemPackages =
              [ lsfg-vk.packages.x86_64-linux.default ];
          }
          ./hosts/nixos/configuration.nix
          inputs.home-manager.nixosModules.home-manager
        ];
      };
    };
}
