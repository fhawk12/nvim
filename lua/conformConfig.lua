require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "isort", "black" },
		rust = { "rustfmt", lsp_format = "fallback" },
		javascript = { "prettierd", "prettier", stop_after_first = true },
		typescript = { "prettierd", "prettier", stop_after_first = true },
		html = { "prettierd", "prettier", stop_after_first = true },
		css = { "prettierd", "prettier", stop_after_first = true },
		scss = { "prettierd", "prettier", stop_after_first = true },
	},
	-- format_on_save = {
	-- These options will be passed to conform.format()
	-- timeout_ms = 500,
	-- lsp_format = "fallback",
	-- },
})

vim.keymap.set("n", "<leader>f", "<cmd>lua require('conform').format()<cr>")
