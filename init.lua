require("utils")
require("config.options")
require("config.autocmds")
require("config.remap")

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
	{ "catppuccin/nvim", name = "catppuccin" },

	{ "windwp/nvim-ts-autotag", opts = {} },
	{ "nvim-treesitter/nvim-treesitter-context" },
	{ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },

	{ "ThePrimeagen/harpoon", branch = "harpoon2" },
	{ "akinsho/toggleterm.nvim" },

	{ "folke/trouble.nvim", opts = {}, keys = { { "<leader>x", "<cmd>Trouble diagnostics toggle<cr>" } } },
	{ "folke/todo-comments.nvim", opts = {} },

	{ "hedyhli/outline.nvim", opts = {}, keys = { { "<leader>o", "<cmd>Outline<cr>" } } },

	{ "nvim-telescope/telescope.nvim", tag = "0.1.8" },
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

	{ "kylechui/nvim-surround", opts = {} },
	{ "windwp/nvim-autopairs", opts = {} },

	{ "mbbill/undotree" },
	{ "lewis6991/gitsigns.nvim" },

	{ "stevearc/conform.nvim" },
	{ "mistweaverco/kulala.nvim", opts = {} },

	{ "laytan/cloak.nvim" },

	{ "nvim-lua/plenary.nvim" },
	{ "nvim-tree/nvim-web-devicons" },

	-- LSP
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v4.x",
		dependencies = {
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
		},
	},

	-- Rust
	{ "mrcjkb/rustaceanvim", version = "^5" },
	{ "saecki/crates.nvim", tag = "stable", opts = {} },

	-- Test
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
	},

	-- Markdown
	{
		"iamcco/markdown-preview.nvim",
		ft = { "markdown" },
		build = "cd app && yarn install",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
	},

	install = { colorscheme = { "rose-pine" } },
	-- automatically check for plugin updates
	checker = { enabled = false },
})

-- My plugins Configuration
require("plugins.colorscheme") -- colorscheme
require("plugins.lspConfig") -- lsp
require("plugins.telescopeConfig") -- telescope
require("plugins.treesitterConfig") -- treesitter
require("plugins.undotreeConfig") -- undotree
require("plugins.gitsignsConfig") -- git
require("plugins.conformConfig") -- formatting
require("plugins.harpoonConfig") -- switch buffer
require("plugins.cloakConfig") -- hide sensitive infomation
require("plugins.rustConfig") -- rust
require("plugins.toggletermConfig") -- terminal
require("plugins.neotestConfig") -- test
