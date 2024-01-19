return {
	"nvimdev/lspsaga.nvim",
	event = "LspAttach",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		{ "ca", "<cmd>Lspsaga code_action<cr>", { desc = "Code action" } },
		{ ";d", "<cmd>Lspsaga peek_definition<cr>", { desc = "Peek definition" } },
		{ "gd", "<cmd>Lspsaga goto_definition<cr>", { desc = "Goto definition" } },
		{ "<leader>fi", "<cmd>Lspsaga finder<cr>", { desc = "Finder" } },
		{ "]d", "<cmd>Lspsaga diagnostic_jump_next<cr>", { desc = "Diagnostic jump next" } },
		{ "[d", "<cmd>Lspsaga diagnostic_jump_prev<cr>", { desc = "Diagnostic jump prev" } },
		{ "<C-\\>", "<cmd>Lspsaga term_toggle<cr>", mode = { "n", "t" }, { desc = "Toggle terminal" } },
		{ "<leader>k", "<cmd>Lspsaga hover_doc<cr>", { desc = "Hover doc" } },
		{ "<leader>o", "<cmd>Lspsaga outline<cr>", { desc = "Outline" } },
		{ "<leader>rn", "<cmd>Lspsaga rename<cr>", { desc = "Rename" } },
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
