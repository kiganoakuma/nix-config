{ pkgs, config, ... }: {
  system.defaults = {
    dock.autohide = true;
    trackpad.Clicking = true;
    dock.persistent-apps = [
      "/Applications/Arc.app"
      "/Applications/Wezterm.app"
      "/Applications/Obsidian.app"
      "/System/Applications/Music.app"
      "/System/Applications/Mail.app"
      "/System/Applications/App Store.app"
      "/System/Applications/System Settings.app"
    ];
    finder.FXPreferredViewStyle = "clmv";
    NSGlobalDomain.AppleInterfaceStyle = "Dark";
    NSGlobalDomain.KeyRepeat = 5;
  };

  system.keyboard = { };

  # Applications setup
  system.activationScripts.applications.text = let
    env = pkgs.buildEnv {
      name = "system-applications";
      paths = config.environment.systemPackages;
      pathsToLink = "/Applications";
    };
  in
    pkgs.lib.mkForce ''
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


}
