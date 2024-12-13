{ config, lib, pkgs, ... }:

{
  xdg.configFile."aerospace/aerospace.toml" = {
    text = ''
      # AeroSpace Configuration
      after-login-command = []
      after-startup-command = [
        "exec-and-forget osascript -e 'tell application \"eufy Security\" to activate'",
        "exec-and-forget osascript -e 'tell application \"TP-Link Tapo\" to activate'"
      ]
      start-at-login = true

      # Normalizations
      enable-normalization-flatten-containers = true
      enable-normalization-opposite-orientation-for-nested-containers = true

      # Layout settings
      accordion-padding = 30
      default-root-container-layout = 'tiles'
      default-root-container-orientation = 'auto'
      key-mapping.preset = 'qwerty'

      # Mouse follows focus
      on-focused-monitor-changed = ['move-mouse monitor-lazy-center']

      # Window rules using callbacks
      [[on-window-detected]]
      if.app-name-regex-substring = "eufy Security"
      run = ['layout floating', 'move-node-to-workspace 5']

      [[on-window-detected]]
      if.app-name-regex-substring = "Tapo"
      run = ['layout floating', 'move-node-to-workspace 5']

      # Gaps configuration
      [gaps]
      inner.horizontal = 10
      inner.vertical = 10
      outer.left = 10
      outer.bottom = 10
      outer.top = 10
      outer.right = 10


      [workspace-to-monitor-force-assignment]
      1 = 'Q32V3WG5'
      2 = 'Q32V3WG5'
      3 = 'Q32V3WG5'
      4 = 'PHL 223V7'
      5 = 'PHL 223V7'
      # 0 = 'PHL 223V7'

      # Main mode bindings
      [mode.main.binding]
      alt-slash = 'layout tiles horizontal vertical'
      alt-comma = 'layout accordion horizontal vertical'

      # Focus
      alt-h = 'focus left'
      alt-j = 'focus down'
      alt-k = 'focus up'
      alt-l = 'focus right'

      # Move
      alt-shift-h = 'move left'
      alt-shift-j = 'move down'
      alt-shift-k = 'move up'
      alt-shift-l = 'move right'

      # Resize
      alt-shift-minus = 'resize smart -50'
      alt-shift-equal = 'resize smart +50'


      # Workspaces
      alt-1 = 'workspace 1'
      alt-2 = 'workspace 2'
      alt-3 = 'workspace 3'
      alt-4 = 'workspace 4'
      alt-5 = 'workspace 5'
      # alt-0 = 'workspace 6'

      # Move to workspace
      alt-shift-1 = ['move-node-to-workspace 1', 'workspace 1']
      alt-shift-2 = 'move-node-to-workspace 2'
      alt-shift-3 = 'move-node-to-workspace 3'
      alt-shift-4 = 'move-node-to-workspace 4'
      alt-shift-5 = 'move-node-to-workspace 5'
      # alt-shift-0 = 'move-node-to-workspace 6'

      # Quick workspace switching
      alt-tab = 'workspace-back-and-forth'
      alt-shift-tab = 'move-workspace-to-monitor --wrap-around next'

      # Service mode
      alt-shift-semicolon = 'mode service'

      # Service mode bindings
      [mode.service.binding]
      esc = ['reload-config', 'mode main']
      r = ['flatten-workspace-tree', 'mode main']
      f = ['layout floating tiling', 'mode main']
      backspace = ['close-all-windows-but-current', 'mode main']

      alt-shift-h = ['join-with left', 'mode main']
      alt-shift-j = ['join-with down', 'mode main']
      alt-shift-k = ['join-with up', 'mode main']
      alt-shift-l = ['join-with right', 'mode main']
    '';
  };
}
