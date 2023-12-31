return {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		"williamboman/mason.nvim",
		"neovim/nvim-lspconfig",
		{
			"folke/neodev.nvim",
		},
	},
	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"clangd",
				"gopls",
				"marksman",
				"tsserver",
				"eslint",
				"rust_analyzer",
			},
		})

		local lspconfig = require("lspconfig")
		-- Setup language servers.
		lspconfig.gopls.setup({})
		lspconfig.pyright.setup({})
		lspconfig.marksman.setup({})
		lspconfig.eslint.setup({})
		lspconfig.tsserver.setup({})
		lspconfig.cmake.setup({})
		--		lspconfig.clangd.setup({ capabilities = { offsetEncoding = "utf-8" } })
		lspconfig.rust_analyzer.setup({})
		lspconfig.clangd.setup({})
		lspconfig.lua_ls.setup({
			settings = {
				Lua = {
					workspace = {
						checkThirdParty = false,
					},
				},
			},
		})
	end,
}
