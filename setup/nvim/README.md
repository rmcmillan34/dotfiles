# Neovim setup

## Required binaries

The Neovim configuration dynamically enables formatters and LaTeX PDF viewers based on what is available in `$PATH`.

### Formatters (`conform.nvim`)

- Python: `ruff` (for `ruff_format`) with fallback to `black`
- C/C++: `clang-format`
- TeX: `latexindent`
- Markdown: `prettier`
- Lua: `stylua`

### LaTeX (`vimtex`)

- Compiler: `latexmk`
- Preferred PDF viewer: `zathura`
- Fallback viewers are chosen by platform when `zathura` is unavailable:
  - Linux: `sioyek`, `okular`, `evince`, then `xdg-open`
  - macOS: `skim`, then `open`
  - Windows: `SumatraPDF`

If none of the formatter binaries for a filetype are available, formatting falls back to LSP formatting (via `<leader>f`).
