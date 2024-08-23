local M = {}

M.toggle_bool = function()
	require("utils.toggle").bool()
end

M.comment = function()
	require("utils.comment").comment()
end

M.terminal = function()
	require("utils.float_term").open_float_term()
end

return M
