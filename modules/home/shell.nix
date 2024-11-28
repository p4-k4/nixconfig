{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "macos" ];
      theme = "robbyrussell";
    };

    plugins = [
      {
        name = "zsh-autosuggestions";
        src = pkgs.zsh-autosuggestions;
      }
      {
        name = "zsh-completions";
        src = pkgs.zsh-completions;
      }
    ];

    shellAliases = {
      ll = "ls -la";
      ".." = "cd ..";
    };
  };

  programs.autojump.enable = true;

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    zsh-autosuggestions
    zsh-completions
  ];
}
