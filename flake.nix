{
  description = "Fancontrol-GUI";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    systems.url = "github:nix-systems/default-linux";
  };

  outputs = { self, nixpkgs, systems }: let
    eachSystem = nixpkgs.lib.genAttrs (import systems);
  in {
    apps.fancontrol-gui = eachSystem (system: {
      type = "app";
      program = "${nixpkgs.lib.getExe' self.packages.${system}.fancontrol-gui "fancontrol_gui"}";
    });

    packages = eachSystem (system: rec {
      default = fancontrol-gui;
      fancontrol-gui = nixpkgs.legacyPackages.${system}.callPackage ./fancontrol.nix { };
    });
  };
}
