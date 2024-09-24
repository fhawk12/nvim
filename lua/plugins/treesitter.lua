return {
	"nvim-treesitter/nvim-treesitter",
	run = ":TSUpdate",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-context",
	},
	config = function()
		require("nvim-treesitter.configs").setup({
			-- A list of parser names, or "all" (the listed parsers MUST always be installed)
			ensure_installed = {
				"vim",
				"markdown",
				"markdown_inline",
				"vimdoc",
				"javascript",
				"typescript",
				"c",
				"cpp",
				"lua",
				"rust",
			},

			-- Install parsers synchronously (only applied to `ensure_installed`)
			sync_install = false,

			-- Automatically install missing parsers when entering buffer
			-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
			auto_install = true,

			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
		})
	end,
}
