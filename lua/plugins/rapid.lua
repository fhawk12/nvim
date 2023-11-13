return {
	"nvimdev/rapid.nvim",
	keys = {
		{ "<leader>c", "<cmd>Rapid<cr>", desc = "Run Command" },
	},
	cmd = "Rapid",
	config = function()
		require("rapid").setup()
	end,
}
