require("solarized").setup({
	on_highlights = function()
		local groups = {
			SpellBad = { strikethrough = false, underline = false },
		}
		return groups
	end,
})
require("rose-pine").setup({})
require("nord").setup({})

-- vim.cmd.colorscheme("solarized")
-- vim.cmd.colorscheme("rose-pine-moon")
vim.cmd.colorscheme("nord")
