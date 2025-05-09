vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pp", ":Ex<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>q", "<C-w>c", { noremap = true, silent = true })
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>wh", "<C-w>H", { noremap = true, silent = true }) -- move window to left
vim.keymap.set("n", "<leader>wj", "<C-w>J", { noremap = true, silent = true }) -- move window to bottom
vim.keymap.set("n", "<leader>wk", "<C-w>K", { noremap = true, silent = true }) -- move window to top
vim.keymap.set("n", "<leader>wl", "<C-w>L", { noremap = true, silent = true }) -- move window to right
vim.keymap.set("n", "<leader>sv", ":vsplit | enew<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>sh", ":split | terminal<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-h>", ":vertical resize -2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-l>", ":vertical resize +2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-k>", ":resize -2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-j>", ":resize +2<CR>", { noremap = true, silent = true })

