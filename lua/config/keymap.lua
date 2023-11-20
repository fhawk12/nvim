local function map(mode, lhs, rhs, opts)
  vim.keymap.set(mode, lhs, rhs, opts)
end

vim.g.mapleader = " "

map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- buffer movement
-- map("n", "H", "<cmd>bprevious<CR>")
-- map("n", "L", "<cmd>bnext<CR>")

map("i", "<c-n>", "<Nop>")
map("i", "<c-p>", "<Nop>")
map("i", "<c-y>", "<Nop>")
map({ "n", "v" }, " ", "<Nop>")

-- cursor movement
map({ "n", "v" }, "J", "5j")
map({ "n", "v" }, "K", "5k")
map({ "n", "v" }, "W", "5w")

-- move buffer
map("n", "L", "<cmd>bn<cr>")
map("n", "H", "<cmd>bp<cr>")

-- better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

map({ "n", "v" }, "gl", "$",  { desc = "Go to line end "})
map({ "n", "v" }, "gh", "0",  { desc = "Go to line start " })
map({ "n", "v" }, "gg", "gg", { desc = "Go to start line start " })
map({ "n", "v" }, "ge", "G",  { desc = "Go to last line start " })

-- windows
map("n", "<leader>ww", "<C-W>p", { desc = "Other window", remap = true })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete window", remap = true })
map("n", "<leader>w-", "<C-W>s", { desc = "Split window below", remap = true })
map("n", "<leader>w|", "<C-W>v", { desc = "Split window right", remap = true })
map("n", "<leader>-", "<C-W>s",  { desc = "Split window below", remap = true })
map("n", "<leader>|", "<C-W>v",  { desc = "Split window right", remap = true })

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

-- map({ "n", "v" }, "<leader>fm", "<cmd>lua vim.lsp.buf.format()<cr>") -- format
map({ "n", "v" }, "<C-a>", "ggVG", { noremap = true })               -- select all
map({ "i", "v", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>")              -- save file
-- map("n", "<C-k>", "<C-a>", { noremap = true })                    -- number++ but conflict with window move
map("n", "<esc>",     "<cmd>noh<cr>",                              { desc = "Cancel highlight" })
map("n", "<leader>q", "<cmd>bd<cr>",                               { desc = "Quit buffer" })
map("n", "<leader>i", "<cmd>lua ToggleBoolean()<cr>",              { desc = "Toggle boolean" })
map("n", "<leader>u", "<cmd>lua Toggle_current_word_case()<cr>",   { desc = "Toggle word case" })
map("n", "<leader>h", "<cmd>lua vim.diagnostic.open_float()<cr>",  { desc = "Open diagnostic" })

map("i", "<c-b>", "<left>")
map("i", "<c-f>", "<right>")
map("i", "<c-a>", "<esc>^i")
map("i", "<c-k>", "<c-o>o")

--@see https://vim.fandom.com/wiki/Moving_lines_up_or_down
map("i", "<a-j>", "<esc>:m .+1<cr>==gi")
map("i", "<a-k>", "<esc>:m .-2<cr>==gi")
