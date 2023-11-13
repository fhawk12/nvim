return {
	"nvimdev/guard.nvim",
	keys = {
		{ "<leader>fm", "<cmd>GuardFmt<cr>", mode = { "n", "v" }, desc = "format document" },
	},
	dependencies = {
		"nvimdev/guard-collection",
	},
	lazy = "VeryLazy",
	config = function()
		local ft = require("guard.filetype")
		ft("c"):fmt("clang-format")
		ft("cpp"):fmt("clang-format")
		ft("cmake"):fmt("clang-format")
		ft("lua"):fmt("stylua")
		ft("python"):fmt("black")
		ft("sh, go, java, rust"):fmt("lsp")
		ft("markdown"):fmt("prettier")
		ft("typescript, javascript, typescriptreact, html, json"):fmt("prettier")
		require("guard").setup({
			-- the only options for the setup function
			fmt_on_save = false,
			-- Use lsp if no formatter was defined for this filetype
			lsp_as_default_formatter = true,
		})
	end,
}
