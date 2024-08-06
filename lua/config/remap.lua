local map = vim.keymap.set

vim.g.mapleader = " "
vim.g.maplocalleader = " "

map("n", "<leader>e", vim.cmd.Ex)

map("n", "<Esc>", "<cmd>noh<cr>")

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

map({ "n", "x" }, "gl", "$")
map({ "n", "x" }, "ge", "G")
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

map("n", "H", "<cmd>bp<CR>")
map("n", "L", "<cmd>bn<CR>")
map("n", "<leader>bd", "<cmd>bd<CR>")

map("n", "<leader>w", "<C-w>")
map("n", "<C-h>", "<C-w>h", { remap = true })
map("n", "<C-j>", "<C-w>j", { remap = true })
map("n", "<C-k>", "<C-w>k", { remap = true })
map("n", "<C-l>", "<C-w>l", { remap = true })

map("i", "<C-l>", "<Right>")
map("i", "<C-h>", "<Left>")

map("n", "<leader>i", "<cmd>lua ToggleBoolean()<CR>")
