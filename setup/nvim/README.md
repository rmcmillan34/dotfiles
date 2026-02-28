# Neovim setup notes

This document describes the assumptions and quick validation steps for the config under `setup/nvim/.config/nvim`.

## Baseline assumptions

- **Neovim version:** `>= 0.10` is recommended.
  - The config uses `vim.uv` and enables inlay hints through `vim.lsp.inlay_hint`, which are expected in modern Neovim builds.
- **Plugin manager:** [`lazy.nvim`](https://github.com/folke/lazy.nvim).
  - It is auto-bootstrapped on first launch from `init.lua` and then used to load all plugin specs.

## Required external binaries

The config installs plugins automatically, but some capabilities depend on binaries available on your system.

### Core build/tooling

- `git` (for bootstrapping `lazy.nvim`)
- `make` + build toolchain (required to compile `telescope-fzf-native.nvim`)

### LSP servers (used by Mason/LSP config)

- `lua-language-server` (`lua_ls`)
- `pyright` (Node-based)
- `clangd`
- `texlab`
- `marksman`

> Mason can install/manage many of these, but they still need a functioning runtime/toolchain (for example Node.js for `pyright`).

### Formatters

- `ruff` (for `ruff_format` in Python)
- `clang-format` (for C/C++)
- `latexindent` (for TeX)
- `prettier` (for Markdown)
- `stylua` (for Lua)

### LaTeX workflow tools

- `latexmk` (used by `texlab` build config and `vimtex` compiler)
- A TeX distribution providing engines and BibTeX/Biber as needed (TeX Live or MiKTeX)
- `zathura` (configured PDF viewer for `vimtex`)

### Optional markdown preview helper

- `glow` CLI (for `:Glow` preview)

## Language support matrix

| Language | LSP server | Formatter | Treesitter parser | Expected capabilities |
|---|---|---|---|---|
| Python | `pyright` | `ruff_format` | `python` | Diagnostics, go-to definition/references, rename, code actions, formatting |
| C/C++ | `clangd` | `clang-format` | `c`, `cpp` | Diagnostics, navigation, hover, symbol/ref lookups, formatting |
| Markdown | `marksman` | `prettier` | `markdown`, `markdown_inline` | Diagnostics, links/symbol support, formatting, optional `:Glow` preview |
| TeX | `texlab` + `vimtex` | `latexindent` | `latex` | Diagnostics, LSP actions, compile via `latexmk`, viewer integration (`zathura`) |
| Lua | `lua_ls` | `stylua` | `lua` | Diagnostics (with `vim` global configured), completion, formatting |

## Quick validation checklist

Run these checks after first install or when debugging setup issues.

1. Start Neovim and run:
   - `:checkhealth`
   - `:Lazy sync`
   - `:Mason`
2. Open one file per configured language and verify attachment:
   - `test.py`, `main.c` or `main.cpp`, `notes.md`, `paper.tex`, `init.lua`
   - Run `:LspInfo` and confirm the expected server is attached.
3. Verify formatting mapping:
   - In each file, run `<leader>f` (Conform format action).
4. Verify common LSP actions:
   - `gd` (definition)
   - `gr` (references)
   - `K` (hover)
   - `<leader>rn` (rename)
   - `<leader>ca` (code action)
5. Validate Treesitter parser availability:
   - `:TSInstallInfo` (or `:TSUpdate`) and ensure required parsers are installed.

## Troubleshooting

### 1) Missing executable errors

Symptoms:

- `Command not found` in `:messages`
- Formatter/LSP says executable is unavailable

Fixes:

- Install the missing tool on PATH (for example `clangd`, `pyright`, `latexmk`, `prettier`, `stylua`, `ruff`, `latexindent`, `zathura`, `glow`).
- Restart Neovim after installation.
- Re-run `:checkhealth`, then retry `<leader>f` or `:LspInfo`.

### 2) Missing Treesitter parser

Symptoms:

- No highlighting/indentation for a filetype
- Treesitter warnings about parser not installed

Fixes:

- Run `:TSUpdate`.
- Install a parser explicitly (`:TSInstall <language>`), e.g. `:TSInstall markdown`.
- Re-open the buffer.

### 3) Missing or detached LSP server

Symptoms:

- `:LspInfo` shows no client attached
- `gd`/`gr`/`K` do nothing or show “no LSP client”

Fixes:

- Open `:Mason` and confirm server installation state.
- Ensure server binary/runtime prerequisites are present (for example Node.js for `pyright`).
- Check filetype detection with `:set filetype?`.
- Check `:messages` for startup errors, then restart Neovim.
