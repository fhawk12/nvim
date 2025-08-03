return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = true })
			end,
		},
	},
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
		},
		default_format_opts = {
			lsp_format = "fallback",
		},
	},
}
