-- KEYMAPS
-- See `:h vim.keymap.set()`, `:h mapping`, `:h keycodes`

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Use <Esc> to exit terminal mode" }) --
vim.keymap.set("n", "<leader>re", "<cmd>restart<cr>", { desc = "Restart Neovim (:restart)" })
vim.keymap.set({ "n", "t" }, "<leader>ft", function()
	require("fhawk.utils.term").toggle()
end, { desc = "Open floating terminal" })

-- Built-in undotree
vim.keymap.set("n", "<leader>u", function()
	vim.cmd.packadd("nvim.undotree")
	require("undotree").open()
end, { desc = "Toggle Built-in Undotree" })

-- copy filepath to the clipboard
vim.keymap.set("n", "<leader>fp", function()
	local filePath = vim.fn.expand("%:~")
	vim.fn.setreg("+", filePath)
	print("File path copied to clipboard: " .. filePath)
end, { desc = "Copy file path to clipboard" })

-- Colemak
-- Move Cursor
vim.keymap.set({ "n", "x", "o" }, "n", "j")
vim.keymap.set({ "n", "x", "o" }, "N", "J")
vim.keymap.set({ "n", "x", "o" }, "e", "k")
vim.keymap.set({ "n", "x", "o" }, "E", "K")
vim.keymap.set({ "n", "x", "o" }, "i", "l")
vim.keymap.set({ "n", "x", "o" }, "I", "L")

-- Better Movement
vim.keymap.set({ "n", "x" }, "n", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "e", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- Navigate between windows
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
vim.keymap.set("n", "<C-n>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
vim.keymap.set("n", "<C-e>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
vim.keymap.set("n", "<C-i>", "<C-w>l", { desc = "Go to Right Window", remap = true })

vim.keymap.set("n", "E", vim.lsp.buf.hover, { desc = "LSP Hover" })
vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, { desc = "Format Document" })
vim.keymap.set("n", "<leader>e", vim.cmd.Ex, { desc = "Open Explore" })
vim.keymap.set({ "n", "x" }, "f", "e", { desc = "Go to end of word" })
vim.keymap.set("n", "<leader>bd", "<cmd>bd<cr>", { desc = "Close Buffer" })
vim.keymap.set("n", "k", "n", { desc = "Go to next pattern" })
vim.keymap.set("n", "K", "N", { desc = "Go to previous pattern" })
vim.keymap.set("n", "U", "<C-r>", { desc = "Re-undo" })
vim.keymap.set("n", "<C-S-o>", "<C-i>", { desc = "Re-undo" })
vim.keymap.set({ "n", "x" }, "t", "i", { desc = "Enter Insert Mode" })
vim.keymap.set({ "n", "x" }, "T", "I", { desc = "Enter Insert Mode" })
vim.keymap.set("t", "<C-[>", "<C-\\><C-n>", { desc = "Enter Normal Mode" })
vim.keymap.set({ "x", "o" }, "u", "i", { desc = "Replace 'i' with 'u'" })

-- Select child (inner) node
vim.keymap.set({ "x", "o" }, "un", function()
	if vim.treesitter.get_parser(nil, nil, { error = false }) then
		require("vim.treesitter._select").select_child(vim.v.count1)
	else
		vim.lsp.buf.selection_range(-vim.v.count1)
	end
end, { desc = "Select child (inner) node" })

-- Move cursor in Insert Mode
vim.keymap.set({ "i", "s" }, "<C-f>", "<Right>")
vim.keymap.set({ "i", "s" }, "<C-t>", "<Right>")
vim.keymap.set({ "i", "s" }, "<C-h>", "<Left>")

-- Scroll Movement
vim.keymap.set({ "n", "x" }, "<C-s>", "<C-d>")
