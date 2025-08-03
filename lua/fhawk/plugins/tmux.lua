return {
	"aserowy/tmux.nvim",
	lazy = false,
	keys = {
		{ "<C-h>", "<cmd>lua require('tmux').move_left()<cr>" },
		{ "<C-n>", "<cmd>lua require('tmux').move_bottom()<cr>" },
		{ "<C-e>", "<cmd>lua require('tmux').move_top()<cr>" },
		{ "<C-i>", "<cmd>lua require('tmux').move_right()<cr>" },
	},
	config = function()
		require("tmux").setup()
	end,
}
