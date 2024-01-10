return {
	"nvimdev/lspsaga.nvim",
	event = "LspAttach",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		{ "ca", "<cmd>Lspsaga code_action<cr>" },
		{ ";d", "<cmd>Lspsaga peek_definition<cr>" },
		{ "gd", "<cmd>Lspsaga goto_definition<cr>" },
		{ "<leader>fi", "<cmd>Lspsaga finder<cr>" },
		{ "]d", "<cmd>Lspsaga diagnostic_jump_next<cr>" },
		{ "[d", "<cmd>Lspsaga diagnostic_jump_prev<cr>" },
		{ "<C-\\>", "<cmd>Lspsaga term_toggle<cr>", mode = { "n", "t" } },
		{ "<leader>k", "<cmd>Lspsaga hover_doc<cr>" },
		{ "<leader>o", "<cmd>Lspsaga outline<cr>" },
		{ "<leader>rn", "<cmd>Lspsaga rename<cr>" },
	},
	config = function()
		require("lspsaga").setup({
			outline = {
				layout = "float",
			},
		})
		vim.api.nvim_set_hl(0, "WinBar", { fg = "None", bg = "None" })
	end,
}
