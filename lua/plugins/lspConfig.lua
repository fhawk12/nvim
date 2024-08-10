-- LSP setup

local lsp_zero = require("lsp-zero")

-- lsp_attach is where you enable features that only work
-- if there is a language server active in the file
local lsp_attach = function(client, bufnr)
	local opts = {
		buffer = bufnr,
	}

	vim.keymap.set("n", "E", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
	vim.keymap.set("n", "yd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
	vim.keymap.set("n", "yD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
	-- vim.keymap.set("n", "yi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
	vim.keymap.set("n", "yo", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
	vim.keymap.set("n", "yr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
	-- vim.keymap.set("n", "ys", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
	vim.keymap.set("n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
	vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
	vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
end

lsp_zero.extend_lspconfig({
	sign_text = true,
	lsp_attach = lsp_attach,
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
})

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = { "tsserver", "rust_analyzer", "tsserver" },
	handlers = {
		function(server_name)
			require("lspconfig")[server_name].setup({})
		end,
	},
})

-- Autocompletion config

local cmp = require("cmp")
local cmp_action = lsp_zero.cmp_action()

require("luasnip.loaders.from_vscode").lazy_load()

-- If you want insert `(` after select function or method item
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

cmp.setup({
	sources = {
		{ name = "nvim_lsp" },
		{ name = "buffer" },
		{ name = "luasnip" },
		{ name = "path" },
		{ name = "npm" },
	},
	preselect = "iterm",
	completion = {
		completeopt = "menu,menuone,noinsert",
	},
	mapping = cmp.mapping.preset.insert({
		-- `Enter` key to confirm completion
		["<CR>"] = cmp.mapping.confirm({ select = false }),
		["<C-k>"] = cmp.mapping.select_next_item(),
		["<C-;>"] = cmp.mapping.select_prev_item(),
		["<C-f>"] = cmp.mapping.abort(),

		-- Ctrl+Space to trigger completion menu
		-- ['<C-Space>'] = cmp.mapping.complete(), -- crash with tmux prefix

		-- Navigate between snippet placeholder
		["<Tab>"] = cmp_action.vim_snippet_jump_forward(),
		["<S-Tab>"] = cmp_action.vim_snippet_jump_backward(),

		-- ["<C-f>"] = cmp.mapping.scroll_docs(-4),
		-- ["<C-s>"] = cmp.mapping.scroll_docs(4),
	}),
	snippet = {
		expand = function(args)
			vim.snippet.expand(args.body)
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
})
