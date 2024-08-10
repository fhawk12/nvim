vim.g.mapleader = " "

local map = vim.keymap.set

-- Up/down/left/right
map({ "n", "v", "o", "x" }, "h", "h")
map({ "n", "v", "o", "x" }, "n", "j")
map({ "n", "v", "o", "x" }, "e", "k")
map({ "n", "v", "o", "x" }, "i", "l")

map({ "n", "v", "o", "x" }, "H", "H")
map({ "n", "v", "o", "x" }, "N", "J")
map({ "n", "v", "o", "x" }, "E", "K")
map({ "n", "v", "o", "x" }, "I", "L")

-- Text objects
map("x", "u", "i")

map("v", "N", ":m '>+1<CR>gv=gv")
map("v", "E", ":m '<-2<CR>gv=gv")

-- Buffer
map("n", "H", ":bn<cr>")
map("n", "I", ":bp<cr>")

-- Undo
map("n", "U", "<C-r>")

-- End of word/Word
map({ "n", "v", "o", "x" }, "f", "e")
map({ "n", "v", "o", "x" }, "F", "E")

-- Insert Mode
map({ "n", "v", "o", "x" }, "t", "i")
map({ "n", "v", "o", "x" }, "T", "I")

map({ "n", "v" }, "k", "n")
map({ "n", "v" }, "K", "N")

map("i", "<C-i>", "<Right>")
map("i", "<C-h>", "<Left>")

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

-- Window Split
map("n", "<leader>-", ":split<cr>")
map("n", "<leader>|", ":vsplit<cr>")

-- Other
map("n", "<leader>e", vim.cmd.Ex)
map("n", "<Esc>", "<cmd>noh<cr>")

-- Function
map("n", "<leader>b", ":lua ToggleBoolean()<cr>")
