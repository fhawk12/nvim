return {
	"nvimdev/guard.nvim",
	keys = {
		{ "<space>f", "<cmd>GuardFmt<cr>" },
	},
	dependencies = {
		"nvimdev/guard-collection",
	},
	config = function()
		local ft = require("guard.filetype")

		ft("typescript,javascript,typescriptreact"):fmt("prettier")

		ft("c,cpp"):fmt("clang-format")

		ft("lua"):fmt("lsp"):append("stylua")

		require("guard").setup({
			fmt_on_save = false,
			lsp_as_default_formatter = true,
		})
	end,
}
