return {
	"nvimdev/lspsaga.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter", -- optional
		"nvim-tree/nvim-web-devicons", -- optional
	},
	keys = {
		{ "<leader>rn", "<cmd>Lspsaga rename<cr>", desc = "lspsaga rename" },
		{ "<leader>k", "<cmd>Lspsaga hover_doc<cr>", desc = "hove doc" },
		{ "<leader>o", "<cmd>Lspsaga outline<cr>", desc = "outline" },
		{ "<leader>fd", "<cmd>Lspsaga finder<cr>", desc = "lsp finder" },
		{ "co", "<cmd>Lspsaga outgoing_calls<cr>", desc = "outgoing calls" },
		{ "ci", "<cmd>Lspsaga incoming_calls<cr>", desc = "incoming calls" },
		{ "ca", "<cmd>Lspsaga code_action<cr>", desc = "code action" },

		{ ";d", "<cmd>Lspsaga peek_definition<cr>", desc = "peek definition" },
		{ "gd", "<cmd>Lspsaga goto_definition<cr>", desc = "goto definition" },

		{ "[d", "<cmd>Lspsaga diagnostic_jump_prev<cr>", desc = "diagnostic jump prev" },
		{ "]d", "<cmd>Lspsaga diagnostic_jump_next<cr>", desc = "diagnostic jump next" },

		{ "<C-\\>", "<cmd>Lspsaga term_toggle<cr>", mode = { "n", "t" }, desc = "toggle term" },
	},
	init = function()
		require("lspsaga").setup({
			outline = {
				layout = "float",
				max_height = 0.6,
				left_width = 0.3,
			},
		})
	end,
}
