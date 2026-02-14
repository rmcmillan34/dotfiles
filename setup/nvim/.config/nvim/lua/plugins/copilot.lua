return {
  {
    "github/copilot.vim",

    -- Guarantee the :Copilot command exists and can trigger loading
    cmd = "Copilot",

    -- Also load automatically when entering insert mode
    event = "InsertEnter",

    init = function()
      -- Do NOT let Copilot steal <Tab>
      vim.g.copilot_no_tab_map = true

      -- Accept Copilot suggestion with Shift-Tab
      -- Only triggers if a Copilot ghost suggestion is visible
      vim.keymap.set("i", "<S-Tab>", function()
        if vim.fn.exists("*copilot#GetDisplayedSuggestion") == 1
          and vim.fn["copilot#GetDisplayedSuggestion"]() ~= "" then
          return vim.fn["copilot#Accept"]("")
        end
        return "<S-Tab>"
      end, {
        expr = true,
        replace_keycodes = false,
        desc = "Copilot: Accept suggestion",
      })

      -- Optional (but useful): explicitly disable Copilot in some buffers
      -- vim.g.copilot_filetypes = {
      --   markdown = true,
      --   gitcommit = true,
      --   help = false,
      -- }
    end,
  },
}


