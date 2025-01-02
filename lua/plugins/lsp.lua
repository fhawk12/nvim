return {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		{ "neovim/nvim-lspconfig" },
		{ "williamboman/mason.nvim" },
		{ "stevearc/dressing.nvim", opts = {} },
		{
			"nvimdev/lspsaga.nvim",
			opts = {
				symbol_in_winbar = {
					enable = false,
				},
				outline = {
					layout = "float",
					keys = {
						jump = "<cr>",
					},
				},
				lightbulb = {
					enable = false,
				},
			},
		},
	},
	config = function()
		local on_attach = function(_, bufnr)
			local opts = { buffer = bufnr, noremap = true, silent = true }

			-- vim.keymap.set("", "<space>f", "<cmd>lua vim.lsp.buf.format({async = false, timeout_ms = 10000})<cr>") -- be replaced by conform
			vim.keymap.set("n", "<space>wi", "<cmd>Lspsaga incoming_calls<cr>", opts)
			vim.keymap.set("n", "<space>wo", "<cmd>Lspsaga outgoing_calls<cr>", opts)
			vim.keymap.set("n", "ca", "<cmd>Lspsaga code_action<cr>", opts)
			vim.keymap.set("n", "<space>q", "<cmd>Lspsaga peek_definition<cr>", opts)
			vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", opts)
			vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", opts)
			vim.keymap.set("n", "<space>rr", "<cmd>Lspsaga finder<cr>", opts)
			vim.keymap.set("n", "E", "<cmd>Lspsaga hover_doc<cr>", opts)
			vim.keymap.set("n", "<space>o", "<cmd>Lspsaga outline<cr>", opts)
			vim.keymap.set("n", "<space>rn", "<cmd>Lspsaga rename<cr>", opts)
			vim.keymap.set("n", "<space>R", "<cmd>Lspsaga project_replace<cr>", opts)
			vim.keymap.set("n", "<space>;", "<cmd>Lspsaga show_line_diagnostics<cr>", opts)
			vim.keymap.set("n", "<space>x", "<cmd>Lspsaga show_workspace_diagnostics<cr>", opts)
		end
		-- vim.keymap.set({ "n", "t" }, "<C-/>", "<cmd>Lspsaga term_toggle<cr>") -- replaced by snacks

		local server_names = {
			"clangd",
			"rust_analyzer",
			"ts_ls",
			"denols",
			"gopls",
			"lua_ls",
			"cssls",
			"css_variables",
		}

		local nvim_lsp = require("lspconfig")
		local capabilities = {}

		require("mason").setup({})
		require("mason-lspconfig").setup({
			ensure_installed = server_names,
			automatic_installation = true,
			handlers = {
				function(server_name)
					require("lspconfig")[server_name].setup({
						on_attach = on_attach,
						capabilities = capabilities,
					})
				end,
			},
		})

		nvim_lsp.lua_ls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			settings = {
				Lua = {
					runtime = {
						-- Tell the language server which version of Lua you're using
						version = "LuaJIT",
						path = vim.split(package.path, ";"),
					},
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						-- Make the server aware of Neovim runtime files
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
						},
					},
					telemetry = {
						enable = false,
					},
				},
			},
		})

		nvim_lsp.denols.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc"),
		})
		nvim_lsp.ts_ls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			root_dir = nvim_lsp.util.root_pattern("package.json"),
			single_file_support = false,
		})
	end,
}
