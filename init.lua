require("config.remap")
require("config.options")
require("config.autocmds")
require("config.functions")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

	-- Colorscheme
	{ "folke/tokyonight.nvim" },
	{ "rose-pine/neovim", name = "rose-pine" },

	{ "christoomey/vim-tmux-navigator" },

	{ "windwp/nvim-ts-autotag", opts = {} },
	{ "nvim-treesitter/nvim-treesitter-context" },
	{ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },

	{ "ThePrimeagen/harpoon", branch = "harpoon2" },

	{ "folke/trouble.nvim", opts = {} },

	{ "nvim-telescope/telescope.nvim", tag = "0.1.8" },
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

	{ "kylechui/nvim-surround", opts = {} },
	{ "windwp/nvim-autopairs", opts = {} },
	{ "folke/todo-comments.nvim", opts = {} },

	{ "mbbill/undotree" },
	{ "lewis6991/gitsigns.nvim" },

	{ "stevearc/conform.nvim" },

	{ "laytan/cloak.nvim" },

	{ "nvim-lua/plenary.nvim" },
	{ "nvim-tree/nvim-web-devicons" },

	-- LSP
	-- Autocompletion
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v4.x",
		dependencies = {
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
		},
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "David-Kunz/cmp-npm" },

			{ "saadparwaiz1/cmp_luasnip" },
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
		},
	},
	{ "saecki/crates.nvim", event = { "BufRead Cargo.toml" }, opts = {}, },

	install = { colorscheme = { "rose-pine" } },

	-- automatically check for plugin updates
	checker = { enabled = false },
})

vim.cmd([[colorscheme rose-pine]])

-- My plugins Configuration
require("plugins.colorscheme") -- colorscheme
require("plugins.lspConfig") -- lsp and autocompletion config
require("plugins.telescopeConfig") -- telescope
require("plugins.treesitterConfig") -- treesitter
require("plugins.undotreeConfig") -- undotree
require("plugins.gitsignsConfig") -- git
require("plugins.conformConfig") -- formatting
require("plugins.harpoonConfig") -- switch buffer
require("plugins.cloakConfig") -- stop youself take dumb mistake
require("plugins.troubleConfig") -- stop youself take dumb mistake
require("plugins.tmux-navigator") -- stop youself take dumb mistake
