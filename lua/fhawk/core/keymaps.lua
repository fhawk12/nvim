vim.g.mapleader = ","

-- Colemak
vim.keymap.set({ "n", "v", "x", "o" }, "n", "j")
vim.keymap.set({ "n", "v", "x", "o" }, "e", "k")
vim.keymap.set({ "n", "v", "x", "o" }, "i", "l")

vim.keymap.set({ "n", "v", "x", "o" }, "N", "J")
vim.keymap.set({ "n", "v", "x", "o" }, "E", "K")
vim.keymap.set({ "n", "v", "x", "o" }, "I", "L")

vim.keymap.set({ "n", "v" }, "f", "e")

-- Text objects
vim.keymap.set("x", "u", "i")

-- Better move
vim.keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
vim.keymap.set("n", "<C-n>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
vim.keymap.set("n", "<C-e>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
vim.keymap.set("n", "<C-i>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Resize window using <ctrl> arrow keys
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- Buffer
vim.keymap.set("n", "<S-h>", "<cmd>bp<cr>")
vim.keymap.set("n", "<S-i>", "<cmd>bn<cr>")
vim.keymap.set("n", "<space>bd", "<cmd>bd<cr>")

-- Scroll
vim.keymap.set("n", "<C-s>", "<C-d>")
vim.keymap.set("n", "<C-f>", "<nop>")

-- Search
vim.keymap.set("n", "k", "n")
vim.keymap.set("n", "K", "N")
vim.keymap.set("n", "<Esc>", "<cmd>noh<cr>")

-- Jump
vim.keymap.set("n", "<C-S-o>", "<C-i>")

-- Clipboard
vim.keymap.set({ "n", "v" }, "<space>y", '"*y')
vim.keymap.set({ "n", "v" }, "<space>p", '"*p')
vim.keymap.set({ "n", "v" }, "<space>P", '"*P')

-- Insert mode
vim.keymap.set({ "n", "v", "o", "x" }, "t", "i")
vim.keymap.set({ "n", "v", "o", "x" }, "T", "I")
vim.keymap.set("i", "<C-t>", "<Right>")
vim.keymap.set("i", "<C-h>", "<Left>")

-- LSP
vim.keymap.set("n", "E", vim.lsp.buf.hover)
vim.keymap.set("n", "<space>;", vim.diagnostic.open_float)
vim.keymap.set("n", "ca", vim.lsp.buf.code_action)
vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename)

-- Comment
vim.keymap.set({ "n", "v" }, "<space>i", "gcc")

-- Ex
vim.keymap.set("n", "<space>e", vim.cmd.Ex)

-- Terminal
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
vim.keymap.set("t", "<C-[>", "<C-\\><C-n>")

-- Tools
vim.keymap.set({ "n", "v" }, "<space>i", "<cmd>lua vim.api.nvim_command('normal gcc')<cr>")

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight_yank", {}),
	callback = function()
		(vim.hl or vim.highlight).on_yank()
	end,
})

-- Go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
	group = vim.api.nvim_create_augroup("last_loc", {}),
	callback = function(event)
		local exclude = { "gitcommit" }
		local buf = event.buf
		if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].lazyvim_last_loc then
			return
		end
		vim.b[buf].lazyvim_last_loc = true
		local mark = vim.api.nvim_buf_get_mark(buf, '"')
		local lcount = vim.api.nvim_buf_line_count(buf)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})
