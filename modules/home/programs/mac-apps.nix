{ config, pkgs, ... }:

{
  homebrew = {
    enable = true;
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
