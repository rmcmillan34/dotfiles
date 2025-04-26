-- lua/plugins/nvim-markdown-preview.lua
return {
  'iamcco/markdown-preview.nvim',
  run = 'cd app && npm install',
  ft = 'markdown',
  config = function()
    -- detect OS for browser command
    local is_mac = vim.fn.has('macunix') == 1

    -- do not auto-start preview
    vim.g.mkdp_auto_start = 0
    -- auto-scroll to sync with edits
    vim.g.mkdp_auto_scroll = 1
    -- choose browser open command based on OS
    vim.g.mkdp_browser = is_mac and 'open' or 'xdg-open'

    -- toggle preview with <Leader>p
    vim.keymap.set('n', '<Leader>p', '<Cmd>MarkdownPreviewToggle<CR>', {
      silent = true,
      desc = 'Toggle MD Preview',
    })
  end,
}

