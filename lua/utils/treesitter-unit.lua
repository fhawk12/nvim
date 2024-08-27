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

return M
