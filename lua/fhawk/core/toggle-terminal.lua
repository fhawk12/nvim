local state = {
	floating = {
		buf = -1,
		win = -1,
	},
}
Create_floating_window = function(opts)
	opts = opts or {}
	local width = opts.width or math.floor(vim.o.columns * 0.6)
	local height = opts.height or math.floor(vim.o.lines * 0.7)

	local col = math.floor((vim.o.columns - width) / 2)
	local row = math.floor((vim.o.lines - height) / 2)

	local buf = -1
	if vim.api.nvim_buf_is_valid(state.floating.buf) then
		buf = state.floating.buf
	else
		buf = vim.api.nvim_create_buf(false, true) -- No file, scratch buffer
	end

	local win = vim.api.nvim_open_win(buf, true, {
		relative = "editor",
		width = width,
		height = height,
		col = col,
		row = row,
		style = "minimal",
		border = "rounded",
		title = opts.title or "",
		title_pos = opts.title_pos or "left",
	})

	return { buf = buf, win = win }
end

Toggle_terminal = function()
	if not vim.api.nvim_win_is_valid(state.floating.win) then
		state.floating = Create_floating_window({ buf = state.floating.buf })
		if vim.bo[state.floating.buf].buftype ~= "terminal" then
			vim.cmd.terminal()
		end
		vim.cmd("startinsert")
	else
		vim.api.nvim_win_hide(state.floating.win)
	end
end
