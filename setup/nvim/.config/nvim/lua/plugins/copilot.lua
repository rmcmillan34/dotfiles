-- ~/.config/nvim/lua/plugins/copilot.lua
return {
  {
    "github/copilot.vim",
    init = function()
      vim.g.copilot_no_tab_map = true
      vim.g.copilot_enabled = true
    end,
    event = "InsertEnter",
    config = function()
      vim.keymap.set("i", "<Tab>",
        'copilot#Accept("")',
        { expr = true, silent = true, replace_keycodes = false }
      )
    end,
  },
}

