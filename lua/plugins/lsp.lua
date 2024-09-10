return {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		{ "neovim/nvim-lspconfig" },
		{ "williamboman/mason.nvim" },
		{ "j-hui/fidget.nvim", opts = {} },
		{
			"nvimdev/lspsaga.nvim",
			opts = {
				outline = {
					keys = {
						jump = "<cr>",
					},
				},
				ui = {
					code_action = "",
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
			vim.keymap.set("n", "<C-[>", "<cmd>Lspsaga goto_definition<cr>", opts)
			vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_next<cr>", opts)
			vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opts)
			vim.keymap.set("n", "<space>j", "<cmd>Lspsaga finder<cr>", opts)
			vim.keymap.set({ "n", "t" }, ",t", "<cmd>Lspsaga term_toggle<cr>", opts)
			vim.keymap.set("n", "E", "<cmd>Lspsaga hover_doc<cr>", opts)
			vim.keymap.set("n", "<space>o", "<cmd>Lspsaga outline<cr>", opts)
			vim.keymap.set("n", "<space>r", "<cmd>Lspsaga rename<cr>", opts)
			vim.keymap.set("n", "<space>;", vim.diagnostic.open_float, opts)
		end

		local server_names = {
			"clangd",
			"rust_analyzer",
			"ts_ls",
			"lua_ls",
			"cssls",
			"css_variables",
		}

		require("mason").setup({})
		require("mason-lspconfig").setup({
			ensure_installed = server_names,
			automatic_installation = true,
			handlers = {
				function(server_name)
					require("lspconfig")[server_name].setup({
						on_attach = on_attach,
						capabilities = require("cmp_nvim_lsp").default_capabilities(),
					})
				end,
			},
		})

		require("lspconfig").lua_ls.setup({
			on_attach = on_attach,
			capabilities = require("cmp_nvim_lsp").default_capabilities(),
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
