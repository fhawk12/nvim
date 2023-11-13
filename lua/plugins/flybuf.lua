return {
	"glepnir/flybuf.nvim",
	cmd = "FlyBuf",
	keys = {
		{ "<leader>j", "<cmd>FlyBuf<cr>", desc = "FlyBuf" },
	},
	config = function()
		require("flybuf").setup({})
	end,
}
