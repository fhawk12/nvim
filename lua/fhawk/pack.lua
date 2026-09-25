-- NOTE: Built-in plugins
vim.cmd("packadd! nohlsearch") -- automatically disable search highlighting after 'updatetime' and when going to insert mode.

require("fhawk.pack-cmd")

vim.pack.add({
	-- lsp and treesitter
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/mason-org/mason-lspconfig.nvim",
	"https://github.com/folke/lazydev.nvim", -- luals setup for neovim
	"https://github.com/nvim-treesitter/nvim-treesitter",
	"https://github.com/rachartier/tiny-inline-diagnostic.nvim", -- lsp diagnostic ui
	"https://github.com/j-hui/fidget.nvim", -- lsp progress ui

	-- coding
	"https://github.com/windwp/nvim-autopairs", -- auto pairs
	"https://github.com/windwp/nvim-ts-autotag", -- auto tag pairs
	"https://github.com/nvim-mini/mini.surround", -- surround
	"https://github.com/Saghen/blink.cmp", -- completion
	"https://github.com/Saghen/blink.lib", -- dependency (blink)

	-- picker
	"https://github.com/dmtrKovalenko/fff",
	"https://github.com/nvim-telescope/telescope.nvim",
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/nvim-telescope/telescope-fzf-native.nvim",
	"https://github.com/nvim-telescope/telescope-ui-select.nvim",

	-- git
	"https://github.com/lewis6991/gitsigns.nvim",
	"https://github.com/NeogitOrg/neogit",
	"https://github.com/esmuellert/codediff.nvim", -- dependency (neogit)

	-- editor
	"https://github.com/stevearc/quicker.nvim", -- better quickfix
	"https://github.com/NvChad/nvim-colorizer.lua", -- color
	"https://github.com/stevearc/aerial.nvim", -- outline
	"https://github.com/nvim-lualine/lualine.nvim", -- status bar
	"https://github.com/nvim-tree/nvim-web-devicons", -- dependency (lualine)
	"https://github.com/akinsho/toggleterm.nvim", -- terminal
	"https://github.com/mawkler/modicator.nvim", -- line number ui
	"https://github.com/keaising/im-select.nvim", -- auto switch input method
	"https://github.com/stevearc/conform.nvim", -- format
	"https://github.com/folke/trouble.nvim", -- better diagnostic
	"https://github.com/folke/which-key.nvim.git",

	-- rust
	"https://github.com/mrcjkb/rustaceanvim",
	"https://github.com/Saecki/crates.nvim",

	-- take notes
	"https://github.com/zk-org/zk-nvim",
	"https://github.com/MeanderingProgrammer/render-markdown.nvim",

	-- theme
	"https://github.com/maxmx03/solarized.nvim", -- solarized theme
	{ src = "https://github.com/rose-pine/neovim", name = "rose-pine" }, -- rose-pine theme
	"https://github.com/gbprod/nord.nvim.git", -- nord theme
})

require("fhawk.plugins.lsp.mason")
require("fhawk.plugins.lsp.lspconfig")

require("fhawk.plugins.treesitter")
require("fhawk.plugins.git")

require("fhawk.plugins.coding")
require("fhawk.plugins.rust")

require("fhawk.plugins.picker")
require("fhawk.plugins.editor")
require("fhawk.plugins.take-note")
