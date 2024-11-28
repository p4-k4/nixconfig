return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "folke/neoconf.nvim", cmd = "Neoconf", config = false },
      "hrsh7th/cmp-nvim-lsp",
    },
    opts = {
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = {
          spacing = 4,
          source = "if_many",
          prefix = "●",
        },
        severity_sort = true,
      },
      -- LSP servers are installed and managed by Nix
      servers = {
        -- Languages
        lua_ls = {
          settings = {
            Lua = {
              workspace = { 
                checkThirdParty = false,
                library = {
                  [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                  [vim.fn.stdpath("config") .. "/lua"] = true,
                },
              },
              telemetry = { enable = false },
              diagnostics = {
                globals = { "vim" },
              },
            },
          },
        },
        nil_ls = {}, -- Nix
        tsserver = {},
        html = {},
        cssls = {},
        jsonls = {},
        eslint = {},
        tailwindcss = {},
        svelte = {},
        astro = {},
        elixirls = {
          cmd = { "elixir-ls" },
        },
        gopls = {},
        rust_analyzer = {},
        clangd = {},
      },
    },
    config = function(_, opts)
      -- Setup diagnostics
      vim.diagnostic.config(opts.diagnostics)

      -- Setup keymaps
      local on_attach = function(_, bufnr)
        local map = function(keys, func, desc)
          vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
        end

        map("gd", vim.lsp.buf.definition, "Go to Definition")
        map("gr", vim.lsp.buf.references, "Go to References")
        map("gD", vim.lsp.buf.declaration, "Go to Declaration")
        map("gI", vim.lsp.buf.implementation, "Go to Implementation")
        map("K", vim.lsp.buf.hover, "Hover Documentation")
        map("gK", vim.lsp.buf.signature_help, "Signature Documentation")
        map("<leader>ca", vim.lsp.buf.code_action, "Code Action")
        map("<leader>rn", vim.lsp.buf.rename, "Rename")
      end

      -- Setup capabilities
      local capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        require("cmp_nvim_lsp").default_capabilities(),
        opts.capabilities or {}
      )

      -- Setup each LSP server
      for server, server_opts in pairs(opts.servers) do
        local final_opts = vim.tbl_deep_extend("force", {
          capabilities = vim.deepcopy(capabilities),
          on_attach = on_attach,
        }, server_opts or {})

        require("lspconfig")[server].setup(final_opts)
      end
    end,
  },
}
