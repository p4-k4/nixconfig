return {
  -- Disable mason and related plugins
  { "williamboman/mason.nvim", enabled = false },
  { "williamboman/mason-lspconfig.nvim", enabled = false },
  { "jay-babu/mason-null-ls.nvim", enabled = false },
  { "jay-babu/mason-nvim-dap.nvim", enabled = false },
  
  -- Configure LSP directly (without mason)
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- LSP servers are installed and managed by Nix
      servers = {
        -- Web development
        tsserver = {},
        html = {},
        cssls = {},
        jsonls = {},
        eslint = {},
        tailwindcss = {},
        svelte = {},
        astro = {},

        -- System/General
        lua_ls = {},
        nil_ls = {},  -- Nix
        clangd = {},
        
        -- Additional languages
        elixirls = {
          -- Mason usually handles this, but since we're using nix:
          cmd = { "elixir-ls" },
        },
        gopls = {},
        rust_analyzer = {},
      },
    },
  },

  -- Configure formatters and linters directly
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        nix = { "nixfmt" },
        javascript = { { "prettierd", "prettier" } },
        typescript = { { "prettierd", "prettier" } },
        javascriptreact = { { "prettierd", "prettier" } },
        typescriptreact = { { "prettierd", "prettier" } },
        svelte = { { "prettierd", "prettier" } },
        css = { { "prettierd", "prettier" } },
        html = { { "prettierd", "prettier" } },
        json = { { "prettierd", "prettier" } },
        yaml = { { "prettierd", "prettier" } },
        markdown = { { "prettierd", "prettier" } },
      },
    },
  },

  -- Configure linting
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        javascript = { "eslint_d" },
        typescript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        typescriptreact = { "eslint_d" },
        svelte = { "eslint_d" },
      },
    },
  },
}
