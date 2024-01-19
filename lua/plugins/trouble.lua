return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		{ "<leader>xx", "<cmd>lua require('trouble').toggle()<cr>", desc = "Toggle trouble list" },
	},
	opts = {},
}
