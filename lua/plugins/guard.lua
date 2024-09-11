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

		ft("typescript,javascript,typescriptreact,javascriptreact"):fmt("prettier")

		ft("rust"):fmt("rustfmt")

		ft("lua"):fmt("lsp"):append("stylua")

		ft("c,cpp"):fmt("clang-format")

		require("guard").setup({
			fmt_on_save = false,
			lsp_as_default_formatter = true,
		})
	end,
}
