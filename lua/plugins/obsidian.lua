return {
	"epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = false,
	ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	keys = {
		{ "<leader>zn", "<cmd>ObsidianNew<cr>", desc = "New note" },
		{ "<leader>zf", "<cmd>ObsidianQuickSwitch<cr>", desc = "Find notes" },
		{ "<leader>zF", "<cmd>ObsidianSearch<cr>", desc = "Search Notes" },
		{ "<leader>zl", ":ObsidianLink ", desc = "Link New", mode = "v" },
		{ "<leader>cn", "<cmd>ObsidianRename<cr>", desc = "Rename note" },
		{ "<leader>zd", "<cmd>ObsidianToday<cr>", desc = "Go to today note" },
		{ "<leader>zb", "<cmd>ObsidianBacklinks<cr>", desc = "Back links" },
	},
	opts = {
		workspaces = {
			{
				name = "main",
				path = "~/notes",
			},
		},
		disable_frontmatter = true,
		daily_notes = {
			-- Optional, if you keep daily notes in a separate directory.
			folder = "dailies",
			-- Optional, if you want to change the date format for the ID of daily notes.
			date_format = "%Y-%m-%d",
			-- Optional, if you want to change the date format of the default alias of daily notes.
			alias_format = "%B %-d, %Y",
			-- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
			template = nil,
		},
	},
}
