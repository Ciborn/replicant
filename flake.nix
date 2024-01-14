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
      home-manager = inputs.home-manager;
      nixos-hardware = inputs.nixos-hardware;
      username = "robinb";
    };
  in {
    nixosConfigurations = {
      donghoon = inputs.nixpkgs.lib.nixosSystem {
        modules = [ self.nixosModules.cibnix ./hosts/donghoon ];
        specialArgs = specialArgs // { nixpkgs = inputs.nixpkgs; };
      };
      emil = inputs.nixpkgs.lib.nixosSystem {
        modules = [ self.nixosModules.cibnix ./hosts/emil ];
        specialArgs = specialArgs // { nixpkgs = inputs.nixpkgs; };
      };
      hana = inputs.nixpkgs.lib.nixosSystem {
        modules = [ self.nixosModules.cibnix ./hosts/hana ];
        specialArgs = specialArgs // { aagl = inputs.aagl; };
      };
      yeoreum = inputs.nixpkgs.lib.nixosSystem {
        modules = [ self.nixosModules.cibnix ./hosts/yeoreum ];
        inherit specialArgs;
      };
    };

    nixosModules.cibnix = import ./modules;
  };
}
