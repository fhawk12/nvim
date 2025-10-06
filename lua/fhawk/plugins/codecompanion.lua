return {
	"olimorris/codecompanion.nvim",
	opts = {},
	keys = {
		{ "<space>ac", "<cmd>CodeCompanionActions<cr>" },
		{ "<space>ai", "<cmd>CodeCompanionChat Toggle<cr>" },
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("codecompanion").setup({
			strategies = {
				chat = {
					adapter = "gemini",
				},
				inline = {
					adapter = "gemini",
				},
			},
			adapters = {
				http = {
					gemini = function()
						return require("codecompanion.adapters").extend("gemini", {
							env = {
								api_key = "GEMINI_API_KEY",
							},
						})
					end,
				},
			},
		})
	end,
}
