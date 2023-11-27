return {
	"glepnir/template.nvim",
	cmd = { "Template", "TemProject" },
	config = function()
		require("template").setup({
			temp_dir = "~/.config/nvim/template",
			author = "fhawk12",
			email = "2369187058@qq.com",
		})
	end,
}
