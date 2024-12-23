{ config, lib, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;

    initExtra = ''
      # Initialize autojump
      source ${pkgs.autojump}/share/autojump/autojump.zsh

      # Use vim keys in tab complete menu
      bindkey -M menuselect 'h' vi-backward-char
      bindkey -M menuselect 'k' vi-up-line-or-history
      bindkey -M menuselect 'l' vi-forward-char
      bindkey -M menuselect 'j' vi-down-line-or-history

      # Better searching in command mode
      bindkey -M vicmd '?' history-incremental-search-backward
      bindkey -M vicmd '/' history-incremental-search-forward
      bindkey -M vicmd 'k' up-line-or-beginning-search
      bindkey -M vicmd 'j' down-line-or-beginning-search

      # Beginning search with arrow keys
      bindkey "^[OA" up-line-or-beginning-search
      bindkey "^[OB" down-line-or-beginning-search
      bindkey "^[[A" up-line-or-beginning-search
      bindkey "^[[B" down-line-or-beginning-search

      # Edit command in vim with 'v'
      autoload -Uz edit-command-line
      zle -N edit-command-line
      bindkey -M vicmd v edit-command-line

      # Flutter development helpers
      function fclean() {
        echo "🧹 Cleaning Flutter project..."
        flutter clean
        flutter pub get
        pod install --repo-update
        echo "✨ Clean complete!"
      }

      function ftest() {
        echo "🧪 Running Flutter tests..."
        flutter test --coverage
        echo "✅ Tests complete!"
      }

      # Elixir development helpers
      function mtest() {
        echo "🧪 Running Elixir tests..."
        mix test
        echo "✅ Tests complete!"
      }

      function msetup() {
        echo "🔧 Setting up Elixir project..."
        mix deps.get
        mix compile
        mix ecto.setup
        echo "✨ Setup complete!"
      }
    '';

    shellAliases = {
      # General
      ll = "ls -la";
      ".." = "cd ..";
      "..." = "cd ../..";

      # Git
      "gst" = "git status";
      "gco" = "git checkout";
      "gcm" = "git commit -m";
      "gaa" = "git add .";
      "gp" = "git push";

      # Flutter
      "fr" = "flutter run";
      "fpg" = "flutter pub get";
      "fpr" = "flutter pub run";

      # Elixir
      "mt" = "mix test";
      "mps" = "mix phx.server";
      "mdg" = "mix deps.get";
      "mec" = "mix ecto.create";
      "mem" = "mix ecto.migrate";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [ "autojump" "git" "docker" "docker-compose" "npm" "vi-mode" ];
      theme = "robbyrussell";
    };
  };
}
