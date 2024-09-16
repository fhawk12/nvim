return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		{ "nvim-lua/plenary.nvim" },
	},
	config = function()
		require("telescope").setup({
			defaults = {
				prompt_prefix = " ",
				selection_caret = " ",
				mappings = {
					i = {
						["<C-k>"] = "move_selection_next",
						["<C-;>"] = "move_selection_previous",
					},
				},
			},
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
		vim.keymap.set("n", "<space>se", builtin.find_files, {})
		vim.keymap.set("n", "<space>b", builtin.buffers, {})
		vim.keymap.set("n", "<space>sh", builtin.help_tags, {})
		vim.keymap.set("n", "<space>sb", builtin.current_buffer_fuzzy_find, {})
		vim.keymap.set("n", "<space>/", function()
			builtin.grep_string({ search = vim.fn.input("Grep > ") })
		end)
	end,
}
