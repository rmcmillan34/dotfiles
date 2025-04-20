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
    "LunarVim/synthwave84.nvim",
    lazy    = false,     -- load immediately
    priority= 1000,      -- load before other colorschemes
    config  = function()
      require("synthwave84").setup({
        -- optional tweaks:
        glow = {
          error_msg = true,
          keyword   = true,
          operator  = true
        },
      })
      vim.cmd("colorscheme synthwave84")
    end,
  },

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
    cmd = "Mason",
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
    }
})
