return {
  {
    "stevearc/conform.nvim",
    keys = {
      { "<leader>f", function() require("conform").format({ lsp_fallback = true }) end, desc = "Format" },
    },
    opts = {
      formatters_by_ft = {
        python = { "ruff_format" },      -- OR { "black" }
        cpp    = { "clang_format" },
        c      = { "clang_format" },
        tex    = { "latexindent" },
        markdown = { "prettier" },
        lua    = { "stylua" },
      },
    },
  },
}
