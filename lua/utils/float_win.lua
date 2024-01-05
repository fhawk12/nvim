local M = {}

function Getpos(width, height, pos, ui)
	local x, y = 0, 0
	if pos then
		if pos:sub(1, 1) == "c" then
			y = (ui.height - height) / 2
		end
		if pos:sub(2, 2) == "c" then
			x = (ui.width - width) / 2
		end
		if pos:sub(2, 2) == "r" then
			x = ui.width - width
		end
	else
		x, y = pos.x, pos.y
	end
	return x, y
end

function M.create_window(opt)
	local ui = vim.api.nvim_list_uis()[1]
	local win = vim.tbl_extend("force", {
		height = ui.height / 2,
		width = ui.width / 2,
		buflisted = false,
		lines = {},
		title = "",
		pos = "cc",
	}, opt or {})

	if win.width > 0 and win.width < 1 then
		win.width = ui.width * win.width
	end
	if win.height > 0 and win.height < 1 then
		win.height = ui.height * win.height
	end

	-- if win.lines then
	-- 	for _, v in ipairs(win.lines) do
	-- 		win.width = math.max(win.width, vim.fn.strchars(v))
	-- 	end
	-- 	win.height = math.max(win.height, #win.lines)
	-- end

	local buf = vim.api.nvim_create_buf(win.buflisted, true)
	local x, y = Getpos(win.width, win.height, win.pos, ui)
	local opts = {
		relative = "editor",
		width = math.ceil(win.width),
		height = math.ceil(win.height),
		col = math.ceil(x),
		row = math.ceil(y),
		style = "minimal",
		border = "rounded",
		title = win.title,
		title_pos = "center",
	}
	vim.api.nvim_buf_set_lines(buf, 0, -1, false, win.lines)

	return vim.api.nvim_open_win(buf, true, opts)
end

return M
