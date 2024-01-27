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
				"cmake",
				"bashls",
			},
		})

		local servers = {
			clangd = {},
			gopls = {},
			eslint = {},
			tsserver = {},
			cmake = {},
			marksman = {},
			rust_analyzer = {},
			bashls = {},
			lua_ls = {
				settings = {
					Lua = {
						workspace = {
							checkThirdParty = false,
						},
					},
				},
			},
		}

		require("neodev").setup()

		for server, config in pairs(servers) do
			require("lspconfig")[server].setup(config)
		end
	end,
}
