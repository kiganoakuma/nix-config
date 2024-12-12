{ config, pkgs, ... }: {
  imports = [
    ./modules/homebrew.nix
    ./modules/system.nix
    ./modules/packages.nix
    ./modules/fonts.nix
  ];

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = "nix-command flakes";
  system.stateVersion = 5;
  nixpkgs.hostPlatform = "aarch64-darwin";
}
