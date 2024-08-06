vim.g.mapleader = " "

local map = vim.keymap.set

-- Up/down/left/right
map({ "n", "v", "o" }, "h", "h")
map({ "n", "v", "o" }, "n", "j")
map({ "n", "v", "o" }, "e", "k")
map({ "n", "v", "o" }, "i", "l")

map("v", "E", ":m '>+1<CR>gv=gv")
map("v", "N", ":m '<-2<CR>gv=gv")

-- Undo
map("n", "U", "<C-r>")

-- End of word/Word
map("n", "f", "e")
map("n", "F", "E")

-- Insert Mode
map("n", "s", "i")
map("n", "S", "I")

map({ "n", "v" }, "k", "n")
map({ "n", "v" }, "K", "N")

-- Scroll
map("n", "<C-s>", "<C-d>zz")
map("n", "<C-f>", "<C-u>zz")

-- Better up/down
map({ "n", "x" }, "n", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "e", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
map("n", "<leader>w", "<C-w>")
map("n", "<C-h>", "<C-w>h", { remap = true })
map("n", "<C-n>", "<C-w>j", { remap = true })
map("n", "<C-e>", "<C-w>k", { remap = true })
map("n", "<C-i>", "<C-w>l", { remap = true })

-- Other
map("n", "<leader>e", vim.cmd.Ex)
map("n", "<Esc>", "<cmd>noh<cr>")
---- aytna
map("i", "<C-t>", "<Right>")
map("i", "<C-n>", "<Left>")

