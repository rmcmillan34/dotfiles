-- ~/.config/nvim/lua/mason-setup.lua

local M = {}

function M.setup()
  -- Ensure both plugins are loaded before use
  require("mason").setup()
  require("mason-lspconfig")  -- force-load before setup call

  require("mason-lspconfig").setup({
    ensure_installed = {
      -- Shell & scripting
      "bashls",
      "powershell_es",

      -- Web & frontend
      "html", "cssls", "jsonls", "yamlls",

      -- Backend
      "pyright", "intelephense",

      -- Systems & low‑level
      "clangd",

      -- Enterprise & languages
      "jdtls", "omnisharp",

      -- Modern & “other” languages
      "rust_analyzer",

      -- Infra‑as‑code
      "dockerls", "terraformls", "ansiblels", "taplo", "awk_ls",

      -- Data, docs & misc
      "sqlls", "marksman", "lua_ls", "texlab", "grammarly",
    },
  })
end

return M

