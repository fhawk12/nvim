local win = require("utils.float_win")

local function create_window()
	local opts = {
		title = " Code running ",
		width = 0.3,
		height = 0.8,
		pos = "cr",
	}
	vim.g.run_code = true
	vim.g.run_code_float_win = win.create_window(opts)
end

function RunCode()
	vim.cmd("w")
	local filename = vim.fn.expand("%:p")
	local running_file = vim.fn.expand("%:t:r")
	local ft = vim.bo.filetype

	if vim.g.run_code and vim.api.nvim_win_is_valid(vim.g.run_code_float_win) then
		vim.api.nvim_win_close(vim.g.run_code_float_win, true)
	end
	create_window()

	if ft == "c" then
		vim.cmd(string.format('term gcc -g "%s" -o "%s" && ./"%s"', filename, running_file, running_file))
	elseif ft == "cpp" then
		vim.cmd(string.format('term g++ -g "%s" -o "%s" && ./"%s"', filename, running_file, running_file))
	elseif ft == "python" then
		vim.cmd(string.format('term python3 "%s"', filename))
	elseif ft == "java" then
		vim.cmd(string.format('term java "%s"', filename))
	elseif ft == "lua" then
		vim.cmd(string.format('term lua "%s"', filename))
	elseif ft == "sh" then
		vim.cmd(string.format('term bash "%s"', filename))
	elseif ft == "javascript" then
		vim.cmd(string.format('term node "%s"', filename))
	elseif ft == "html" then
		vim.cmd(string.format('term firefox "%s"', filename))
	else
		print(string.format("please config run code for %s", ft))
	end
end
