{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lsfg-vk-flake.url = "github:pabloaul/lsfg-vk-flake/main";
    lsfg-vk-flake.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, lsfg-vk-flake, ... }@inputs:
    let
      inherit (self) outputs;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      overlays = import ./overlays { inherit inputs; };
      nixosModules = import ./modules/nixos;
      homeManagerModules = import ./modules/home-manager;

      nixosConfigurations.ryan = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs outputs; };
        modules = [
          ./hosts/ryan/nixos/configuration.nix
          lsfg-vk-flake.nixosModules.default
          inputs.home-manager.nixosModules.home-manager
        ];
      };

      # nixosConfigurations.single-serv = nixpkgs.lib.nixosSystem {
      #   specialArgs = { inherit inputs outputs; };
      #   modules = [ ./hosts/single-serv/nixos/configuration.nix ];
      # };
    };
}
