{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    hyprland.url = "github:hyprwm/Hyprland";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ags = {
      url = "github:Aylur/ags";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    catppuccin = { url = "github:catppuccin/nix"; };
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations = {
      nyx = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/nyx/configuration.nix
          inputs.home-manager.nixosModules.default
        ];
      };
    };
  };
}
