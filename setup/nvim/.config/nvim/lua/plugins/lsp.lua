-- lua/plugins/lsp.lua
-- Only entry point for LSP setup: call require("lsp").setup() here.

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
