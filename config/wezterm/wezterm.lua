local wezterm = require("wezterm")

-- Tokyo Night Dark colors
local colors = {
  bg = "#1a1b26",
  bg_dark = "#16161e",
  bg_highlight = "#292e42",
  terminal_black = "#414868",
  fg = "#c0caf5",
  fg_dark = "#a9b1d6",
  fg_gutter = "#3b4261",
  dark3 = "#545c7e",
  comment = "#565f89",
  dark5 = "#737aa2",
  blue0 = "#3d59a1",
  blue = "#7aa2f7",
  cyan = "#7dcfff",
  blue1 = "#2ac3de",
  blue2 = "#0db9d7",
  blue5 = "#89ddff",
  blue6 = "#b4f9f8",
  blue7 = "#394b70",
  magenta = "#bb9af7",
  magenta2 = "#ff007c",
  purple = "#9d7cd8",
  orange = "#ff9e64",
  yellow = "#e0af68",
  green = "#9ece6a",
  green1 = "#73daca",
  green2 = "#41a6b5",
  teal = "#1abc9c",
  red = "#f7768e",
  red1 = "#db4b4b",
}

return {
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
    
    -- Overrides the cell background color when the current cell is occupied by the
    -- cursor and the cursor style is set to Block
    cursor_bg = colors.fg,
    -- Overrides the text color when the current cell is occupied by the cursor
    cursor_fg = colors.bg,
    -- Specifies the border color of the cursor when the cursor style is set to Block,
    -- or the color of the vertical or horizontal bar when the cursor style is set to
    -- Bar or Underline.
    cursor_border = colors.fg,
    
    -- the foreground color of selected text
    selection_fg = colors.bg,
    -- the background color of selected text
    selection_bg = colors.fg_gutter,
    
    -- The color of the scrollbar "thumb"; the portion that represents the current viewport
    scrollbar_thumb = colors.terminal_black,
    
    -- The color of the split lines between panes
    split = colors.terminal_black,
    
    ansi = {
      colors.terminal_black,
      colors.red,
      colors.green,
      colors.yellow,
      colors.blue,
      colors.magenta,
      colors.cyan,
      colors.fg_dark,
    },
    brights = {
      colors.terminal_black,
      colors.red,
      colors.green,
      colors.yellow,
      colors.blue,
      colors.magenta,
      colors.cyan,
      colors.fg,
    },
    
    -- Indexed colors
    indexed = {
      [16] = colors.orange,
      [17] = colors.red1,
    },
  },
  
  -- Tab bar
  use_fancy_tab_bar = false,
  colors = {
    tab_bar = {
      background = colors.bg_dark,
      active_tab = {
        bg_color = colors.bg,
        fg_color = colors.fg,
      },
      inactive_tab = {
        bg_color = colors.bg_dark,
        fg_color = colors.dark5,
      },
      inactive_tab_hover = {
        bg_color = colors.bg_highlight,
        fg_color = colors.fg,
      },
      new_tab = {
        bg_color = colors.bg_dark,
        fg_color = colors.dark5,
      },
      new_tab_hover = {
        bg_color = colors.bg_highlight,
        fg_color = colors.fg,
      },
    },
  },
}
