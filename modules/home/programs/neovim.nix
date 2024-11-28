{ config, pkgs, ... }:

let
  nvimConfigDir = ../../../config/nvim;
in
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    # Install needed packages
    extraPackages = with pkgs; [
      # LSP servers
      lua-language-server        # lua_ls
      nil                       # nil_ls (Nix)
      nodePackages.typescript-language-server  # tsserver
      nodePackages.vscode-langservers-extracted  # html, css, json, eslint
      nodePackages."@tailwindcss/language-server"  # tailwindcss
      nodePackages.svelte-language-server  # svelte
      nodePackages."@astrojs/language-server"  # astro
      elixir-ls
      gopls
      rust-analyzer
      clang-tools  # clangd
      
      # Formatters and linters
      stylua       # Lua formatting
      nixfmt       # Nix formatting
      prettierd    # Web formatting
      eslint_d     # JavaScript/TypeScript linting
      
      # Tools
      ripgrep      # Required for telescope
      fd           # Required for telescope
      tree-sitter  # Required for treesitter
    ];
  };

  # Link our LazyVim config
  xdg.configFile."nvim" = {
    source = nvimConfigDir;
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
