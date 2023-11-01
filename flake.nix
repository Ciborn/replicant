{
  description = "cib's nix config";

  inputs = {
    home-manager.url = "github:nix-community/home-manager/master";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, home-manager, nixpkgs, ... }@inputs: let
    specialArgs = {
      inherit home-manager;
      inherit nixpkgs;
      username = "robinb";
      cibnix = self.nixosModules.cibnix;
    };
  in {
    nixosConfigurations = {
      hana = nixpkgs.lib.nixosSystem {
        modules = [ self.nixosModules.cibnix ./hosts/hana ];
        specialArgs = specialArgs;
      };
      yeoreum = nixpkgs.lib.nixosSystem {
        modules = [ ./hosts/yeoreum ];
        specialArgs = specialArgs;
      };
    };

    nixosModules.cibnix = import ./modules;
  };
}
