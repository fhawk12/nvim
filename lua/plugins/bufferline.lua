return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		require("bufferline").setup({})
		vim.keymap.set("n", "H", "<cmd>bp<cr>", { desc = "Previous buffer" })
		vim.keymap.set("n", "L", "<cmd>bn<cr>", { desc = "Next buffer" })
	end,
}
