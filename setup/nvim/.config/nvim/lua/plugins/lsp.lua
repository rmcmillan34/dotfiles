-- lua/plugins/lsp.lua
-- Lazy.nvim plugin spec for LSP stack. This is the only place that should call require("lsp").setup().

return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      -- Installer / registry
      { "williamboman/mason.nvim", config = true },
      "williamboman/mason-lspconfig.nvim",

      -- Optional: nicer status updates (safe to include)
      { "j-hui/fidget.nvim", opts = {} },

      -- Capabilities for completion (works with your completion module)
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      require("lsp").setup()
    end,
  },
}

