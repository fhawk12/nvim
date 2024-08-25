vim.g.mapleader = " "

local map = vim.keymap.set

-- Up/down/left/right
map({ "n", "v", "o" }, "h", "h")
map({ "n", "v", "o" }, "n", "j")
map({ "n", "v", "o" }, "e", "k")
map({ "n", "v", "o" }, "i", "l")

map({ "n", "v", "o" }, "H", "H")
map({ "n", "v", "o" }, "N", "J")
map({ "n", "v", "o" }, "E", "K")
map({ "n", "v", "o" }, "I", "L")

-- Text objects
map("x", "u", "i")

-- Fold
map("n", "zib", "vaBzf")
map("n", "zit", "vatzf")

-- Move selected line
map("v", "N", ":m '>+1<CR>gv=gv")
map("v", "E", ":m '<-2<CR>gv=gv")

-- Buffer
map("n", "H", ":bn<cr>")
map("n", "I", ":bp<cr>")

-- Undo
map("n", "U", "<C-r>")

-- End of word/Word
map({ "n", "v" }, "f", "e")
map({ "n", "v" }, "F", "E")

-- Insert Mode
map({ "n", "v", "o" }, "t", "i")
map({ "n", "v", "o" }, "T", "I")
map("i", "<C-i>", "<Right>")
map("i", "<tab>", "<tab>")
map("i", "<C-h>", "<Left>")

-- Next/previous
map({ "n", "v" }, "k", "n")
map({ "n", "v" }, "K", "N")

-- Scroll
map({ "n", "v" }, "<C-s>", "<C-d>zz")
map({ "n", "v" }, "<C-f>", "<C-u>zz")

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

-- Window Split
map("n", "<leader>-", ":split<cr>")
map("n", "<leader>|", ":vsplit<cr>")

-- Explore
map("n", "<leader>e", vim.cmd.Ex)

-- Terminal
map("t", "<Esc>", "<C-\\><C-n>", { remap = false })

-- Cancel highlight
map("n", "<Esc>", "<cmd>noh<cr>")

map("n", "<leader>b", require("utils.toggle").bool)
map({ "n", "v" }, "<leader>i", require("utils.toggle").comment)
