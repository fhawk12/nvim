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
	lazy_sync = true,
	debug = { enabled = false },
	git = { status_text_color = true },
})

vim.keymap.set("n", "<leader>ff", function()
	require("fff").find_files()
end, { desc = "Find files" })

vim.keymap.set("n", "<leader>/", function()
	require("fff").live_grep({ grep = { modes = { "fuzzy", "plain" } } })
end, { desc = "Live fuzzy grep words" })

vim.keymap.set("n", "<leader>fc", function()
	require("fff").find_files_in_dir("~/.config/nvim")
end, { desc = "Find files in specified path" })
