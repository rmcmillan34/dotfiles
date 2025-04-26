-- in your ~/.config/nvim/lua/plugins/copilot.lua
return {
  {
    "github/copilot.vim",
    event = "VimEnter",
    config = function()
      vim.g.copilot_no_tab_map = true
      vim.g.copilot_enabled = true

      -- simpler Tab‐or‐accept mapping using a VimL expression
      vim.keymap.set("i", "<Tab>",
        -- if copilot#Accept() returns non‐empty, use that, otherwise send a real <Tab>
        'copilot#Accept() != "" ? copilot#Accept() : "\\<Tab>"',
        { expr = true, silent = true }
      )

      -- toggle command & mapping
      vim.api.nvim_create_user_command("CopilotToggle", function()
        if vim.g.copilot_enabled then
          vim.fn["copilot#Disable"]()
          vim.g.copilot_enabled = false
          print("🛑 Copilot disabled")
        else
          vim.fn["copilot#Enable"]()
          vim.g.copilot_enabled = true
          print("✅ Copilot enabled")
        end
      end, {})

      vim.keymap.set("n", "<leader>ct", "<cmd>CopilotToggle<CR>",
        { desc = "Toggle GitHub Copilot", silent = true })
    end,
  },
}

