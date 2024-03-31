return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	dependencies = { { "nvim-tree/nvim-web-devicons" } },
	opts = function()
    local logo = [[
         ██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗          Z
         ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║      Z    
         ██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║   z       
         ██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║ z         
         ███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║           
         ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝           
    ]]

    logo = string.rep("\n", 8) .. logo .. "\n\n"
		local opts = {
			theme = "doom",
      hide = {
        -- this is taken care of by lualine
        -- enabling this messes up the actual laststatus setting after loading a file
        statusline = false,
      },
			config = {
        header = vim.split(logo, "\n"),
				center = {
					{ action = require("telescope.builtin").find_files, icon_hl = "Title", desc = " Find File", icon = " ", key = "f", key_hl = "Number", desc_hl = "String", },
					{ action = "ene | startinsert", icon_hl = "Title", desc = " New File", icon = " ", key = "n", desc_hl = "String", key_hl = "Number", },
					{ action = "Telescope oldfiles", icon_hl = "Title", desc = " Recent Files", icon = " ", desc_hl = "String", key_hl = "Number", key = "r", },
					{ action = "Telescope live_grep", icon_hl = "Title", key_hl = "Number", desc = " Find Text", icon = " ", key = "g", desc_hl = "String", },
					{ action = 'lua require("persisted").load()', desc_hl = "String", icon_hl = "Title", desc = " Restore Session", icon = " ", key_hl = "Number", key = "s", },
					{ action = "Lazy", icon_hl = "Title", desc_hl = "String", desc = " Lazy", key_hl = "Number", icon = "󰒲 ", key = "l", },
					{ action = "qa", key_hl = "Number", desc_hl = "String", icon_hl = "Title", desc = " Quit", icon = " ", key = "q", },
				},
			},
		}

    for _, button in ipairs(opts.config.center) do
      button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
      button.key_format = "  %s"
    end

    return opts
	end,
}
