local function is_executable(bin)
  return vim.fn.executable(bin) == 1
end

local function first_available(...)
  local chain = { ... }
  local available = {}

  for _, formatter in ipairs(chain) do
    if formatter.bin == nil or is_executable(formatter.bin) then
      table.insert(available, formatter.name)
    end
  end

  return available
end

return {
  {
    "stevearc/conform.nvim",
    keys = {
      { "<leader>f", function() require("conform").format({ lsp_fallback = true }) end, desc = "Format" },
    },
    opts = {
      formatters_by_ft = {
        python = first_available(
          { name = "ruff_format", bin = "ruff" },
          { name = "black", bin = "black" }
        ),
        cpp = first_available(
          { name = "clang_format", bin = "clang-format" }
        ),
        c = first_available(
          { name = "clang_format", bin = "clang-format" }
        ),
        tex = first_available(
          { name = "latexindent", bin = "latexindent" }
        ),
        markdown = first_available(
          { name = "prettier", bin = "prettier" }
        ),
        lua = first_available(
          { name = "stylua", bin = "stylua" }
        ),
      },
    },
  },
}
