return {
	"nguyenvukhang/nvim-toggler",
	keys = {
		{ "<space>y", "<cmd>lua require('nvim-toggler').toggle()<cr>" },
	},
	config = function()
		require("nvim-toggler").setup({
			inverses = {
				["true"] = "false",
				["True"] = "False",
				["yes"] = "no",
				["Yes"] = "No",
                ["off"] = "on"
			},
			-- removes the default <leader>i keymap
			remove_default_keybinds = true,
			-- removes the default set of inverses
			remove_default_inverses = true,
			-- auto-selects the longest match when there are multiple matches
			autoselect_longest_match = false,
		})
	end,
}
