local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")

mason.setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

mason_lspconfig.setup({
	automatic_enable = {
		exclude = { "rust_analyzer" },
	},
	ensure_installed = {
		"lua_ls",
		"ts_ls",
		"html",
		"cssls",
		"tailwindcss",
		"clangd",
		"marksman",
		"svelte",
		"stylua",
		"jsonls",
		"taplo",
		"zk",
	},
})
