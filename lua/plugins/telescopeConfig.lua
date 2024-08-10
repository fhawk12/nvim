require("telescope").setup({
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		},
	},
})
require("telescope").load_extension("fzf")

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>se", builtin.find_files, {})
vim.keymap.set("n", "<leader>sb", builtin.buffers, {})
vim.keymap.set("n", "<leader>sh", builtin.help_tags, {})
vim.keymap.set("n", "<leader>/", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
