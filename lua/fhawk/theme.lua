require("solarized").setup({
	on_highlights = function()
		local groups = {
			SpellBad = { strikethrough = false, underline = false },
		}
		return groups
	end,
})
require("rose-pine").setup({})
require("nord").setup({
	on_highlights = function(highlights, colors)
		highlights.CursorLine = { bg = nil }
		highlights.QuickFixLine = { bg = "#434c5e" }
	end,
})

-- vim.cmd.colorscheme("solarized")
-- vim.cmd.colorscheme("rose-pine-moon")
vim.cmd.colorscheme("nord")
