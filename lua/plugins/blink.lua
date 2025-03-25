return {
	"saghen/blink.cmp",
	dependencies = "rafamadriz/friendly-snippets",
	version = "*",

	---@module 'blink.cmp'
	opts = {
		completion = {
			menu = { border = "none" },
			documentation = { window = { border = "none" } },
		},
		signature = { enabled = false, window = { border = "none" } },
		keymap = {
			["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
			["<C-f>"] = { "hide" },
			["<C-y>"] = { "select_and_accept" },

			["<C-;>"] = { "select_prev", "fallback" },
			["<C-k>"] = { "select_next", "fallback" },

			["<C-u>"] = { "scroll_documentation_up", "fallback" },
			["<C-b>"] = { "scroll_documentation_down", "fallback" },

			["<Tab>"] = { "snippet_forward", "fallback" },
			["<S-Tab>"] = { "snippet_backward", "fallback" },
		},
		sources = { default = { "lsp", "path", "snippets", "buffer" } },
	},
	opts_extend = { "sources.default" },
}
