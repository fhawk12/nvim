return {
	"folke/flash.nvim",
	event = "VeryLazy",
	keys = {
		{ "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
		{ "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
		{ "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
		{ "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
		{ "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
	},
	opts = {},
	config = function()
		vim.keymap.set({ "n", "v", "o" }, "t", "i")
		vim.keymap.set({ "n", "v", "o" }, "T", "I")
		vim.keymap.set({ "n", "v" }, "f", "e")
		vim.keymap.set({ "n", "v" }, "F", "E")
	end,
}
