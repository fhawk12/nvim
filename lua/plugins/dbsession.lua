return {
	"glepnir/dbsession.nvim",
	cmd = { "SessionSave", "SessionDelete", "SessionLoad" },
	keys = {
		{ "<leader>sl", ":SessionLoad ",    desc = "Session Load" },
		{ "<leader>sd", ":SessionDelete ",  desc = "Session Delete" },
		{ "<leader>ss", ":SessionSave ",    desc = "Session Save" },
	},
	opts = {},
}
