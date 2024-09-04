{
  description = "Fancontrol-GUI";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    systems.url = "github:nix-systems/default-linux";
  };

  outputs = { self, nixpkgs, systems }: let
    eachSystem = nixpkgs.lib.genAttrs (import systems);
  in {
    packages = eachSystem (system: rec {
      fancontrol-gui = nixpkgs.legacyPackages.${system}.callPackage ./fancontrol.nix { };
      default = fancontrol-gui;
    });
  };
}
