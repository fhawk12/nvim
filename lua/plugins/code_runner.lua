return {
	"CRAG666/code_runner.nvim",
	keys = {
		{ "<F4>", "<cmd>RunCode<cr>", { silent = false } },
	},
	config = function()
		require("code_runner").setup({
			filetype = {
				java = {
					"cd $dir &&",
					"javac $fileName &&",
					"java $fileNameWithoutExt",
				},
				python = "python3 -u",
				typescript = "deno run",
				rust = {
					"cd $dir &&",
					"rustc $fileName &&",
					"$dir/$fileNameWithoutExt",
				},
			},
		})
	end,
}
