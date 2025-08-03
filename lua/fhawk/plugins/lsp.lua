return {
	"mason-org/mason-lspconfig.nvim",
	opts = {},
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		{
			"neovim/nvim-lspconfig",
			dependencies = {
				"saghen/blink.cmp",
			},
			opts = {
				servers = {
					lua_ls = {
						-- TODO
					},
				},
			},
			config = function(_, opts)
				local lspconfig = require("lspconfig")
				for server, config in pairs(opts.servers) do
					config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
					lspconfig[server].setup(config)
				end
			end,
		},
	},
	config = function()
		local lsp_servers = {
			"lua_ls",
			"gopls",
			"templ",
			"rust_analyzer",
			"html",
			"cssls",
			"tailwindcss",
			"ts_ls",
			"pyright",
		}
		require("mason-lspconfig").setup({
			ensure_installed = lsp_servers,
		})
	end,
}
