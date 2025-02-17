return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
    keys = {
        { "<space>ai", "<cmd>CodeCompanionChat Toggle<cr>" },
        { "<space>ac", "<cmd>CodeCompanionActions<cr>" },
        -- { "<space>", "<cmd><cr>" }
    },
	config = function()
		require("codecompanion").setup({
			strategies = {
				chat = {
					adapter = "deepseek",
				},
				inline = {
					adapter = "deepseek",
				},
			},
			adapters = {
				deepseek = function()
					return require("codecompanion.adapters").extend("deepseek", {
						env = {
							api_key = function()
								return os.getenv("DEEPSEEK_API_KEY")
							end,
						},
					})
				end,
			},
		})
	end,
}
