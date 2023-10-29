{
  description = "cib's nix config";

  inputs = {
    home-manager.url = "github:nix-community/home-manager/master";
    nixpkgs.url = "github:nixos/nixpkgs/c8e7ce71bbdb32ae51f53a6c5f6810c5e0a7e1e4";
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations = {
      hana = nixpkgs.lib.nixosSystem {
        modules = [
          ./hosts/shared
          ./hosts/hana
        ];
        specialArgs = inputs;
      };
      yeoreum = nixpkgs.lib.nixosSystem {
        modules = [
          ./hosts/shared
          ./hosts/yeoreum
        ];
        specialArgs = inputs;
      };
    };
  };
}
