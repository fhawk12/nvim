-- Toggle boolean
function ToggleBoolean()
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
