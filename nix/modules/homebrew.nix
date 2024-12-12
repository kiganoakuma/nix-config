{ pkgs, ... }: {
  homebrew = {
    enable = true;
    brews = [
      "mas"
      "fd"
      "entr"
      "tmux"
      "powerlevel10k"
      "fzf"
      "zoxide"
      "ripgrep"
      "ast-grep"
      "bat"
      "eza"
      "stow"
      "lazygit"
      "gh"
      "nmap"
      "pandoc"
    ];
    casks = [
      "wezterm"
      "the-unarchiver"
      "arc"
      "desktoppr"
      "obsidian"
    ];
    masApps = {
      "Magnet" = 441258766;
      "Tailscale" = 1475387142;
      "NordVpn" = 905953485;
    };
    onActivation.cleanup = "zap";
    onActivation.autoUpdate = true;
    onActivation.upgrade = true;
  };
}
