-- lua/plugins/nvim-treesitter.lua
return {
  'nvim-treesitter/nvim-treesitter',
  version = false,              -- use latest from HEAD
  build = ':TSUpdate',         -- update parsers on install
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
    'nvim-treesitter/playground',
    'nvim-treesitter/nvim-treesitter-refactor',
    'windwp/nvim-ts-autotag',
    'JoosepAlviste/nvim-ts-context-commentstring',
  },
  config = function()
    require('nvim-treesitter.configs').setup {
      ensure_installed = {
        'bash', 'c', 'cpp', 'python', 'lua', 'vim', 'json',
        'html', 'css', 'javascript', 'typescript', 'tsx',
        'markdown', 'markdown_inline', 'yaml', 'go', 'rust'
      },
      sync_install = false,
      auto_install = true,

      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
        custom_captures = {
          -- map TS captures to highlight groups for markdown
          ["atx_heading.markdown"]      = "Title",
          ["setext_heading.markdown"]   = "Title",
          ["link.markdown"]             = "Underlined",
          ["emphasis.markdown"]         = "Italic",
          ["strong.markdown"]           = "Bold",
        },
      },

      indent = {
        enable = true,
      },

      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection    = '<c-space>',
          node_incremental  = '<c-space>',
          scope_incremental = '<c-s>',
          node_decremental  = '<c-backspace>',
        },
      },

      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ['aa'] = '@parameter.outer',
            ['ia'] = '@parameter.inner',
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            ['ac'] = '@class.outer',
            ['ic'] = '@class.inner',
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            [']m'] = '@function.outer',
            [']]'] = '@class.outer',
          },
          goto_previous_start = {
            ['[m'] = '@function.outer',
            ['[['] = '@class.outer',
          },
        },
        swap = {
          enable = true,
          swap_next = { ['<leader>a'] = '@parameter.inner' },
          swap_previous = { ['<leader>A'] = '@parameter.inner' },
        },
      },

      playground = {
        enable = true,
        updatetime = 25,
        persist_queries = false,
      },

      context_commentstring = {
        enable = true,
        enable_autocmd = false,
      },
    }

    -- Manual highlight-group links for TSMarkdown nodes
    vim.cmd [[
      highlight link TSMarkdownHeading Title
      highlight link TSMarkdownHeading1 Title
      highlight link TSMarkdownHeading2 Title
      highlight link TSMarkdownItalic Italic
      highlight link TSMarkdownBold Bold
      highlight link TSURI Underlined
    ]]
  end,
}

