require("colorizer").setup()
require("lualine").setup({})

require("aerial").setup({
	on_attach = function(bufnr)
		vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
		vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
		vim.keymap.set("n", "q", "<cmd>AerialClose<CR>", { buffer = bufnr })
	end,
})
vim.keymap.set("n", "<leader>o", "<cmd>AerialToggle!<CR>")

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
