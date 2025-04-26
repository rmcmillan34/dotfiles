-- Auto-install lazy.nvim if missing
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Define plugins
require("lazy").setup({
  -- Colorscheme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,  -- load before other colorschemes
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",              -- latte, frappe, macchiato, mocha
        transparent_background = true,
        term_colors = true,
        styles = {
          comments = { "italic" },
          functions = { "bold" },
        },
        integrations = {
          treesitter = true,
          native_lsp = { enabled = true },
          cmp = true,
          telescope = true,
          notify = true,
        },
      })                            -- close require("catppuccin").setup(
        -- clear highlights so terminal transparency shows through
      vim.cmd("colorscheme catppuccin")
      vim.cmd([[highlight Normal       guibg=NONE ctermbg=NONE]])
      vim.cmd([[highlight NormalNC     guibg=NONE ctermbg=NONE]])
      vim.cmd([[highlight FloatBorder  guibg=NONE ctermbg=NONE]])
      vim.cmd([[highlight NormalFloat  guibg=NONE ctermbg=NONE]])
    end,                             -- close config = function() …
  },                                 -- close the catppuccin spec table

-- Fuzzy finder
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },

  -- Git signs
  { "lewis6991/gitsigns.nvim" },

  -- Treesitter
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

  -- LSP config
  { "neovim/nvim-lspconfig" },

  -- package manager for LSPs
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    event = "VimEnter",
    lazy = true,   -- lazy load on command
    priority = 1000, -- load before other plugins
    config = function()
        -- this calls the lua/mason-setup.lua file
        require("mason-setup").setup()
    end,
  },

  -- Mason + LSPConfig integration
  -- This plugin is optional, but it makes it easier to manage LSP servers
  -- and auto-install them if they are missing.
  {
    "williamboman/mason-lspconfig.nvim",
    -- Ensure that this plugin is loaded after mason.nvim
    cmd = "MasonLSPConfig",
    dependencies = { "mason.nvim" },
    lazy = true, -- lazy load on command
    config = function()

    end,
  },

  -- nvim-tree config
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("nvim-tree").setup({
        view = { width = 30 },
        update_focused_file = { enable = true },
        git = { enable = false },
        })
    end,
    },

  { import = "plugins.copilot" },

  { import = "plugins.lazygit" }
})
