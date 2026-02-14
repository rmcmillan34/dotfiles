return {
  {
    "ellisonleao/glow.nvim",
    ft = "markdown",
    config = function()
      require("glow").setup({ border = "rounded" })
      vim.keymap.set("n", "<leader>G", "<cmd>Glow<CR>", { desc = "Markdown preview" })
    end,
  },
}
