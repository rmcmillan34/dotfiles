local lspconfig = require("lspconfig")
-- Loop over all servers that Mason installed:
for _, server in ipairs(require("mason-lspconfig").get_installed_servers()) do
  lspconfig[server].setup({
    on_attach = function(client, bufnr)
      -- your keymaps / defaults for go‑to‑def, hover, etc
    end,
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
  })
end
