{ pkgs, ... }: {
  environment.systemPackages = [
    pkgs.neovim
    pkgs.tmux
    pkgs.mkalias
    pkgs.git
    pkgs.nodejs
    pkgs.python3Full
  ];
}
