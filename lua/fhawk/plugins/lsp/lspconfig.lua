-- Native LSP capabilities
require("fidget").setup({})
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend("force", capabilities, require("blink.cmp").get_lsp_capabilities({}, false))

-- Global LSP settings (applied to all servers)
vim.lsp.config("*", {
	capabilities = capabilities,
})

require("tiny-inline-diagnostic").setup({
	preset = "simple",
	options = {
		show_resouce = { enabled = true, if_many = true },
		multilines = {
			enabled = true,
			always_show = true,
			severity = { vim.diagnostic.severity.ERROR },
		},
	},
})
vim.diagnostic.config({ virtual_text = { current_line = true } })
