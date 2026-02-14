local map = vim.keymap.set
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find Files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>",  { desc = "Live Grep" })
vim.keymap.set("n","gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
vim.keymap.set("n","K",  "<cmd>lua vim.lsp.buf.hover()<CR>")

