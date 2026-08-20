local M = {}

local state = {
	buf = -1,
	win = -1,
}

local function create_floating_window()
	local width = math.floor(vim.o.columns * 0.6)
	local height = math.floor(vim.o.lines * 0.7)
	local col = math.floor((vim.o.columns - width) / 2)
	local row = math.floor((vim.o.lines - height) / 2)

	-- Reuse existing buffer if valid, otherwise create a new scratch buffer
	if not vim.api.nvim_buf_is_valid(state.buf) then
		state.buf = vim.api.nvim_create_buf(false, true) -- no file, scratch buffer
	end

	local win = vim.api.nvim_open_win(state.buf, true, {
		relative = "editor",
		width = width,
		height = height,
		col = col,
		row = row,
		style = "minimal",
		border = "rounded",
	})
	return win
end

-- Toggle the floating terminal window
M.toggle = function()
	if vim.api.nvim_win_is_valid(state.win) then
		-- Close the window (keep the buffer for reuse)
		vim.api.nvim_win_close(state.win, true)
		state.win = -1
	else
		state.win = create_floating_window()
		-- Start a terminal if the buffer is not already a terminal
		if vim.bo[state.buf].buftype ~= "terminal" then
			vim.cmd.terminal()
		end
		vim.cmd("startinsert")
	end
end

-- Key mapping to toggle the floating terminal
vim.keymap.set("n", "<C-/>", M.toggle, { desc = "Open floating terminal" })

return M
