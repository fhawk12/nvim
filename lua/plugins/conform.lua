return {
	"stevearc/conform.nvim",
	keys = {
		{ "<leader>fm", "<cmd>lua require('conform').format()<cr>", desc = "Format the document" },
	},
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			-- Conform will run multiple formatters sequentially
			python = { "isort", "black" },
			-- Use a sub-list to run only the first available formatter
			javascript = { { "prettierd", "prettier" } },

			cpp = { "clang_format" },
			cmake = { "cmakelang" },
		},
	},
}
