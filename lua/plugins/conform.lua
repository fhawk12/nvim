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
			javascript = { "prettierd", "prettier" },
			javascriptreact = { "prettierd", "prettier" },
			typescript = { "prettierd", "prettier" },
			typescriptreact = { "prettierd", "prettier" },
			html = { "prettierd", "prettier" },
			markdown = { "prettier" },
			json = { "prettier" },
			sh = { "shfmt" },

			c = { "clang_format" },
			cpp = { "clang_format" },
			cmake = { "cmakelang" },
			java = { "google-java-format" },
		},
	},
}
