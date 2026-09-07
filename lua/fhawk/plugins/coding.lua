require("mini.surround").setup({})
require("nvim-autopairs").setup({})
require("nvim-ts-autotag").setup({
	opts = {
		enable_close = true,    -- Auto close tags
		enable_rename = true,   -- Auto rename pairs of tags
		enable_close_on_slash = true, -- Auto close on trailing </
	},
})

local cmp = require("blink.cmp")
cmp.setup({
	keymap = { preset = "default" },
	appearance = {
		nerd_font_variant = "mono",
	},
	completion = {
		menu = { auto_show_delay_ms = 500 },
	},
	sources = {
		per_filetype = {
			org = { "orgmode" },
		},
		default = { "lazydev", "lsp", "path", "snippets", "buffer" },
		providers = {
			orgmode = {
				name = "Orgmode",
				module = "orgmode.org.autocompletion.blink",
				fallbacks = { "buffer" },
			},
			lazydev = {
				name = "LazyDev",
				module = "lazydev.integrations.blink",
				score_offset = 100,
			},
		},
	},
	cmdline = {
		enabled = true,
	},
	signature = { enabled = true },
	fuzzy = {
		implementation = "rust",
	},
})
