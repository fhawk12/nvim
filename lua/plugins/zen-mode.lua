return {
	"folke/zen-mode.nvim",
	keys = {
		{ "<leader>z", "<cmd>ZenMode<cr>", desc = "Toggle Zen Mode" },
	},
	opts = {
		window = {
			options = {
				signcolumn = "no", -- disable signcolumn
				number = false, -- disable number column
				relativenumber = false, -- disable relative numbers
				cursorline = false, -- disable cursorline
				cursorcolumn = false, -- disable cursor column
				foldcolumn = "0", -- disable fold column
				list = false, -- disable whitespace characters
			},
		},
	},
}
