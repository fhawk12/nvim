local win = require("utils.float_win")

local function create_window()
	local opts = {
		title = "Code running",
		width = 0.3,
		height = 0.8,
		pos = "cr",
	}
	win.create_window(opts)
end

function RunCode()
	vim.cmd("w")
	local filename = vim.fn.expand("%")
	local running_file = vim.fn.expand("%<")

	if vim.bo.filetype == "c" then
		create_window()
		if vim.fn.filereadable("Makefile") == 1 then
			vim.cmd("term make && ./Main")
		else
			vim.cmd(string.format('term gcc "%s" -o "%s" && ./"%s"', filename, running_file, running_file))
		end
	elseif vim.bo.filetype == "cpp" then
		create_window()
		if vim.fn.filereadable("Makefile") == 1 then
			vim.cmd("term make && ./Main")
		else
			-- vim.cmd('term g++ "%" -std=c++17 -O2 -g -Wall -o "%<" && "./%<" && rm -f "./%<"')
			-- vim.cmd('term g++ "%" -std=c++17 -O2 -g -Wall -o "%<" && "./%<"')
			vim.cmd(string.format('term g++ "%s" -o "%s" && ./"%s"', filename, running_file, running_file))
		end
	elseif vim.bo.filetype == "python" then
		create_window()
		vim.cmd(string.format('term python3 "%s"', filename))
	elseif vim.bo.filetype == "lua" then
		create_window()
		vim.cmd(string.format('term lua "%s"', filename))
	elseif vim.bo.filetype == "sh" then
		create_window()
		vim.cmd(string.format('term bash "%s"', filename))
	end
end
