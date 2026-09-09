require("nvim-web-devicons").setup({})

vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		local name, kind = ev.data.spec.name, ev.data.kind
		if name == "fff" and (kind == "install" or kind == "update") then
			if not ev.data.active then
				vim.cmd.packadd("fff")
			end
			require("fff.download").download_or_build_binary()
		end
	end,
})

require("fff").setup({
	prompt = "🪿 ",
	lazy_sync = true,
	debug = { enabled = false },
})

vim.keymap.set("n", "<leader>ff", function()
	require("fff").find_files()
end, { desc = "Find files" })

vim.keymap.set("n", "<leader>/", function()
	require("fff").live_grep({ grep = { modes = { "fuzzy", "plain" } } })
end, { desc = "Live fuzzy grep words" })

vim.keymap.set("n", "<leader>fP", function()
	require("fff").find_files_in_dir("~/.config/nvim")
end, { desc = "Find files in config path" })

require("telescope").setup({
	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- "ignore_case" or "respect_case"
		},
		["ui-select"] = {
			require("telescope.themes").get_dropdown(),
		},
	},
})
require("telescope").load_extension("fzf")
require("telescope").load_extension("ui-select")

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope find buffer" })
vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "Telescope help tags" })
