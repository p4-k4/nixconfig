{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Mac Apps
    eufy-security
    tapo-care
  ];
}
