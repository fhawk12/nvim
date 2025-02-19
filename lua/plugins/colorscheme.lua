return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
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
					italic = true,
					transparency = true,
				},

				highlight_groups = {
					["@keyword.return"] = { fg = "love" },

					TreesitterContext = { bg = "base" },
				},
			})

			vim.cmd("colorscheme rose-pine")
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{
		"sainnhe/gruvbox-material",
		config = function()
			vim.g.gruvbox_material_background = "soft"
			vim.g.gruvbox_material_better_performance = 1

			-- vim.cmd.colorscheme("gruvbox-material")
		end,
	},
}
