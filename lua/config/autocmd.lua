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

-- Wrap and conceal signcolumn in markdown file
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "gitcommit", "markdown" },
	callback = function()
		vim.opt_local.wrap = true
	end,
})

-- go to last location when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
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
