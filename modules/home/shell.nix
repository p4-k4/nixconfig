{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
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

      # Change cursor shape for different vi modes
      function zle-keymap-select {
        if [[ ''${KEYMAP} == vicmd ]] ||
           [[ $1 = 'block' ]]; then
          echo -ne '\e[1 q'
        elif [[ ''${KEYMAP} == main ]] ||
             [[ ''${KEYMAP} == viins ]] ||
             [[ ''${KEYMAP} = "" ]] ||
             [[ $1 = 'beam' ]]; then
          echo -ne '\e[5 q'
        fi
      }
      zle -N zle-keymap-select

      # Use beam shape cursor on startup
      echo -ne '\e[5 q'

      # Use beam shape cursor for each new prompt
      preexec() { echo -ne '\e[5 q' ;}
    '';

    shellAliases = {
      ll = "ls -la";
      ".." = "cd ..";
      "..." = "cd ../..";
      "gst" = "git status";
      "gco" = "git checkout";
      "gcm" = "git commit -m";
      "gaa" = "git add .";
      "gp" = "git push";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "docker"
        "docker-compose"
        "npm"
        "vi-mode"  # Enable vi-mode plugin
      ];
      theme = "robbyrussell";
    };
  };
}
