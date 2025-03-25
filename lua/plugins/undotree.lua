return {
	"jiaoshijie/undotree",
	dependencies = "nvim-lua/plenary.nvim",
	keys = { { "<space>u", "<cmd>lua require('undotree').toggle()<cr>" } },
	config = function()
		require("undotree").setup({
			float_diff = true, -- using float window previews diff, set this `true` will disable layout option
			layout = "left_bottom", -- "left_bottom", "left_left_bottom"
			position = "left", -- "right", "bottom"
			ignore_filetype = { "undotree", "undotreeDiff", "qf", "TelescopePrompt", "spectre_panel", "tsplayground" },
			window = {
				winblend = 30,
			},
			keymaps = {
				["n"] = "move_next",
				["e"] = "move_prev",
				["gn"] = "move2parent",
				["N"] = "move_change_next",
				["E"] = "move_change_prev",
				["<cr>"] = "action_enter",
				["p"] = "enter_diffbuf",
				["q"] = "quit",
			},
		})
	end,
}
