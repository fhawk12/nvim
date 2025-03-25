Toggle_bool = function()
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

Comment = function()
	local row, col = unpack(vim.api.nvim_win_get_cursor(0))
	vim.api.nvim_command("normal gcc")
	vim.api.nvim_win_set_cursor(0, { row, col })
end

Rename_file = function()
    local old_name = vim.fn.expand("%:p")
    local new_name = vim.fn.input("New name: ", old_name)

    if new_name == "" or new_name == old_name then
        return
    end

    vim.cmd("saveas " .. vim.fn.fnameescape(new_name))
    vim.cmd("silent !rm " .. vim.fn.shellescape(old_name))

    local old_buf = vim.fn.bufnr(old_name, 0)
    if old_buf ~= -1 then
        vim.api.nvim_buf_delete(old_buf, { force = true })
    end

    print("Renamed " .. old_name .. " to " .. new_name)
end
