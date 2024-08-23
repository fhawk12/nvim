local api = vim.api
local window = require("utils.window")

local M = {}

local buf = nil
local win = nil
M.open_float_term = function()
	if win and vim.api.nvim_win_is_valid(win) then
		api.nvim_win_hide(win)
		win = nil
	else
		if not buf or not vim.api.nvim_buf_is_valid(buf) then
			buf = api.nvim_create_buf(false, true)
		end

		win = window.create_window({})

		vim.cmd("term")
		vim.cmd.startinsert()
	end
end

return M
