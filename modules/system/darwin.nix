{ pkgs, ... }: {
  # System Configuration
  system.defaults.dock.autohide = true;
  system.stateVersion = 4;

  # Nix Configuration
  services.nix-daemon.enable = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  # Environment Configuration
  environment.systemPackages = with pkgs; [
    neovim
    autojump
    gh  # Added GitHub CLI
  ];

  # User Configuration
  users.users.paka = {
    name = "paka";
    home = "/Users/paka";
  };

  # Programs Configuration
  programs.zsh.enable = true;

  # Homebrew Configuration
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      cleanup = "zap";
      upgrade = true;
    };
    taps = [
      "nikitabobko/tap"
    ];
    brews = [
      "mas"
    ];
    casks = [
      "nikitabobko/tap/aerospace"
      "wezterm"
    ];
    masApps = {
      "eufy Security" = 1501114405;
      "TP-Link Tapo" = 1472722739;
    };
  };

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";
}
