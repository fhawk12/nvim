-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Refresh neo-tree
vim.api.nvim_create_autocmd("SessionLoadPost", {
	callback = function()
		Update_nvim_tree_pwd()
	end,
})

-- Jump to the Stack Trace
vim.api.nvim_create_autocmd({ "BufEnter" }, {
	pattern = "crunner_*",
	callback = function()
		vim.keymap.set("n", "p", Preview_stack_trace, { silent = true, noremap = true, buffer = true })
	end,
})

-- Wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "gitcommit", "markdown" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = false
	end,
})

-- Toggle relative number between normal and insert mode
vim.api.nvim_create_autocmd("InsertLeave", {
	callback = function()
		vim.opt.relativenumber = true
	end,
})
vim.api.nvim_create_autocmd("InsertEnter", {
	callback = function()
		vim.opt.relativenumber = false
	end,
})
