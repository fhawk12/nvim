return {
	{ "rktjmp/lush.nvim" },
	{ "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 },
	{
		"slugbyte/lackluster.nvim",
		lazy = false,
		priority = 1000,
		init = function()
			-- vim.cmd.colorscheme("lackluster")
			vim.cmd.colorscheme("lackluster-hack")
			-- vim.cmd.colorscheme("lackluster-mint")
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
					transparency = false,
				},

				highlight_groups = {
					PmenuExtra = { bg = "None" },
				},
			})

			-- vim.cmd("colorscheme rose-pine")
		end,
	},
}
