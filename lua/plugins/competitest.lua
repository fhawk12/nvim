return {
	"xeluxee/competitest.nvim",
	dependencies = "MunifTanjim/nui.nvim",
	keys = {
		{ ";r", "<cmd>CompetiTest run<cr>", desc = "Competitest run" },
		{ ";a", "<cmd>CompetiTest receive testcases<cr>", desc = "Receive testcases" },
		{ ";td", "<cmd>CompetiTest delete_testcase testcases<cr> <cmd>lua Delete_executable_files()<cr>", desc = "Delete testcases" },
	},
	config = function()
		require("competitest").setup()
	end,
}
