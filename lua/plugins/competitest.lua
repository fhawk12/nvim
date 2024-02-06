return {
	"xeluxee/competitest.nvim",
	dependencies = "MunifTanjim/nui.nvim",
	keys = {
		{ ";rr", "<cmd>CompetiTest run<cr>", desc = "Competitest run" },
		{ ";ra", "<cmd>CompetiTest receive testcases<cr>", desc = "Receive testcases" },
		{ ";rc", "<cmd>CompetiTest receive contest<cr>", desc = "Receive contest" },
		{ ";rh", "<cmd>CompetiTest show_ui<cr>", desc = "Show UI" },
		{ ";rd", "<cmd>CompetiTest delete_testcase<cr>", desc = "Delete testcases" },
	},
	config = function()
		require("competitest").setup({
			replace_received_testcases = true,
			testcases_use_single_file = true,
			view_output_diff = true,
			template_file = "~/.config/nvim/template/cf.cpp",
		})
	end,
}
