return {
	"hrsh7th/nvim-cmp",
	enabled = vim.g.complete,
	dependencies = {
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/cmp-buffer" },
		{ "hrsh7th/cmp-path" },
		{ "hrsh7th/cmp-cmdline" },
		{ "onsails/lspkind.nvim" },
		{
			"garymjr/nvim-snippets",
			dependencies = { "rafamadriz/friendly-snippets" },
			opts = {
				friendly_snippets = true,
			},
		},
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
				completion = vim.tbl_extend("force", cmp.config.window.bordered(), {
					winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
				}),
				documentation = vim.tbl_extend("force", cmp.config.window.bordered(), {
					winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
				}),
			},
			experimental = { ghost_text = false },
			mapping = cmp.mapping.preset.insert({
				["<cr>"] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace }),
				["<C-y>"] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace }),

				["<C-k>"] = cmp.mapping.select_next_item(),
				["<C-;>"] = cmp.mapping.select_prev_item(),

				["<C-u>"] = cmp.mapping.scroll_docs(-4),
				["<C-d>"] = cmp.mapping.scroll_docs(4),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "buffer" },
				{ name = "path" },
				{ name = "snippets" },
				{ name = "crates" },
				{ name = "go_pkgs" },
			}),
			formatting = {
				fields = { "kind", "abbr", "menu" },
				format = function(entry, vim_item)
					local lspkind = require("lspkind")

					local kind = lspkind.cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
					local strings = vim.split(kind.kind, "%s", { trimempty = true })
					kind.kind = " " .. (strings[1] or "") .. " "
					kind.menu = "    (" .. (strings[2] or "") .. ")"

					if vim.tbl_contains({ "path" }, entry.source.name) then
						local icon, hl_group = require("nvim-web-devicons").get_icon(entry:get_completion_item().label)
						if icon then
							vim_item.kind = " " .. icon
							vim_item.kind_hl_group = hl_group
							return vim_item
						end
					end

					return kind
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
