return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "lua", "vim", "vimdoc",
          "python", "cpp", "c",
          "markdown", "markdown_inline",
          "latex",
          "json", "bash",
        },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
}
