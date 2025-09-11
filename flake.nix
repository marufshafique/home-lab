{
  description = "A very basic flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };
  outputs = inputs@{ nixpkgs, ... }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        # This line will populate NIX_PATH
        { nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ]; }
        # ... other modules and your configuration.nix
        ./hosts/server/default.nix
      ];
    };
  };
}
