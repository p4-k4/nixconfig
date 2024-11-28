{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    # Install needed packages
    extraPackages = with pkgs; [
      # LSP servers and tools
      lua-language-server
      nil # Nix LSP
      nodePackages.typescript-language-server
      nodePackages.vscode-langservers-extracted # html, css, json, eslint
      ripgrep
      fd
      tree-sitter
      stylua
    ];
  };

  # Link our LazyVim config
  xdg.configFile."nvim" = {
    source = ../../../../config/nvim;
    recursive = true;
  };

  # Create required directories
  xdg = {
    enable = true;
    configHome = "${config.home.homeDirectory}/.config";
    dataHome = "${config.home.homeDirectory}/.local/share";
    stateHome = "${config.home.homeDirectory}/.local/state";
    cacheHome = "${config.home.homeDirectory}/.cache";
  };
}
