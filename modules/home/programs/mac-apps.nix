{ config, pkgs, ... }:

{
  homebrew = {
    enable = true;
    brews = [ "elixir-ls" ];
    casks = [ "flutter" "claude" ];
  };

  home.packages = with pkgs; [
    # Mac Apps
    eufy-security
    tapo-care
  ];
}
