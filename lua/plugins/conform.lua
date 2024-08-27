return {
	"stevearc/conform.nvim",
	keys = {
		{ "<leader>f", "<cmd>lua require('conform').format()<cr>" },
	},
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				rust = { "rustfmt" },
				["*"] = { "prettier" },
			},
			default_format_opts = {
				lsp_format = "fallback",
			},
			-- format_on_save = {
			--     timeout_ms = 500,
			--     lsp_format = "fallback",
			-- },
		})
	end,
}
