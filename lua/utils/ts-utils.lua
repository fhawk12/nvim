local M = {}

local function get_function_node()
	local node = vim.treesitter.get_node()
	if not node then
		return
	end

	while node do
		local type = node:type()
		if type == "function_declaration" or type == "function_definition" then
			return node
		end
		node = node.parent(node)
	end
end

M.select_function = function()
	local func_node = get_function_node()
	if not func_node then
		return
	end

	vim.api.nvim_win_set_cursor(0, { func_node:start() + 1, 0 })
	vim.cmd("normal! V")
	vim.api.nvim_win_set_cursor(0, { func_node:end_() + 1, 0 })
end

M.goto_function_head = function()
	local func_node = get_function_node()
	if not func_node then
		return
	end

	vim.api.nvim_win_set_cursor(0, { func_node:start() + 1, 0 })
end

M.goto_function_end = function()
	local func_node = get_function_node()
	if not func_node then
		return
	end

	vim.api.nvim_win_set_cursor(0, { func_node:end_() + 1, 0 })
end

-- TODO: not finish yet
M.expand = function()
	local node = vim.treesitter.get_node()
	if not node then
		return
	end

	local parent = node:parent()
	if not parent then
		return
	end

	local start_row, start_col, end_row, end_col = node:range()

	if vim.api.nvim_get_mode() ~= "Visual" then
		vim.api.nvim_win_set_cursor(0, { start_row + 1, start_col })
		vim.cmd("normal! v")
		vim.api.nvim_win_set_cursor(0, { end_row + 1, end_col - 1 })
	else

	end
end

-- vim.keymap.set({ "n", "v" }, "<cr>", M.expand)

return M
