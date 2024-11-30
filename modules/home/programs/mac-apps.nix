{ config, pkgs, ... }:

{
  homebrew = {
    enable = true;
    brews = [
      "elixir-ls"
    ];
    casks = [
      "flutter"
    ];
  };

  home.packages = with pkgs; [
    # Mac Apps
    eufy-security
    tapo-care
  ];
}
