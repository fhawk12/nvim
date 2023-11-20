return {
	"akinsho/bufferline.nvim",
	version = "*",
	enabled = false,
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		require("bufferline").setup({})
		vim.keymap.set("n", "H", "<cmd>bprevious<CR>")
		vim.keymap.set("n", "L", "<cmd>bnext<CR>")
	end,
}
