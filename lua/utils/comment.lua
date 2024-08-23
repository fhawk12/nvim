local M = {}

M.comment = function()
	local row, col = unpack(vim.api.nvim_win_get_cursor(0))
	vim.api.nvim_command("normal gcc")
	vim.api.nvim_win_set_cursor(0, { row, col })
end

return M
