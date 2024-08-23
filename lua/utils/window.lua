local api = vim.api
local M = {}

---@param opts? table
---@return integer
M.create_window = function(opts)
	local win_height = math.ceil(vim.o.lines * 0.7)
	local win_width = math.ceil(vim.o.columns * 0.8)

	local row = math.ceil((vim.o.lines - win_height) * 0.4)
	local col = math.ceil((vim.o.columns - win_width) * 0.5)

	local opt = {
		relative = "editor",
		border = "rounded",
		style = "minimal",
		col = col,
		row = row,
		width = win_width,
		height = win_height,
		focusable = true,
	}

	local buf = api.nvim_create_buf(false, false)
	local win = api.nvim_open_win(buf, true, vim.tbl_extend("force", opt, opts))

	return win
end

return M
