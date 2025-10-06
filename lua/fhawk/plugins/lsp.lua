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
					lua_ls = {},
					gopls = {},
					templ = {},
					rust_analyzer = {},
					html = {},
					cssls = {},
					ts_ls = {},
					tailwindcss = {},
					vuels = {},
					pyright = {},
				},
			},
			config = function(_, opts)
				vim.diagnostic.config({
					underline = true,
					virtual_text = true,
					virtual_lines = false,
					update_in_insert = false,
					signs = {
						text = {
							[vim.diagnostic.severity.ERROR] = " ",
							[vim.diagnostic.severity.WARN] = " ",
							[vim.diagnostic.severity.INFO] = " ",
							[vim.diagnostic.severity.HINT] = " ",
						},
					},
				})

				require("mason-lspconfig").setup({
					ensure_installed = vim.tbl_keys(opts.servers),
					automatic_enable = false,
				})

				local vue_language_server_path = vim.fn.stdpath("data")
					.. "/mason/packages/vue-language-server/node_modules/@vue/language-server/bin/vue-language-server.js"
				local html_language_server_path = vim.fn.stdpath("data")
					.. "/mason/packages/html-lsp/node_modules/vscode-langservers-extracted/bin/vscode-html-language-server"
				local css_language_server_path = vim.fn.stdpath("data")
					.. "/mason/packages/css-lsp/node_modules/vscode-langservers-extracted/bin/vscode-css-language-server"
				local tailwindcss_language_server = vim.fn.stdpath("data")
					.. "/mason/packages/tailwindcss-language-server/node_modules/@tailwindcss/language-server/bin/tailwindcss-language-server"

				local vue_plugin = {
					name = "@vue/typescript-plugin",
					location = vue_language_server_path,
					languages = { "vue" },
				}

				for server, config in pairs(opts.servers) do
					if server == "ts_ls" then
						config = {
							init_options = {
								plugins = {
									vue_plugin,
								},
							},
						}

						config.filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" }
					end
					config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
					vim.lsp.config(server, config)
					vim.lsp.enable(server)
				end
			end,
		},
	},
}
