return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim", -- required
		"sindrets/diffview.nvim", -- optional - Diff integration

		-- Only one of these is needed, not both.
		"nvim-telescope/telescope.nvim", -- optional
		"ibhagwan/fzf-lua", -- optional
	},
  keys = {
    { "<leader>hh", "<cmd>Neogit<cr>", desc = "Open Neogit"}
  },
	opts = {},
}
