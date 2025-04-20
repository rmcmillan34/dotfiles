-- ~/.config/nvim/lua/mason-setup.lua

local M = {}

function M.setup()
  -- 1) Start Mason’s registry/UI
  require("mason").setup()

  -- 2) Tell mason-lspconfig which servers to ensure are installed
  require("mason-lspconfig").setup({
    ensure_installed = {
      -- Shell & scripting
      "bashls",
      "powershell_es",

      -- Web & frontend
      "html",
      "cssls",
      "jsonls",
      "yamlls",

      -- Backend
      "pyright",
      "intelephense",

      -- Systems & low‑level
      "clangd",

      -- Enterprise & languages
      "jdtls",
      "omnisharp",

      -- Modern & “other” languages
      "rust_analyzer",

      -- Infra‑as‑code
      "dockerls",
      "terraformls",
      "ansiblels",
      "yamlls",
      "taplo",
      "awk_ls",

      -- Data, docs & misc
      "sqlls",
      "marksman",
      "lua_ls",
      "texlab",
      "grammarly",
    },
  })
end

return M
