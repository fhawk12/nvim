return {
	"voldikss/vim-translator",
	keys = {
		{ "<leader>t", "<cmd>TranslateW<cr>", mode = { "n", "v" }, desc = "Translate word" },
	},
	config = function()
		vim.g.translator_default_engines = { "bing", "haici" }
	end,
}
