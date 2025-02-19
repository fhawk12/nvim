return {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		{ "saghen/blink.cmp" },
		{ "neovim/nvim-lspconfig" },
		{ "williamboman/mason.nvim" },
		{ "stevearc/dressing.nvim", opts = {} },
	},
	config = function()
		local on_attach = function(_, bufnr)
			local opts = { buffer = bufnr, noremap = true, silent = true }

			vim.keymap.set("n", "ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
			vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", opts)
			vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", opts)
			vim.keymap.set("n", "E", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
			vim.keymap.set("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
			vim.keymap.set("n", "<space>;", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)
		end

		local server_names = {
			"clangd",
			"rust_analyzer",
			"ts_ls",
			"denols",
			"svelte",
			"jsonls",
			"zls",
			"gopls",
			"lua_ls",
			"cssls",
			"cssmodules_ls",
			"css_variables",
			"tailwindcss",
		}

		local nvim_lsp = require("lspconfig")
		local capabilities = require("blink.cmp").get_lsp_capabilities()

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
