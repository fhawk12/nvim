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
	vim.keymap.set("n", "yk", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
	vim.keymap.set("n", "yt", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
	vim.keymap.set("n", "yr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
	vim.keymap.set("n", "yq", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
	vim.keymap.set("n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
	vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
	vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
	vim.keymap.set("n", "<leader>;", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)
end

lsp_zero.extend_lspconfig({
	sign_text = true,
	lsp_attach = lsp_attach,
	-- capabilities = require("cmp_nvim_lsp").default_capabilities(),
})

vim.g.rustaceanvim = {
	server = {
		capabilities = lsp_zero.get_capabilities(),
	},
}

local server_names = {
	"clangd",
	"rust_analyzer",
	"tsserver",
	"lua_ls",
	"marksman",
	"eslint",
	"jsonls",
	"cssls",
	"css_variables",
}

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = server_names,
	handlers = {
		function(server_name)
			require("lspconfig")[server_name].setup({})
		end,
		rust_analyzer = lsp_zero.noop,
	},
})
