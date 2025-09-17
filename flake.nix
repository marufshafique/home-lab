{
  description = "A very basic flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixarr.url = "github:rasmus-kirk/nixarr";
  };
  outputs =
    inputs@{ nixpkgs, nixarr, ... }:
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/server/default.nix
        ];
      };
    };
}
