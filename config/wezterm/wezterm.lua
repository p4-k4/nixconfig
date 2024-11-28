local wezterm = require("wezterm")

-- Tokyo Night colors
local colors = {
  bg = "#1a1b26",
  bg_dark = "#16161e",
  bg_highlight = "#292e42",
  bg_visual = "#33467c",
  terminal = {
    black = "#15161e",
    red = "#f7768e",
    green = "#9ece6a",
    yellow = "#e0af68",
    blue = "#7aa2f7",
    magenta = "#bb9af7",
    cyan = "#7dcfff",
    white = "#a9b1d6",
    black_bright = "#414868",
    red_bright = "#f7768e",
    green_bright = "#9ece6a",
    yellow_bright = "#e0af68",
    blue_bright = "#7aa2f7",
    magenta_bright = "#bb9af7",
    cyan_bright = "#7dcfff",
    white_bright = "#c0caf5",
  },
  dark3 = "#545c7e",
  blue = "#7aa2f7",
  fg = "#c0caf5",
}

local config = {
  -- Font configuration
  font = wezterm.font {
    family = "JetBrainsMono Nerd Font",
    weight = "Medium",
    harfbuzz_features = { "calt=1", "ss01=1", "ss02=1", "ss03=1", "ss04=1", "ss05=1", "ss06=1",
      "ss07=1", "ss08=1", "cv01=1", "cv02=1", "cv03=1", "cv04=1", "liga=1", "dlig=1" },
  },
  font_size = 13.0,
  line_height = 1.2,
  cell_width = 1.0,
  
  -- Window configuration
  window_background_opacity = 0.85,
  macos_window_background_blur = 30,
  window_decorations = "RESIZE",
  window_padding = {
    left = 5,
    right = 5,
    top = 5,
    bottom = 5,
  },
  
  -- Animation and performance
  animation_fps = 60,
  max_fps = 60,
  front_end = "WebGpu",
  webgpu_power_preference = "HighPerformance",
  
  -- Color scheme
  colors = {
    foreground = colors.fg,
    background = colors.bg,
    cursor_bg = colors.fg,
    cursor_fg = colors.bg,
    cursor_border = colors.fg,
    selection_fg = colors.fg,
    selection_bg = colors.bg_visual,
    scrollbar_thumb = colors.bg_highlight,
    split = colors.blue,
    compose_cursor = colors.terminal.yellow,

    ansi = {
      colors.terminal.black,
      colors.terminal.red,
      colors.terminal.green,
      colors.terminal.yellow,
      colors.terminal.blue,
      colors.terminal.magenta,
      colors.terminal.cyan,
      colors.terminal.white,
    },

    brights = {
      colors.terminal.black_bright,
      colors.terminal.red_bright,
      colors.terminal.green_bright,
      colors.terminal.yellow_bright,
      colors.terminal.blue_bright,
      colors.terminal.magenta_bright,
      colors.terminal.cyan_bright,
      colors.terminal.white_bright,
    },

    tab_bar = {
      background = colors.bg_dark,
      active_tab = {
        bg_color = colors.blue,
        fg_color = colors.bg_dark,
        intensity = "Bold",
      },
      inactive_tab = {
        bg_color = colors.bg_highlight,
        fg_color = colors.dark3,
      },
      inactive_tab_hover = {
        bg_color = colors.bg_highlight,
        fg_color = colors.blue,
      },
      new_tab = {
        bg_color = colors.bg,
        fg_color = colors.blue,
      },
      new_tab_hover = {
        bg_color = colors.bg,
        fg_color = colors.blue,
        intensity = "Bold",
      },
    },
  },

  -- Tab bar configuration
  use_fancy_tab_bar = false,
  tab_bar_at_bottom = false,
  hide_tab_bar_if_only_one_tab = false,
  tab_max_width = 25,
  
  -- Custom tab bar format
  tab_bar_style = {
    new_tab = " + ",
    new_tab_hover = " + ",
  },
  
  -- Cursor configuration
  default_cursor_style = "SteadyBar",
  cursor_blink_rate = 800,
  
  -- Enable native macOS IME
  use_ime = true,
  
  -- Disable annoying default keybindings
  disable_default_key_bindings = true,
  
  -- Custom key bindings
  keys = {
    -- Tab management
    { key = "t", mods = "CMD", action = wezterm.action.SpawnTab("CurrentPaneDomain") },
    { key = "w", mods = "CMD", action = wezterm.action.CloseCurrentTab { confirm = false } },
    
    -- Window management
    { key = "n", mods = "CMD", action = wezterm.action.SpawnWindow },
    
    -- Font size
    { key = "=", mods = "CMD", action = wezterm.action.IncreaseFontSize },
    { key = "-", mods = "CMD", action = wezterm.action.DecreaseFontSize },
    { key = "0", mods = "CMD", action = wezterm.action.ResetFontSize },
  },
}

return config
