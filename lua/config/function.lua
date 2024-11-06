local M = {}

M.create_file = function()
  local current_dir = vim.fn.getcwd()
  local filename = vim.fn.input("Create file: ", current_dir .. "/")

	if filename ~= "" then
		local full_path = vim.fn.fnamemodify(filename, ":p")
		local dir = vim.fn.fnamemodify(full_path, ":h")

		if vim.fn.isdirectory(dir) == 0 then
			vim.fn.mkdir(dir, "p")
		end

		vim.cmd("edit " .. filename)
		vim.cmd("write")

    vim.notify("File created: " .. full_path)
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
