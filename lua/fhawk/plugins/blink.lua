return {
	"saghen/blink.cmp",
	dependencies = { "rafamadriz/friendly-snippets" },
	version = "1.*",
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = {
			preset = "none",
			["<C-e>"] = { "show", "show_documentation", "hide_documentation" },
			["<C-f>"] = { "hide" },
			["<C-y>"] = { "select_and_accept" },

			["<Up>"] = { "select_prev", "fallback" },
			["<Down>"] = { "select_next", "fallback" },
			["<C-;>"] = { "select_prev", "fallback_to_mappings" },
			["<C-k>"] = { "select_next", "fallback_to_mappings" },

			["<C-u>"] = { "scroll_documentation_up", "fallback" },
			["<C-s>"] = { "scroll_documentation_down", "fallback" },

			["<Tab>"] = { "snippet_forward", "fallback" },
			["<S-Tab>"] = { "snippet_backward", "fallback" },

			["<C-d>"] = { "show_signature", "hide_signature", "fallback" },
		},
		appearance = { nerd_font_variant = "mono" },
		completion = { documentation = { auto_show = false } },
		sources = {
			default = { "lazydev", "lsp", "path", "snippets", "buffer" },
			providers = {
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					score_offset = 100,
				},
			},
		},
		fuzzy = { implementation = "prefer_rust_with_warning" },
		cmdline = {
			keymap = { preset = "inherit" },
			completion = {
				menu = { auto_show = false },
				ghost_text = { enabled = true },
			},
		},
	},
	opts_extend = { "sources.default" },
}
