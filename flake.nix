{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-22.11";

    zen-browser = {
      url = "github:Axot017/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, stylix, nixpkgs, nixvim, home-manager, ... }@inputs: {
    homeConfigurations = {
      "mateuszledwon" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.aarch64-darwin;
        modules = [
          ./hosts/macos/home.nix
          nixvim.homeManagerModules.nixvim
          stylix.homeManagerModules.stylix
        ];
      };
    };
    nixosConfigurations.default = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        ./hosts/default/configuration.nix
        home-manager.nixosModules.default
        stylix.nixosModules.stylix
        nixvim.nixosModules.nixvim
      ];
    };
  };
}
