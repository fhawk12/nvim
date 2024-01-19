return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{ "]t", "<cmd>lua require('todo-comments').jump_next()<cr>", desc = "Next todo comment" },
		{ "[t", "<cmd>lua require('todo-comments').jump_prev()<cr>", desc = "Previous todo comment" },
		{ "<leader>tt", "<cmd>TodoTelescope<cr>", desc = "Search todos with Telescope" },
	},
	init = function()
		require("todo-comments").setup({})
	end,
}
