local dashboard = require("dashboard")
local splash = require("milli").load({ splash = "finger" })

dashboard.setup({
	theme = "doom",
	config = {
		header = splash.frames[1], -- seed header with frame 0
		center = {
			{ icon = "  ", desc = "Find File", key = "f", action = "Telescope find_files" },
			{ icon = "  ", desc = "Quit", key = "q", action = "qa" },
		},
	},
})
milli.dashboard({ splash = "finger", loop = true })
