{
  description = "Darwin configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    mac-app-util.url = "github:hraban/mac-app-util";
  };

  outputs = inputs@{ nixpkgs, home-manager, darwin, mac-app-util, ... }: {
    darwinConfigurations."pakas-Mac-mini" = darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [
        ./modules/system/darwin.nix
        mac-app-util.darwinModules.default
        home-manager.darwinModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.paka = import ./modules/home;
            backupFileExtension = "backup";
            sharedModules = [
              mac-app-util.homeManagerModules.default
            ];
          };
        }
      ];
    };
  };
}
