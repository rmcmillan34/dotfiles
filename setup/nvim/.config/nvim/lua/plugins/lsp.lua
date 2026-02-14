return {
  { "neovim/nvim-lspconfig" },

  { "williamboman/mason.nvim", cmd = "Mason", config = true },
  { "williamboman/mason-lspconfig.nvim", dependencies = { "mason.nvim" }, config = true },

  -- Completion (minimal)
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "L3MON4D3/LuaSnip" },
  { "saadparwaiz1/cmp_luasnip" },

  {
    "neovim/nvim-lspconfig",
    dependencies = { "mason.nvim", "mason-lspconfig.nvim", "nvim-cmp" },
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      require("mason-lspconfig").setup({
        ensure_installed = { "pyright", "clangd", "lua_ls", "texlab", "marksman" },
        automatic_installation = true,
      })

      -- Python
      lspconfig.pyright.setup({ capabilities = capabilities })

      -- C/C++
      lspconfig.clangd.setup({ capabilities = capabilities })

      -- Lua (Neovim config)
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
          },
        },
      })

      -- Markdown
      lspconfig.marksman.setup({ capabilities = capabilities })

      -- LaTeX
      lspconfig.texlab.setup({ capabilities = capabilities })
    end,
  },
}
