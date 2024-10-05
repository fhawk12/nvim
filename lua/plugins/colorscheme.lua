return {
	-- Lazy
	{
		"vague2k/vague.nvim",
		config = function()
			require("vague").setup({
				transparent = false,
			})

			-- vim.cmd.colorscheme("vague")
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
	{
		"slugbyte/lackluster.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			local lackluster = require("lackluster")

			lackluster.setup({
				tweak_syntax = {
					comment = lackluster.color.gray5,
				},
				tweak_background = {
					-- normal = "default", -- main background
					normal = "none", -- transparent
				},
				tweak_highlight = {
					FloatBorder = {
						overwrite = true,
						fg = lackluster.color.gray5,
						bg = "NONE",
					},
					["@keyword"] = {
						overwrite = true,
						bold = false,
						italic = true,
						fg = lackluster.color.gray6,
					},
					["@keyword.return"] = {
						overwrite = true,
						bold = false,
						italic = true,
						fg = lackluster.color.green,
					},
				},
			})

			vim.cmd.colorscheme("lackluster-hack")
		end,
	},
	{
		"sainnhe/everforest",
		config = function()
			vim.g.everforest_background = "soft"
			-- vim.cmd("colorscheme everforest")
		end,
	},
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
					legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
					migrations = true, -- Handle deprecated options automatically
				},

				styles = {
					bold = false,
					italic = false,
					transparency = true,
				},

				highlight_groups = {
					PmenuExtra = { bg = "None" },
				},
			})

			-- vim.cmd("colorscheme rose-pine")
		end,
	},
}
