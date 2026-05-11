{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lsfg-vk-flake.url = "github:pabloaul/lsfg-vk-flake/main";
    lsfg-vk-flake.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      self,
      nixpkgs,
      lsfg-vk-flake,
      ...
    }@inputs:
    let
      inherit (self) outputs;
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        overlays = builtins.attrValues outputs.overlays;
        config = {
          allowUnfree = true;
        };
      };
    in
    {
      overlays = import ./overlays { inherit inputs; };
      nixosModules = import ./modules/nixos;
      homeManagerModules = import ./modules/home-manager;

      nixosConfigurations.ryan = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs outputs; };
        modules = [
          ./hosts/ryan/nixos/configuration.nix
          lsfg-vk-flake.nixosModules.default
          inputs.home-manager.nixosModules.home-manager

          { nixpkgs.overlays = builtins.attrValues outputs.overlays; }
          { nixpkgs.config.allowUnfree = true; }
        ];
      };

      nixosConfigurations.single-serv = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs outputs; };
        modules = [
          ./hosts/single-serv/nixos/configuration.nix
          inputs.home-manager.nixosModules.home-manager
        ];
      };
    };
}
