require("rose-pine").setup({
	variant = "auto", -- auto, main, moon, or dawn
	dark_variant = "main", -- main, moon, or dawn
	dim_inactive_windows = false,
	extend_background_behind_borders = true,

	enable = {
		terminal = true,
		legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
		migrations = true, -- Handle deprecated options automatically
	},

	styles = {
		bold = true,
		italic = true,
		transparency = true,
	},

	highlight_groups = {
		PmenuExtra = { bg = "none" },
	},
})
vim.cmd("colorscheme rose-pine")

require("tokyonight").setup({
	transparent = true,
})
-- vim.cmd[[colorscheme tokyonight-night]]

require("catppuccin").setup({
	flavour = "latte", -- latte, frappe, macchiato, mocha
	transparent_background = true, -- disables setting the background color.
	term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
	dim_inactive = {
		enabled = false, -- dims the background color of inactive window
		shade = "dark",
		percentage = 0.15, -- percentage of the shade to apply to the inactive window
	},
	no_underline = true, -- Force no underline
	color_overrides = {},
	custom_highlights = {},
	default_integrations = true,
})
-- vim.cmd.colorscheme("catppuccin")
