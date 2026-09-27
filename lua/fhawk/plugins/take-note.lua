require("render-markdown").setup({})
require("obsidian").setup({
	picker = { name = "telescope.nvim" },
	legacy_commands = false, -- this will be removed in 4.0.0
	workspaces = {
		{
			name = "zettelkasten",
			path = "~/vaults/zettelkasten",
		},
	},
	note_id_func = function(title)
		-- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
		-- In this case a note with the title 'My new note' will be given an ID that looks
		-- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
		local suffix = ""
		if title ~= nil then
			-- If title is given, transform it into valid file name.
			suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
		else
			-- If title is nil, just add 4 random uppercase letters to the suffix.
			for _ = 1, 4 do
				suffix = suffix .. string.char(math.random(65, 90))
			end
		end
		return tostring(os.time()) .. "-" .. suffix
	end,
})

vim.keymap.set("n", "<leader>nf", "<cmd>Obsidian quick_switch<cr>", { desc = "Open notes" })
vim.keymap.set("n", "<leader>n/", "<cmd>Obsidian search<cr>", { desc = "Search in notes" })
vim.keymap.set("n", "<leader>nt", "<cmd>Obsidian tags<cr>", { desc = "Open note tags" })
vim.keymap.set("n", "<space>nn", function()
	vim.print("Enter a title: ")
	vim.ui.input({ prompt = "Enter a title: " }, function(title)
		if title == nil or title == "" then
			return
		end
		local command = "Obsidian new " .. title
		vim.cmd(command)
	end)
end, { desc = "Obsidian new" })
