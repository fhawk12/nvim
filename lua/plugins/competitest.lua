return {
	"xeluxee/competitest.nvim",
	dependencies = "MunifTanjim/nui.nvim",
	keys = {
		{ ";r", "<cmd>CompetiTest run<cr>", desc = "Competitest run" },
		{ ";a", "<cmd>CompetiTest receive testcases<cr>", desc = "Receive testcases" },
		{ ";cd", "<cmd>CompetiTest delete_testcase testcases<cr> <cmd>lua Delete_executable_files()<cr>", desc = "Delete testcases" },
		{ ";c", "<cmd>CompetiTest receive contest<cr>", desc = "Receive contest" },
	},
	config = function()
		require("competitest").setup()
	end,
}
