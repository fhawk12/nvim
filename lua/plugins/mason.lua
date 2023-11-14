return {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		"williamboman/mason.nvim",
		"neovim/nvim-lspconfig",
	},
	init = function()
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"clangd",
				"pyright",
				"gopls",
				"marksman",
				"eslint",
				"tsserver",
				"rust_analyzer",
			},
		})

		local lspconfig = require("lspconfig")
		-- Setup language servers.
		lspconfig.gopls.setup({})
		lspconfig.pyright.setup({})
		lspconfig.jdtls.setup({})
		lspconfig.marksman.setup({})
		lspconfig.eslint.setup({})
		lspconfig.cssls.setup({})
		lspconfig.tsserver.setup({})
		lspconfig.cmake.setup({})
		lspconfig.clangd.setup({ capabilities = { offsetEncoding = "utf-8" } })
		lspconfig.rust_analyzer.setup({})
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
