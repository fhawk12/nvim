return {
	"iamcco/markdown-preview.nvim",
	ft = { "markdown" },
	build = "cd app && yarn install",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	init = function()
		vim.g.mkdp_filetypes = { "markdown" }
	end,
}
