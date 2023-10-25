{
  description = "cib's nix config";

  inputs = {
    home-manager.url = "github:nix-community/home-manager/release-23.05";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations = {
      hana = nixpkgs.lib.nixosSystem {
        modules = [ ./hosts/shared ./hosts/hana ];
        specialArgs = inputs;
      };
      yeoreum = nixpkgs.lib.nixosSystem {
        modules = [ ./hosts/shared ./hosts/yeoreum ];
        specialArgs = inputs;
      };
    };
  };
}
