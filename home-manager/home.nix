# home.nix
{ config, pkgs, ... }: {
  home.stateVersion = "23.11";
  
  home.file = {
    "." = {
      source = ./dotfiles;  # Points directly to your zshrc file
    };
    
  };
                       };
}
