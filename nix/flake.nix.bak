{ description = "zen nix-darwin system flake";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/8809585e6937d0b07fc066792c8c9abf9c3fe5c4";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, nix-homebrew }:
  let
    configuration = { pkgs, config, ... }: {

      nixpkgs.config.allowUnfree = true;
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages =
        [ pkgs.neovim
	        pkgs.tmux
      	  pkgs.mkalias
      	  pkgs.git
      	  pkgs.nodejs
          pkgs.python3Full
        ];

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

      fonts.packages = [
          (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
	];

      # Activation script to check for Xcode Command Line Tools
      system.activationScripts.checkXcode = pkgs.lib.mkForce ''
        echo "Checking if Xcode Command Line Tools are installed..."

        if ! xcode-select -p &>/dev/null; then
          echo "Xcode Command Line Tools not found. Installing..."
          xcode-select --install

          # Wait for the user to finish the installation if needed
          echo "Please complete the installation of Xcode Command Line Tools if prompted."
        else
          echo "Xcode Command Line Tools are already installed."
        fi
      '';

      system.activationScripts.applications.text = let
        env = pkgs.buildEnv {
          name = "system-applications";
          paths = config.environment.systemPackages;
          pathsToLink = "/Applications";
        };
      in
        pkgs.lib.mkForce ''
          # Set up applications.
          echo "setting up /Applications..." >&2
          rm -rf /Applications/Nix\ Apps
          mkdir -p /Applications/Nix\ Apps
          find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
          while read -r src; do
            app_name=$(basename "$src")
            echo "copying $src" >&2
            ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
          done
              '';

      # System Settings
      system.defaults = {
        dock.autohide = true; 
        trackpad.Clicking = true;
        dock.persistent-apps = 
          [
            "/Applications/Arc.app"
            "/Applications/Wezterm.app"
            "/Applications/Obsidian.app"
            "/System/Applications/Music.app"
            "/System/Applications/Mail.app"
            "/System/Applications/App\ Store.app"
            "/System/Applications/System\ Settings.app"
            
          ];
        finder.FXPreferredViewStyle = "clmv";
        NSGlobalDomain.AppleInterfaceStyle = "Dark";
        NSGlobalDomain.KeyRepeat = 5;
      };

      system.keyboard = {
      };

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Enable alternative shell support in nix-darwin.
      # programs.fish.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 5;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#simple
    darwinConfigurations."slim" = nix-darwin.lib.darwinSystem {
      modules = [ 
        configuration
        nix-homebrew.darwinModules.nix-homebrew
        {
          nix-homebrew = {
            enable = true;
            # apple silicon only
            enableRosetta = true;
            # user owning the Hombrew prefix
            user = "kiga";
	    autoMigrate = true;
          };
        }
      ];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."slim".pkgs;
  };
}
