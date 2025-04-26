-- lua/plugins/nvim-glow.lua
return {
  'ellisonleao/glow.nvim',
  ft = 'markdown',
  config = function()
    require('glow').setup { border = 'rounded' }
    vim.keymap.set('n','<Leader>G','<Cmd>Glow<CR>',{silent=true,desc='Glow Preview'})
  end,
}
