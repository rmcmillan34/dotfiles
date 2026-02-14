return {
  {
    "stevearc/conform.nvim",
    keys = {
      { "<leader>f", function() require("conform").format({ lsp_fallback = true }) end, desc = "Format" },
    },
    opts = {
      formatters_by_ft = {
        python = { "ruff_format", "black" }, -- you can choose one later
        cpp = { "clang-format" },
        c = { "clang-format" },
        lua = { "stylua" },
        markdown = { "prettier" }, -- optional
      },
    },
  },
}
