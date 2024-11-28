{ config, pkgs, ... }:

{
  imports = [
    ./shell.nix
    ./programs/neovim.nix
  ];

  # Common home-manager configuration
  home = {
    stateVersion = "23.11";
    username = "paka";
    homeDirectory = "/Users/paka";
  };

  # Let Home Manager install and manage itself
  programs.home-manager.enable = true;
}
