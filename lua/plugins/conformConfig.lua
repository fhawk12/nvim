require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "isort", "black" },
		rust = { "rustfmt", lsp_format = "fallback" },
		javascript = { "prettier" },
		typescript = { "prettier" },
		tsx = { "prettier" },
		jsx = { "prettier" },
		json = { "prettier" },
		toml = { "prettier" },
		html = { "prettier" },
		css = { "prettier" },
		scss = { "prettier" },
		markdown = { "prettier" },
	},
	default_format_opts = {
		lsp_format = "fallback",
	},
	-- format_on_save = {
	--     -- These options will be passed to conform.format()
	--     timeout_ms = 500,
	--     lsp_format = "fallback",
	-- },
})

vim.keymap.set("n", "<leader>f", "<cmd>lua require('conform').format()<cr>")
