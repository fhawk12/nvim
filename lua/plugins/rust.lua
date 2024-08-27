return {
	"mrcjkb/rustaceanvim",
	lazy = false, -- This plugin is already lazy
	version = "^5",
	init = function()
		local lsp_zero = require("lsp-zero")

		vim.g.rustaceanvim = {
			server = {
				capabilities = lsp_zero.get_capabilities(),
			},
		}
	end,
}
