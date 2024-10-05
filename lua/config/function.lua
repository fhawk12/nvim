local M = {}

M.create_file = function()
	local filename = vim.fn.input("Enter file name: ")
	if filename ~= "" then
		vim.cmd("edit " .. filename)
		vim.cmd("write")
	end
end

M.toggle_bool = function()
	local row, col = unpack(vim.api.nvim_win_get_cursor(0))
	local word = vim.fn.expand("<cword>")
	local replacements = {
		["true"] = "false",
		["false"] = "true",
	}
	if replacements[word] then
		vim.api.nvim_command("normal! ciw" .. replacements[word])
	end
	vim.api.nvim_win_set_cursor(0, { row, col })
end

M.comment = function()
	local row, col = unpack(vim.api.nvim_win_get_cursor(0))
	vim.api.nvim_command("normal gcc")
	vim.api.nvim_win_set_cursor(0, { row, col })
end

return M
