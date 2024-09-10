return {
	"nvimdev/lspsaga.nvim",
	event = "LspAttach",
	keys = {
		{ "<space>wi", "<cmd>Lspsaga incoming_calls<cr>" },
		{ "<space>wo", "<cmd>Lspsaga outgoing_calls<cr>" },
		{ "ca", "<cmd>Lspsaga code_action<cr>" },
		{ "<space>q", "<cmd>Lspsaga peek_definition<cr>" },
		{ "<C-[>", "<cmd>Lspsaga goto_definition<cr>" },
		{ "[d", "<cmd>Lspsaga diagnostic_jump_next<cr>" },
		{ "]d", "<cmd>Lspsaga diagnostic_jump_prev<cr>" },
		{ "<space>j", "<cmd>Lspsaga finder<cr>" },
		{ ",t", "<cmd>Lspsaga term_toggle<cr>", mode = { "n", "t" } },
		{ "E", "<cmd>Lspsaga hover_doc<cr>" },
		{ "<space>o", "<cmd>Lspsaga outline<cr>" },
		{ "<space>r", "<cmd>Lspsaga rename<cr>" },
	},
	opts = {
		outline = {
			keys = {
				jump = "<cr>",
			},
		},
		ui = {
			code_action = "",
		},
	},
}
