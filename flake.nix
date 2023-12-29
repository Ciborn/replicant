{
  description = "cib's nix config";

  inputs = {
    home-manager.url = "github:nix-community/home-manager/release-23.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
  };

  outputs = { self, ... }@inputs: let
    specialArgs = {
      home-manager = inputs.home-manager;
      username = "robinb";
    };
  in {
    nixosConfigurations = {
      donghoon = inputs.nixpkgs.lib.nixosSystem {
        modules = [ self.nixosModules.cibnix ./hosts/donghoon ];
        specialArgs = specialArgs // { nixpkgs = inputs.nixpkgs; };
      };
      hana = inputs.nixpkgs.lib.nixosSystem {
        modules = [ self.nixosModules.cibnix ./hosts/hana ];
        inherit specialArgs;
      };
      yeoreum = inputs.nixpkgs.lib.nixosSystem {
        modules = [ self.nixosModules.cibnix ./hosts/yeoreum ];
        inherit specialArgs;
      };
    };

    nixosModules.cibnix = import ./modules;
  };
}
