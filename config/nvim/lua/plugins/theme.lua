return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "night",
      transparent = false,
      terminal_colors = true,
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        sidebars = "dark",
        floats = "dark",
      },
      sidebars = {
        "qf",
        "vista_kind",
        "terminal",
        "packer",
        "spectre_panel",
        "telescrope",
        "help",
      },
      on_colors = function(colors)
        -- Customize colors here if needed
      end,
      on_highlights = function(highlights, colors)
        -- Customize highlights here if needed
      end,
    },
    config = function(_, opts)
      require("tokyonight").setup(opts)
      -- Load the colorscheme
      vim.cmd([[colorscheme tokyonight]])
    end,
  },

  -- Configure other UI elements to match theme
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        theme = "tokyonight",
      },
    },
  },

  {
    "akinsho/bufferline.nvim",
    opts = {
      highlights = require("tokyonight.colors").setup(),
    },
  },
}
