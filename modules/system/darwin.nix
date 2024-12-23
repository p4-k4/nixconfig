{ pkgs, ... }: {
  imports = [ ./wallpaper.nix ];

  # System Configuration
  system.defaults = {
    dock = {
      autohide = true;
      show-recents = false;
      mineffect = "scale";
      minimize-to-application = true;
    };

    # Finder settings
    finder = {
      AppleShowAllExtensions = true;
      FXEnableExtensionChangeWarning = false;
      _FXShowPosixPathInTitle = true;
    };

    # System-wide settings
    NSGlobalDomain = {
      AppleInterfaceStyle = "Dark"; # Force dark mode
      AppleShowScrollBars = "WhenScrolling";
      InitialKeyRepeat = 12; # Normal minimum is 15 (225 ms)
      KeyRepeat = 1; # Normal minimum is 2 (30 ms)
      NSAutomaticCapitalizationEnabled = false;
      NSAutomaticDashSubstitutionEnabled = false;
      NSAutomaticPeriodSubstitutionEnabled = false;
      NSAutomaticQuoteSubstitutionEnabled = false;
      NSAutomaticSpellingCorrectionEnabled = false;
      NSNavPanelExpandedStateForSaveMode = true;
      NSNavPanelExpandedStateForSaveMode2 = true;
      NSTableViewDefaultSizeMode = 2;
      NSTextShowsControlCharacters = true;
      NSUseAnimatedFocusRing = false;
      NSWindowResizeTime = 1.0e-3;
      PMPrintingExpandedStateForPrint = true;
      PMPrintingExpandedStateForPrint2 = true;
    };

    # Login window settings
    loginwindow = {
      GuestEnabled = false;
      DisableConsoleAccess = true;
    };

    # Spaces settings
    spaces.spans-displays = false;
  };

  # System Configuration
  system.stateVersion = 4;

  # Nix Configuration
  services.nix-daemon.enable = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Environment Configuration
  environment.systemPackages = with pkgs; [ neovim autojump gh ffmpeg ];

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
    taps = [ "nikitabobko/tap" ];
    brews = [ 
      "mas"
      "elixir-ls"
      "postgresql@17"
    ];
    casks = [
      "nikitabobko/tap/aerospace"
      "wezterm"
      "google-chrome"
      "flutter"
      "claude"
      "discord"
    ];
    masApps = {
      "eufy Security" = 1424956516;
      "Tapo" = 1472718009;
    };
  };

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";
}
