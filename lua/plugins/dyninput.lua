return {
	"nvimdev/dyninput.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	config = function()
		local rs = require("dyninput.lang.rust")
		local ms = require("dyninput.lang.misc")
		require("dyninput").setup({
			c = {
				["-"] = { "->", ms.is_pointer },
			},
			cpp = {
				[","] = { " <!>", ms.generic_in_cpp },
				["-"] = { "->", ms.is_pointer },
			},
		})
	end,
}
