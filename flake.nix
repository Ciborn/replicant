{
  description = "cib's nix config";

  inputs = {
    aagl.url = "github:ezKEa/aagl-gtk-on-nix/release-24.05";
    aagl.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";

    nur.url = "github:nix-community/nur/master";
  };

  outputs = { self, ... }@inputs: let
    specialArgs = {
      inherit inputs;
      username = "robinb";
    };
  in {
    nixosConfigurations = {
      donghoon = inputs.nixpkgs.lib.nixosSystem {
        modules = [
          self.nixosModules.chiral
          self.nixosModules.replicant
          ./hosts/donghoon
        ];
        inherit specialArgs;
      };

      hana = inputs.nixpkgs.lib.nixosSystem {
        modules = [
          self.nixosModules.replicant
          ./hosts/hana
        ];
        inherit specialArgs;
      };

      yeoreum = inputs.nixpkgs.lib.nixosSystem {
        modules = [
          self.nixosModules.replicant
          ./hosts/yeoreum
        ];
        inherit specialArgs;
      };
    };

    nixosModules = {
      chiral = import ./modules/chiral;
      replicant = import ./modules/replicant;
    };
  };
}
