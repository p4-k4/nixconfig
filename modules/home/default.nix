{ config, pkgs, ... }:

{
  imports = [
    ./shell.nix
    ./programs/neovim.nix
    ./programs/wezterm.nix
    ./programs/aerospace.nix
    ./programs/neovide.nix
  ];

  home = {
    username = "paka";
    homeDirectory = "/Users/paka";
    stateVersion = "23.11";

    packages = with pkgs; [
      # Development tools
      git
      gh
      ripgrep
      fd
      tree
      jq

      # Flutter/Dart Development
      flutter
      dart
      cocoapods
      android-tools
      
      # Elixir Development
      beam.packages.erlang_26.elixir
      beam.packages.erlang_26.erlang
      elixir-ls
      mix2nix # For converting mix.lock to nix
      
      # Build tools
      pkg-config
      cmake
      ninja

      # System tools
      htop
      wget
      curl
      
      # Shell enhancements
      starship # Modern prompt
    ];
  };

  # Configure Starship prompt
  programs.starship = {
    enable = true;
    settings = {
      # Tokyo Night inspired theme
      palette = "tokyo-night";
      palettes.tokyo-night = {
        background = "#1a1b26";
        foreground = "#c0caf5";
        blue = "#7aa2f7";
        cyan = "#7dcfff";
        green = "#9ece6a";
        magenta = "#bb9af7";
        red = "#f7768e";
        yellow = "#e0af68";
      };

      # Minimal but informative configuration
      add_newline = true;
      character = {
        success_symbol = "[󰄾](blue)";
        error_symbol = "[󰄾](red)";
      };
      
      directory = {
        style = "blue";
        truncation_length = 3;
        truncate_to_repo = true;
      };

      git_branch = {
        symbol = " ";
        style = "magenta";
      };

      git_status = {
        style = "red";
        ahead = "⇡\${count}";
        behind = "⇣\${count}";
        diverged = "⇕⇡\${ahead_count}⇣\${behind_count}";
        modified = "!";
      };

      elixir = {
        symbol = " ";
        style = "magenta";
      };

      dart = {
        symbol = " ";
        style = "blue";
      };

      flutter = {
        symbol = "󰝚 ";
        style = "blue";
      };
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
