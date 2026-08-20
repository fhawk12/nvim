local treesitter = require("nvim-treesitter")

treesitter.install({
	"rust",
	"lua",
	"toml",
	"json",
	"yaml",
	"html",
	"css",
	"svelte",
	"javascript",
	"typescript",
})
treesitter.setup()
vim.api.nvim_create_autocmd("FileType", {
	callback = function(args)
		local ok = pcall(vim.treesitter.start, args.buf)
		if ok then
			-- folds, provided by Neovim
			vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
			vim.wo.foldmethod = "expr"
			-- indentation, provided by nvim-treesitter
			vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
		end
	end,
})
