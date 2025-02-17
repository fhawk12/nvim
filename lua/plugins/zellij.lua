return {
	"swaits/zellij-nav.nvim",
	lazy = true,
	event = "VeryLazy",
	keys = {
		{ "<C-h>", "<cmd>ZellijNavigateLeftTab<cr>", { silent = true, desc = "navigate left or tab" } },
		{ "<C-n>", "<cmd>ZellijNavigateDown<cr>", { silent = true, desc = "navigate down" } },
		{ "<C-e>", "<cmd>ZellijNavigateUp<cr>", { silent = true, desc = "navigate up" } },
		{ "<C-i>", "<cmd>ZellijNavigateRightTab<cr>", { silent = true, desc = "navigate right or tab" } },
	},
	opts = {},
}
