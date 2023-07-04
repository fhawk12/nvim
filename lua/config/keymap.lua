local function map(mode, lhs, rhs, opts)
  vim.keymap.set(mode, lhs, rhs, opts)
end

vim.g.mapleader = " "

-- formater
map({ "n", "v" }, "<leader>fm", "<cmd>lua vim.lsp.buf.format()<cr>")

-- select all
map("n", "<c-a>", "ggVG")

-- nvim-tree
map("n", "<leader>e", "<cmd>NvimTreeToggle<cr>")

-- session
map("n", "<leader>sl", "<cmd>SessionManager load_session<cr>")
map("n", "<leader>sd", "<cmd>SessionManager delete_session<cr>")

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

-- lazy
map("n", "<leader>l", "<cmd>:Lazy<cr>", { desc = "Lazy" })

-- save file
map({ "i", "v", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- cancel highlight
map("n", "<esc>", "<cmd>noh<cr>")

--lazygit
map("n","<leader>gg", "<cmd>LazyGit<cr>")

-- close buffer
map("n","<leader>q", "<cmd>bd<cr>")

-- zen-mode
map("n", "<leader>z","<cmd>ZenMode<cr>")
