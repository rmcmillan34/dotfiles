return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
  },

  -- Optional: nvim-tree (or replace with oil.nvim later)
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = { "NvimTreeToggle" },
    keys = {
      { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Explorer" },
    },
    config = function()
      require("nvim-tree").setup({
        view = { width = 40, side = "left" },
        actions = { open_file = { quit_on_open = true } },
      })
    end,
  },
}
