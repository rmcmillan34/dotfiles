local map = vim.keymap.set
vim.keymap.set("n","gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
vim.keymap.set("n","K",  "<cmd>lua vim.lsp.buf.hover()<CR>")

