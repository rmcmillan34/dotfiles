return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- only load when you call these commands or press the mapping
    cmd  = { "NvimTreeToggle", "NvimTreeOpen", "NvimTreeClose" },
    keys = {
      -- toggle with <leader>e
      { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Toggle File Explorer" },
    },
    config = function()
      require("nvim-tree").setup {
        view = {
          width = 30,
          side  = "left",
        },
        actions = {
          open_file = {
            quit_on_open = true,
          },
        },
        filters = {
          dotfiles = false,
        },
      }
    end,
  },
}
