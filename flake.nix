{
  description = "cib's nix config";

  inputs = {
    aagl.url = "github:ezKEa/aagl-gtk-on-nix";
    aagl.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager/release-23.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
  };

  outputs = { self, ... }@inputs: let
    specialArgs = {
      inherit (inputs) home-manager nixos-hardware;
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
        specialArgs = specialArgs // { inherit (self.nixosModules.chiral); };
      };

      hana = inputs.nixpkgs.lib.nixosSystem {
        modules = [
          self.nixosModules.replicant
          ./hosts/hana
        ];
        specialArgs = specialArgs // { aagl = inputs.aagl; };
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
