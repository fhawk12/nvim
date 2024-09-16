return {
	"nvimdev/dashboard-nvim",
	dependencies = { { "nvim-tree/nvim-web-devicons" } },
	event = "VimEnter",
	config = function()
		local db = require("dashboard")
		db.setup({
			theme = "hyper",
			config = {
				week_header = {
					enable = true,
				},
				project = {
					enable = false,
				},
				disable_move = true,
				shortcut = {
					{
						desc = "Update",
						group = "Include",
						action = "Lazy update",
						key = "u",
					},
					{
						desc = "Files",
						group = "Function",
						action = "Telescope find_files find_command=rg,--ignore,--hidden,--files",
						key = "f",
					},
					{
						desc = "Dotfiles",
						group = "Constant",
						action = "Telescope dotfiles",
						key = "d",
					},
					{
						desc = "Config",
						group = "Constant",
						action = "Telescope config",
						key = "c",
					},
				},
			},
		})
	end,
}
