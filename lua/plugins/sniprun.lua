return {
	"michaelb/sniprun",
	branch = "master",
	build = "sh install.sh",
  keys = {
    { "<F1>", "<cmd>SnipRun<cr>", mode = "v", desc = "Run code" },
    { "<F2>", "<cmd>SnipClose<cr>", desc = "Close SnipRun" },
  },
	config = function()
		require("sniprun").setup({
			-- your options
			display = {
				-- "Classic",                 --# display results in the command-line  area
				"Terminal",                   --# display results in a vertical split
				"VirtualText",                --# display results as virtual text
				"VirtualTextOk",              --# display ok results as virtual text (multiline is shortened)
				-- "TempFloatingWindow",      --# display results in a floating window
				-- "LongTempFloatingWindow",  --# same as above, but only long results. To use with VirtualText[Ok/Err]
				-- "TerminalWithCode",        --# display results and code history in a vertical split
				-- "NvimNotify",              --# display with the nvim-notify plugin
				-- "Api"                      --# return output to a programming interface
			},
		})
	end,
}
