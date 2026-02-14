-- Single source of truth for your look & feel
local M = {}

M.colorscheme = "catppuccin"
M.transparent = true
M.flavour = "mocha"

function M.setup()
  vim.opt.termguicolors = true

  -- catppuccin config (only here)
  require("catppuccin").setup({
    flavour = M.flavour,
    transparent_background = M.transparent,
    integrations = {
      treesitter = true,
      native_lsp = { enabled = true },
    },
  })

  vim.cmd.colorscheme(M.colorscheme)

  if M.transparent then
    vim.cmd([[highlight Normal guibg=NONE ctermbg=NONE]])
    vim.cmd([[highlight NormalNC guibg=NONE ctermbg=NONE]])
    vim.cmd([[highlight NormalFloat guibg=NONE ctermbg=NONE]])
    vim.cmd([[highlight FloatBorder guibg=NONE ctermbg=NONE]])
  end
end

M.setup()
return M
