return {
	"stevearc/conform.nvim",
	keys = {
		{ "<space>f", "<cmd>lua require('conform').format()<cr>" },
	},
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },

			rust = { "rustfmt", lsp_format = "fallback" },

			go = { lsp_format = "fallback" },
			gomod = { lsp_format = "fallback" },
			gowork = { lsp_format = "fallback" },
			gotmpl = { lsp_format = "fallback" },

			c = { "clang_format", lsp_format = "fallback" },
			cpp = { "clang_format", lsp_format = "fallback" },

			dart = { "dcm", "ast_grep", lsp_format = "fallback" },
			svelte = { lsp_format = "fallback" },

			javascript = { "prettierd", "prettier", stop_after_first = true },
			typescript = { "prettierd", "prettier", stop_after_first = true },
			javascriptreact = { "prettierd", "prettier", stop_after_first = true },
			typescriptreact = { "prettierd", "prettier", stop_after_first = true },

			json = { "prettierd", "prettier", stop_after_first = true },
			jsonc = { "prettierd", "prettier", stop_after_first = true },
			toml = { "prettierd", "prettier", stop_after_first = true },

			html = { "prettierd", "prettier", stop_after_first = true },
			css = { "prettierd", "prettier", stop_after_first = true },
			scss = { "prettierd", "prettier", stop_after_first = true },
			markdown = { "prettierd", "prettier", stop_after_first = true },

			bash = { "shfmt" },
			sh = { "shfmt" },
			zsh = { "shfmt" },
		},
	},
}
