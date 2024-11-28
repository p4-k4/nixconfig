{ config, lib, pkgs, ... }:

let
  wallpaperScript = pkgs.writeScriptBin "set-wallpaper" ''
    #!${pkgs.stdenv.shell}
    osascript -e '
      tell application "System Events"
        tell every desktop
          set picture to "${../../wallpaper.jpg}"
        end tell
      end tell'
  '';
in
{
  environment.systemPackages = [ wallpaperScript ];
  
  system.activationScripts.postActivation.text = ''
    # Set wallpaper
    echo "setting wallpaper..."
    $DRY_RUN_CMD ${wallpaperScript}/bin/set-wallpaper
  '';
}
