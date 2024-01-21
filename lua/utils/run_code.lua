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
	local filename = vim.fn.expand("%:p")
	local running_file = vim.fn.expand("%:t:r")
	local ft = vim.bo.filetype

	create_window()
	if ft == "c" then
		vim.cmd(string.format('term gcc "%s" -o "%s" && ./"%s"', filename, running_file, running_file))
	elseif ft == "cpp" then
		vim.cmd(string.format('term g++ "%s" -o "%s" && ./"%s"', filename, running_file, running_file))
	elseif ft == "python" then
		vim.cmd(string.format('term python3 "%s"', filename))
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
