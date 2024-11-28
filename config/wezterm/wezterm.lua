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
  font = wezterm.font("JetBrainsMono Nerd Font"),
  font_size = 13.0,
  
  -- Window configuration
  window_background_opacity = 0.95,
  window_decorations = "RESIZE",
  window_padding = {
    left = 5,
    right = 5,
    top = 5,
    bottom = 5,
  },
  
  -- Color scheme
  colors = {
    -- The default text color
    foreground = colors.fg,
    -- The default background color
    background = colors.bg,
    
    -- Cursor colors
    cursor_bg = colors.fg,
    cursor_fg = colors.bg,
    cursor_border = colors.fg,
    
    -- Selection colors
    selection_fg = colors.fg,
    selection_bg = colors.bg_visual,
    
    -- Scrollbar colors
    scrollbar_thumb = colors.bg_highlight,
    
    -- Split colors
    split = colors.blue,
    
    -- The color of the compose cursor
    compose_cursor = colors.terminal.yellow,

    -- Basic Colors (index 0-7)
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

    -- Bright Colors (index 8-15)
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

    -- Tab bar colors
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
}

return config
