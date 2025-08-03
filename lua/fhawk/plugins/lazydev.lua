return {
	"folke/lazydev.nvim",
	ft = "lua", -- only load on lua files
	opts = {
		library = {
			"lazy.nvim",
			-- It can also be a table with trigger words / mods
			-- Only load luvit types when the `vim.uv` word is found
			{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			-- always load the LazyVim library
			"LazyVim",
		},
		-- always enable unless `vim.g.lazydev_enabled = false`
		-- This is the default
		enabled = function(root_dir)
			return vim.g.lazydev_enabled == nil and true or vim.g.lazydev_enabled
		end,
	},
}
