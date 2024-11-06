return {
	"folke/zen-mode.nvim",
	keys = {
		{ "<space>z", "<cmd>ZenMode<cr>" },
	},
	opts = {
    window = {
      width = 120,
    },
		plugins = {
			options = {
				enabled = true,
				ruler = false,
				showcmd = false,
				laststatus = 0,
			},
			twilight = { enabled = true },
			gitsigns = { enabled = true },
			tmux = { enabled = true },
			todo = { enabled = false },
		},
	},
}
