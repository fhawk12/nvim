local function map(mode, lhs, rhs, opts)
	vim.keymap.set(mode, lhs, rhs, opts)
end

vim.g.mapleader = " "

map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

map("i", "<c-n>", "<Nop>")
map("i", "<c-p>", "<Nop>")
map("i", "<c-y>", "<Nop>")
map({ "n", "v" }, " ", "<Nop>")

-- better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- cursor movement
map({ "n", "v" }, "gl", "$", { desc = "Go to line end " })
map({ "n", "v" }, "gh", "0", { desc = "Go to line start " })
map({ "n", "v" }, "gg", "gg", { desc = "Go to start line start " })
map({ "n", "v" }, "ge", "G", { desc = "Go to last line start " })
map({ "n", "v" }, "J", "5j", { noremap = true })
map({ "n", "v" }, "K", "5k", { noremap = true })

-- windows
map("n", "<leader>ww", "<C-W>p", { desc = "Other window", remap = true })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete window", remap = true })
map("n", "<leader>w-", "<C-W>s", { desc = "Split window below", remap = true })
map("n", "<leader>w|", "<C-W>v", { desc = "Split window right", remap = true })
map("n", "<leader>-", "<C-W>s", { desc = "Split window below", remap = true })
map("n", "<leader>|", "<C-W>v", { desc = "Split window right", remap = true })

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

map({ "i", "v", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>") -- save file
map("n", "<esc>", "<cmd>noh<cr>", { desc = "Cancel highlight" })
map("n", "<leader>q", "<cmd>bd<cr>", { desc = "Quit buffer" })
map("n", "<leader>i", "<cmd>lua ToggleBoolean()<cr>", { desc = "Toggle boolean" })
map("n", "<F4>", "<cmd>lua RunCode()<cr>", {desc = "run code"})
map("n", "U", "J")

map("i", "<c-b>", "<left>")
map("i", "<c-f>", "<right>")
