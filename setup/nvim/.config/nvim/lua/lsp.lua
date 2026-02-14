-- lua/lsp.lua
-- Central LSP setup (mason + lspconfig), compatible with older mason-lspconfig versions.

local M = {}

M.setup = function()
  local lspconfig = require("lspconfig")

  -- Capabilities (enable better completion integration if cmp is installed)
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  local ok_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
  if ok_cmp then
    capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
  end

  -- Buffer-local keymaps only when a server attaches
  local on_attach = function(_, bufnr)
    local map = function(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
    end

    map("n", "gd", vim.lsp.buf.definition, "LSP: Go to definition")
    map("n", "gD", vim.lsp.buf.declaration, "LSP: Go to declaration")
    map("n", "gr", vim.lsp.buf.references, "LSP: References")
    map("n", "gi", vim.lsp.buf.implementation, "LSP: Implementation")
    map("n", "K", vim.lsp.buf.hover, "LSP: Hover")
    map("n", "<leader>rn", vim.lsp.buf.rename, "LSP: Rename")
    map("n", "<leader>ca", vim.lsp.buf.code_action, "LSP: Code action")
    map("n", "<leader>df", vim.diagnostic.open_float, "Diag: Float")
    map("n", "[d", vim.diagnostic.goto_prev, "Diag: Prev")
    map("n", "]d", vim.diagnostic.goto_next, "Diag: Next")

    -- Inlay hints (Neovim 0.10+)
    if vim.lsp.inlay_hint then
      vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
    end
  end

-- Mason setup
  require("mason").setup()

  local mlsp = require("mason-lspconfig")
  mlsp.setup({
    ensure_installed = {
      "lua_ls",
      "pyright",
      "clangd",
      "texlab",
      "marksman",
    },
    automatic_installation = true,
  })

  -- Per-server overrides
  local server_opts = {
    lua_ls = {
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
        },
      },
    },

    pyright = {
      settings = {
        python = {
          analysis = {
            typeCheckingMode = "basic", -- off|basic|strict
            autoSearchPaths = true,
            useLibraryCodeForTypes = true,
          },
        },
      },
    },

    clangd = {
      cmd = { "clangd", "--background-index", "--clang-tidy" },
    },

    texlab = {
      settings = {
        texlab = {
          build = {
            executable = "latexmk",
            args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
            onSave = false,
          },
        },
      },
    },
  }

  -- ✅ Newer mason-lspconfig: use setup_handlers
  if type(mlsp.setup_handlers) == "function" then
    mlsp.setup_handlers({
      function(server_name)
        local opts = server_opts[server_name] or {}
        opts.capabilities = capabilities
        opts.on_attach = on_attach
        lspconfig[server_name].setup(opts)
      end,
    })
  else
    -- ✅ Older mason-lspconfig: fall back to looping installed servers
    local installed = {}
    if type(mlsp.get_installed_servers) == "function" then
      installed = mlsp.get_installed_servers()
    end

    for _, server_name in ipairs(installed) do
      local opts = server_opts[server_name] or {}
      opts.capabilities = capabilities
      opts.on_attach = on_attach
      lspconfig[server_name].setup(opts)
    end
  end

  -- Diagnostics defaults
  vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
  })
end

return M

