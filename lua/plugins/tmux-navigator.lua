return {
	"christoomey/vim-tmux-navigator",
	cmd = {
		"TmuxNavigateLeft",
		"TmuxNavigateDown",
		"TmuxNavigateUp",
		"TmuxNavigateRight",
		"TmuxNavigatePrevious",
	},
	keys = {
		{ "<c-h>", "<cmd>TmuxNavigateLeft<cr>" },
		{ "<c-n>", "<cmd>TmuxNavigateDown<cr>" },
		{ "<c-e>", "<cmd>TmuxNavigateUp<cr>" },
		{ "<c-i>", "<cmd>TmuxNavigateRight<cr>" },
	},
}
