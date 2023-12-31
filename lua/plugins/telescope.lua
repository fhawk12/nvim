return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"BurntSushi/ripgrep",
		"nvim-telescope/telescope-fzy-native.nvim",
	},
	config = function()
		require("telescope").setup({
			defaults = {
				prompt_prefix = " ",
				selection_caret = " ",
				layout_config = {
					horizontal = { prompt_position = "top", results_width = 0.6 },
					vertical = { mirror = false },
				},
				sorting_strategy = "ascending",
				file_previewer = require("telescope.previewers").vim_buffer_cat.new,
				grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
				qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
			},
			extensions = {
				extensions = {
					fzy_native = {
						override_generic_sorter = false,
						override_file_sorter = true,
					},
				},
			},
		})
		require("telescope").load_extension("fzy_native")

		local function map(mode, lhs, rhs, opts)
			vim.keymap.set(mode, lhs, rhs, opts)
		end

		local builtin = require("telescope.builtin")
		map("n", "<leader>ff", builtin.find_files, { desc = "find files" })
		map("n", "<leader>/", builtin.live_grep, { desc = "live grep" })
		map("n", "<leader>b", builtin.buffers, { desc = "find buffer" })
		map("n", "<leader>fh", builtin.help_tags, { desc = "find help doc" })
	end,
}
