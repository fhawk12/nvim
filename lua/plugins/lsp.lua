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

			vim.keymap.set("n", "<space>wi", "<cmd>Lspsaga incoming_calls<cr>", opts)
			vim.keymap.set("n", "<space>wo", "<cmd>Lspsaga outgoing_calls<cr>", opts)
			vim.keymap.set("n", "ca", "<cmd>Lspsaga code_action<cr>", opts)
			vim.keymap.set("n", "<space>q", "<cmd>Lspsaga peek_definition<cr>", opts)
			vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.jump({count=1, float=true})<cr>", opts)
			vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.jump({count=-1, float=true})<cr>", opts)
			vim.keymap.set("n", "<space>sr", "<cmd>Lspsaga finder<cr>", opts)
			vim.keymap.set("n", "E", "<cmd>Lspsaga hover_doc<cr>", opts)
			vim.keymap.set("n", "<space>o", "<cmd>Lspsaga outline<cr>", opts)
			vim.keymap.set("n", "<space>r", "<cmd>Lspsaga rename<cr>", opts)
			vim.keymap.set("n", "<space>R", "<cmd>Lspsaga project_replace<cr>", opts)
			vim.keymap.set("n", "<space>;", "<cmd>Lspsaga show_line_diagnostics<cr>", opts)
			vim.keymap.set("n", "<space>x", "<cmd>Lspsaga show_workspace_diagnostics<cr>", opts)
		end
		vim.keymap.set({ "n", "t" }, "<C-,>", "<cmd>Lspsaga term_toggle<cr>")

		local server_names = {
			"clangd",
			"rust_analyzer",
			"ts_ls",
			"gopls",
			"lua_ls",
			"cssls",
			"css_variables",
		}

		local nvim_lsp = require("lspconfig")
		-- local capabilities = require("cmp_nvim_lsp").default_capabilities()
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
	end,
}
