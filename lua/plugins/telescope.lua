return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.4",
	-- or                              , branch = '0.1.x',
	dependencies = { "nvim-lua/plenary.nvim", "BurntSushi/ripgrep" },
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
				mappings = {
					i = {
						-- map actions.which_key to <C-h> (default: <C-/>)
						-- actions.which_key shows the mappings for your picker,
						-- e.g. git_{create, delete, ...}_branch for the git_branches picker
						["<c-t>"] = trouble.open_with_trouble,
						["<c-h>"] = "which_key",
						["<C-k>"] = require("telescope.actions").move_selection_previous,
						["<C-j>"] = require("telescope.actions").move_selection_next,
					},
					n = {
						["<c-n>"] = trouble.open_with_trouble,
					},
				},
			},
			pickers = {
				-- Default configuration for builtin pickers goes here:
				-- picker_name = {
				--   picker_config_key = value,
				--   ...
				-- }
				-- Now the picker_config_key will be applied every time you call this
				-- builtin picker
			},
			extensions = {
				-- Your extension configuration goes here:
				-- extension_name = {
				--   extension_config_key = value,
				-- }
				-- please take a look at the readme of the extension you want to configure
			},
		})
	end,
}
