return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/cmp-buffer" },
		{ "hrsh7th/cmp-path" },
		{ "hrsh7th/cmp-cmdline" },
		{ "Snikimonkd/cmp-go-pkgs" },
		{ "Saecki/crates.nvim" }, -- config in crates.lua
	},
	config = function()
		local cmp = require("cmp")
		cmp.setup({
			snippet = {
				expand = function(args)
					vim.snippet.expand(args.body)
				end,
			},
			window = {
				-- completion = cmp.config.window.bordered(),
				-- documentation = cmp.config.window.bordered(),
			},
			mapping = cmp.mapping.preset.insert({
				["<cr>"] = cmp.mapping.confirm({ select = true }),
				["<C-y>"] = cmp.mapping.confirm({ select = true }),

				["<C-k>"] = cmp.mapping.select_next_item(),
				["<C-;>"] = cmp.mapping.select_prev_item(),

				["<C-u>"] = cmp.mapping.scroll_docs(-4),
				["<C-d>"] = cmp.mapping.scroll_docs(4),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "buffer" },
				{ name = "path" },
				{ name = "crates" },
				{ name = "go_pkgs" },
			}),
			formatting = {
				format = function(entry, vim_item)
					vim_item.kind = string.format("%s", vim_item.kind)
					vim_item.menu = ({
						buffer = "[Buffer]",
						nvim_lsp = "[LSP]",
						path = "[Path]",
						crates = "[Crates]",
						go_pkgs = "[pkgs]",
					})[entry.source.name]
					return vim_item
				end,
			},
		})

		-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won"t work anymore).
		cmp.setup.cmdline({ "/", "?" }, {
			mapping = cmp.mapping.preset.cmdline(),
			view = {
				entries = { name = "wildmenu", separator = " | " },
			},
			sources = {
				{ name = "buffer" },
			},
		})

		-- Use cmdline & path source for ":" (if you enabled `native_menu`, this won"t work anymore).
		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			view = {
				entries = { name = "wildmenu", separator = " | " },
			},
			sources = cmp.config.sources({
				{ name = "path" },
				{ name = "cmdline" },
			}),
		})
	end,
}
