# Install nix package manger

```
sh <(curl -L https://nixos.org/nix/install)
```

# download dotfiles repo

```
nix-shell -p git --run 'git clone https://github.com/kiganoakuma/dotfiles.git .dotfiles'

```

# install nix_darwin config

```

nix run nix-darwin --extra-experimental-features "nix-command flakes" -- switch --flake ~/dotfiles/.config/nix#slim

```
