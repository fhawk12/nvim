require("colorizer").setup()
require("which-key").setup({})
require("lualine").setup({})
require("modicator").setup({})

require("aerial").setup({
	on_attach = function(bufnr)
		vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
		vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
		vim.keymap.set("n", "q", "<cmd>AerialClose<CR>", { buffer = bufnr })
	end,
})
vim.keymap.set("n", "<leader>so", "<cmd>AerialToggle!<CR>", { desc = "Open symbols outline" })

require("quicker").setup({
	keys = {
		{
			">",
			function()
				require("quicker").expand({ before = 2, after = 2, add_to_existing = true })
			end,
			desc = "Expand quickfix context",
		},
		{
			"<",
			function()
				require("quicker").collapse()
			end,
			desc = "Collapse quickfix context",
		},
	},
})

require("toggleterm").setup({})
vim.keymap.set({ "n", "t" }, "<leader>tm", function()
	require("toggleterm").toggle()
end, { desc = "Toggle terminal" })
vim.keymap.set({ "n", "t" }, "<leader>ts", "<cmd>TermSelect<cr>", { desc = "Toggle Select" })

vim.o.cursorline = true
require("im_select").setup({
	default_im_select = "com.apple.keylayout.Colemak",
	default_command = "im-select",
})

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		go = { "goimports", "gofmt" },
		rust = { "rustfmt", lsp_format = "fallback" },
		markdown = { "prettier" },
	},
	default_format_opts = {
		lsp_format = "fallback",
	},
	-- format_on_save = {
	-- 	lsp_format = "fallback",
	-- 	timeout_ms = 500,
	-- },
})

vim.keymap.set("n", "<leader>cf", function()
	require("conform").format({ async = true })
end, { desc = "format buffer with conform" })
