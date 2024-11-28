{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    
    # Enable vi mode
    defaultKeymap = "viins";
    initExtra = ''
      # Vi mode settings
      bindkey -v
      export KEYTIMEOUT=1  # Reduce mode switch delay

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

      # Change cursor shape for different vi modes
      function zle-keymap-select {
        if [[ ''${KEYMAP} == vicmd ]] ||
           [[ $1 = 'block' ]]; then
          echo -ne '\e[1 q'  # Block cursor for normal mode
        elif [[ ''${KEYMAP} == main ]] ||
             [[ ''${KEYMAP} == viins ]] ||
             [[ ''${KEYMAP} = "" ]] ||
             [[ $1 = 'beam' ]]; then
          echo -ne '\e[5 q'  # Beam cursor for insert mode
        fi
      }
      zle -N zle-keymap-select

      # Use beam shape cursor on startup
      echo -ne '\e[5 q'

      # Use beam shape cursor for each new prompt
      preexec() { echo -ne '\e[5 q' ;}

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

      # Initialize Starship prompt
      eval "$(starship init zsh)"
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
      plugins = [
        "git"
        "docker"
        "docker-compose"
        "npm"
        "vi-mode"
      ];
      theme = "robbyrussell";
    };
  };
}
