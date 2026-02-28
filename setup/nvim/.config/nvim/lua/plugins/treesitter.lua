return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      local ok, configs = pcall(require, "nvim-treesitter.configs")
      if not ok then
        vim.notify("nvim-treesitter not available (did Lazy install it?)", vim.log.levels.ERROR)
        return
      end

      configs.setup({
        highlight = { enable = true },
        indent = { enable = true },

        -- Adjust to taste; these cover your main workflows
        ensure_installed = {
          "lua",
          "vim",
          "vimdoc",
          "bash",
          "python",
          "cpp",
          "c",
          "markdown",
          "markdown_inline",
          "latex",
          "json",
          "yaml",
          "toml",
        },

        auto_install = true,
      })
    end,
  },
}
