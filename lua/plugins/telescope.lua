return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"BurntSushi/ripgrep",
		"nvim-telescope/telescope-fzy-native.nvim",
	},
	config = function()
		local function map(mode, lhs, rhs, opts)
			vim.keymap.set(mode, lhs, rhs, opts)
		end

		local builtin = require("telescope.builtin")
		map("n", "<leader>ff", builtin.find_files, { desc = "find files" })
		map("n", "<leader>fa", builtin.live_grep, { desc = "live grep" })
		map("n", "<leader>b", builtin.buffers, { desc = "find buffer" })
		map("n", "<leader>fh", builtin.help_tags, { desc = "find help doc" })
		map("n", "gr", builtin.lsp_references, { desc = "lsp references" })
		-- map("n", "gd", builtin.lsp_definitions, {}) -- conflict with lspsage
		map("n", "gD", builtin.lsp_type_definitions, { desc = "lsp type definitions" })
		map("n", "gi", builtin.lsp_implementations, { desc = "lsp implementations" })

		-- git
		map("n", "<leader>gd", builtin.git_status, { desc = "Show Git Status" })

		local trouble = require("trouble.providers.telescope")

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
	end,
}
