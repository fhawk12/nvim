------ toggle bool ------
function ToggleBoolean()
	local word = vim.fn.expand("<cword>")
	if Is_bool(word) then
		local res = not To_bool(word)
		vim.cmd("normal! ciw" .. tostring(res))
	end
end

function Is_bool(str)
	return str == "true" or str == "false"
end

function To_bool(str)
	return str == "true"
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

	for _, buf in ipairs(buflist) do
		if buf.bufnr ~= current_bufnr then
			vim.cmd("bd" .. buf.bufnr)
		end
	end
end

vim.cmd("command! -nargs=0 Bda lua vim.fn.Close_all_buffers_except_current()")
vim.fn["Close_all_buffers_except_current"] = Close_all_buffers_except_current

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

----- code running ----
local function split()
  local winsel = vim.fn.win_getid()
  local winhei = vim.fn.winheight(winsel)
  local winwid = vim.fn.winwidth(winsel)
  if winhei * 2.5 > winwid then
    vim.o.splitbelow = true
    vim.cmd('split')
    vim.cmd('resize-5')
  else
    vim.o.splitright = true
    vim.cmd('vsplit')
    vim.cmd('vertical resize-20')
  end
end

local function Run()
  vim.cmd('w')
  if (vim.bo.filetype == 'c') then
    split()
    if (vim.fn.filereadable('Makefile') == 1) then
      vim.cmd('term make && ./Main')
    else
      vim.cmd('term gcc "%" -o "%<" && "./%<" && rm -f "./%<"')
    end
  elseif (vim.bo.filetype == 'cpp') then
    split()
    if (vim.fn.filereadable('Makefile') == 1) then
      vim.cmd('term make && ./Main')
    else
      vim.cmd('term g++ "%" -std=c++17 -O2 -g -Wall -o "%<" && "./%<" && rm -f "./%<"')
    end
  elseif (vim.bo.filetype == 'python') then
    split()
    vim.cmd('term python3 "%"')
  elseif (vim.bo.filetype == 'lua') then
    split()
    vim.cmd('term lua "%"')
  elseif (vim.bo.filetype == 'markdown') then
    vim.cmd('MarkdownPreview')
  elseif (vim.bo.filetype == 'sh') then
    split()
    vim.cmd('term bash "%"')
  elseif (vim.bo.filetype == 'html') then
    vim.cmd([[
      tabe
      term live-server --browser=wyeb
      tabclose
    ]])
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Esc>', true, true, true), 'n', true)
  end
end

vim.keymap.set('n', '<F5>', Run, {})
