{
  description = "cib's nix config";

  inputs = {
    aagl.url = "github:ezKEa/aagl-gtk-on-nix/release-24.05";
    aagl.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";

    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    nur.url = "github:nix-community/nur/master";
  };

  outputs = { self, ... }@inputs: let
    mkHost = module: inputs.nixpkgs.lib.nixosSystem {
      modules = [
        self.nixosModules.replicant
        module
      ];

      specialArgs = {
        inherit inputs;
        username = "robinb";
        unstable-pkgs = import inputs.nixpkgs-unstable {
          config.allowUnfree = true;
          system = "x86_64-linux";
        };
      };
    };
  in {
    nixosConfigurations = {
      hana = mkHost ./hosts/pc-hana;
      yeoreum = mkHost ./hosts/pc-yeoreum;
    };

    nixosModules = {
      chiral = import ./modules/chiral;
      replicant = import ./modules/replicant;
    };
  };
}
