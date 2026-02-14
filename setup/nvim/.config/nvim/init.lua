-- set global leader and localleader
vim.g.mapleader = " "           -- space as your “main” leader
vim.g.maplocalleader = ","      -- comma as your local‑leader

-- optional: override per‑OS
if vim.fn.has("macunix") == 1 then
  -- on macOS
  vim.g.mapleader = " "         -- you could pick something else here
else
  -- on Linux
  vim.g.mapleader = " "         -- or e.g. vim.g.mapleader = ";"
end

require("core.options")
require("core.keymaps")
require("core.autocmds")

require("plugins")        -- Lazy bootstrap + specs
require("config.theme")   -- one place for theme
