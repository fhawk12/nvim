return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = false,
		priority = 1000,
		config = function()
			require("rose-pine").setup({
				variant = "moon", -- auto, main, moon, or dawn
				dark_variant = "main", -- main, moon, or dawn
				dim_inactive_windows = false,
				extend_background_behind_borders = false,

				enable = {
					terminal = true,
					legacy_highlights = false, -- Improve compatibility for previous versions of Neovim
					migrations = true, -- Handle deprecated options automatically
				},

				styles = {
					bold = false,
					italic = false,
					transparency = true,
				},

				highlight_groups = {
					["@keyword.return"] = { fg = "love" },

					TreesitterContext = { bg = "base" },
				},
			})

			vim.cmd.colorscheme("rose-pine")
		end,
	},
	{
		"sainnhe/gruvbox-material",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.gruvbox_material_background = "soft"
			vim.g.gruvbox_material_better_performance = 1
			vim.g.gruvbox_material_enable_italic = 0

			-- vim.cmd.colorscheme("gruvbox-material")
		end,
	},
	{
		{
			"vague2k/vague.nvim",
			config = function()
				require("vague").setup({
					transparent = true,
					style = {
						boolean = "none",
						number = "none",
						float = "none",
						error = "none",
						comments = "none",
						conditionals = "none",
						functions = "none",
						headings = "none",
						operators = "none",
						strings = "none",
						variables = "none",

						-- keywords
						keywords = "none",
						keyword_return = "none",
						keywords_loop = "none",
						keywords_label = "none",
						keywords_exception = "none",

						-- builtin
						builtin_constants = "none",
						builtin_functions = "none",
						builtin_types = "none",
						builtin_variables = "none",
					},
					colors = {},
				})
			end,
		},
	},
}
