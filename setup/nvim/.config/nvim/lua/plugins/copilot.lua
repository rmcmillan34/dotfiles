-- ~/.config/nvim/lua/plugins/copilot.lua
return {
  "github/copilot.vim",
  event = "VimEnter",  -- lazy-load when you first enter Insert mode
  config = function()
    -- disable default Tab mapping (if you prefer)
    vim.g.copilot_no_tab_map = true
    
    -- map <C-J> (or whatever) to accept suggestions:
    vim.api.nvim_set_keymap(
      "i",
      "<C-Space>",
      'copilot#Accept("<CR>")',
      { expr = true, silent = true }
    )

    -- optional: show a small float window with suggestions
    vim.g.copilot_filetypes = { ["*"] = true }
  end,
}
