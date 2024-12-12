{ config, pkgs, ... }:

{
  homebrew = {
    enable = true;
    brews = [ "elixir-ls" "postgresql@17" ];
    casks = [ "flutter" "claude" "discord" ];
  };

  home.packages = with pkgs; [
    # Mac Apps
    eufy-security
    tapo-care
  ];
}
