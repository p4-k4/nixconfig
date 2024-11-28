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

      # System tools
      htop
      wget
      curl
    ];
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
