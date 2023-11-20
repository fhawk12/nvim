return {
	"akinsho/bufferline.nvim",
	version = "*",
	enabled = false,
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		require("bufferline").setup({})
	end,
}
