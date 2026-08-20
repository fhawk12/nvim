require("nvim-surround").setup({})
require("nvim-autopairs").setup({})
require("neogen").setup({})
require("nvim-ts-autotag").setup({
	opts = {
		enable_close = true, -- Auto close tags
		enable_rename = true, -- Auto rename pairs of tags
		enable_close_on_slash = true, -- Auto close on trailing </
	},
})

local cmp = require("blink.cmp")
cmp.setup({
	keymap = { preset = "default" },
	appearance = {
		nerd_font_variant = "mono",
	},
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
	cmdline = {
		enabled = true,
	},
	signature = { enabled = true },
	fuzzy = {
		implementation = "rust",
	},
})

vim.keymap.set("n", "<leader>gn", function()
	require("neogen").generate()
end, { desc = "Generate docs", silent = true, noremap = true })
