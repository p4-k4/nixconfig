{ config, lib, pkgs, ... }:

{
  home.file.".config/wezterm" = {
    source = ../../../config/wezterm;
    recursive = true;
  };

  # Install JetBrainsMono Nerd Font
  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];
}
