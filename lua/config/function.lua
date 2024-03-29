------ toggle bool ------
function ToggleBoolean()
	local word = vim.fn.expand("<cword>")
	if word == "true" or word == "false" then
		local res = not (word == "true")
		vim.cmd("normal! ciw" .. tostring(res))
	end
end

------ jump stack trace -------
function Preview_stack_trace()
	local line = vim.api.nvim_get_current_line()
	local pattern = "([^:]+):(%d+):(%d+)"
	local filepath, line_nr, column_nr = string.match(line, pattern)
	if filepath and line_nr and column_nr then
		vim.cmd(":wincmd k")
		vim.cmd("e " .. filepath)
		vim.api.nvim_win_set_cursor(0, { tonumber(line_nr), tonumber(column_nr) })
		vim.cmd(":wincmd j")
	end
end

------ close all buf except current ------
function Close_all_buffers_except_current()
	local current_bufnr = vim.fn.bufnr("%")
	local buflist = vim.fn.getbufinfo({ buflisted = 1 })
  if buflist == nil then
    return
  end
	for _, buf in ipairs(buflist) do
		if buf.bufnr ~= current_bufnr then
			vim.cmd("bd " .. buf.bufnr)
		end
	end
end

vim.cmd("command! Bda lua Close_all_buffers_except_current()")

------ toggle current word case ------
function Toggle_current_word_case()
	local cur_word = tostring(vim.fn.expand("<cword>"))
	local patter_upper = "([A-Z_]+)"
	local patter_lower = "([a-z_]+)"

	if string.match(cur_word, patter_lower) == cur_word then
		vim.cmd(":normal! viwU")
		vim.cmd(":normal! e")
	end

	if string.match(cur_word, patter_upper) == cur_word then
		vim.cmd(":normal! viwu")
		vim.cmd(":normal! e")
	end
end

------ delete executable files ------
function Delete_executable_files()
	local get_name_cmd = "find . -type f -executable"
	local files = vim.fn.system(get_name_cmd)
	local delete_cmd = "rm -f " .. files
	vim.fn.system(delete_cmd)
end

------ update the nvim-tree directory ------
function Update_nvim_tree_pwd()
	local nvim_tree = require("nvim-tree")
	nvim_tree.change_dir(vim.fn.getcwd())
end
