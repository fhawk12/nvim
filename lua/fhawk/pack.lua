-- NOTE: Built-in plugins
vim.cmd("packadd! nohlsearch") -- automatically disable search highlighting after 'updatetime' and when going to insert mode.

require("fhawk.pack-cmd")

vim.pack.add({
	-- lsp and treesitter
	"https://github.com/neovim/nvim-lspconfig", -- enabled
	"https://github.com/mason-org/mason.nvim", -- enabled
	"https://github.com/mason-org/mason-lspconfig.nvim", -- enabled
	"https://github.com/nvim-treesitter/nvim-treesitter", -- enabled
	"https://github.com/rachartier/tiny-inline-diagnostic.nvim", -- enabled
	"https://github.com/j-hui/fidget.nvim", -- enabled

	-- misc
	"https://github.com/folke/lazydev.nvim", -- configuration for neovim

	-- coding
	"https://github.com/windwp/nvim-autopairs", -- enabled
	"https://github.com/windwp/nvim-ts-autotag", -- enabled
	"https://github.com/kylechui/nvim-surround", -- enabled
	"https://github.com/Saghen/blink.cmp", -- enabled
	"https://github.com/saghen/blink.lib", -- denpendency (blink.cmp)
	"https://github.com/danymat/neogen", -- enabled generate comment

	-- picker
	"https://github.com/ibhagwan/fzf-lua", -- enabled
	"https://github.com/nvim-tree/nvim-web-devicons", -- denpendency (fzf-lua)

	-- git
	"https://github.com/lewis6991/gitsigns.nvim", -- enabled

	-- format
	"https://github.com/stevearc/conform.nvim", -- enabled

	-- editor
	"https://github.com/stevearc/quicker.nvim", -- enabled
	"https://github.com/NvChad/nvim-colorizer.lua", -- enabled
	"https://github.com/folke/todo-comments.nvim", -- enabled
	"https://github.com/nvim-lua/plenary.nvim", -- dependency (todo-comments)
	"https://github.com/folke/trouble.nvim", -- enabled
	"https://github.com/nvimdev/dbsession.nvim", -- enabled
	"https://github.com/stevearc/aerial.nvim", -- enabled

	-- rust
	"https://github.com/mrcjkb/rustaceanvim",
	"https://github.com/Saecki/crates.nvim",

	-- AI
	{ src = "https://www.github.com/olimorris/codecompanion.nvim", version = vim.version.range("^19.0.0") }, -- enabled
	"https://www.github.com/ravitemer/mcphub.nvim", -- dependency (codecompanion)

	-- theme
	"https://github.com/maxmx03/solarized.nvim", -- solarized theme
	{ src = "https://github.com/rose-pine/neovim", name = "rose-pine" }, -- rose-pine theme
})

require("fhawk.plugins.lsp.mason")
require("fhawk.plugins.lsp.lspconfig")

require("fhawk.plugins.coding")
require("fhawk.plugins.rust")
require("fhawk.plugins.editor")

require("fhawk.plugins.treesitter")
require("fhawk.plugins.git")
require("fhawk.plugins.format")
require("fhawk.plugins.picker")
require("fhawk.plugins.ai")
