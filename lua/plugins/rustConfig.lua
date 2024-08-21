require("crates").setup({
	completion = {
		cmp = {
			enabled = true,
		},
	},
	lsp = {
		enabled = true,
		on_attach = function(client, bufnr) end,
		actions = true,
		completion = true,
		hover = true,
	},
})
