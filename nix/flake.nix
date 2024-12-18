{
  description = "zen nix-darwin system flake";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
  };


  outputs = inputs@{ self, nix-darwin, nixpkgs, nix-homebrew, home-manager, ... }:
  {
    darwinConfigurations."slim" = nix-darwin.lib.darwinSystem {
      modules = [ 
        ./darwin.nix
        
        nix-homebrew.darwinModules.nix-homebrew
        {
          nix-homebrew = {
            enable = true;
            enableRosetta = true;
            user = "kiga";
            autoMigrate = true;
          };
        }
      ];
    };

    darwinPackages = self.darwinConfigurations."slim".pkgs;
  };
}
