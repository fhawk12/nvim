local win_height = math.ceil(vim.o.lines * 0.7)
local win_width = math.ceil(vim.o.columns * 0.8)
local row = math.ceil((vim.o.lines - win_height) * 0.4)
local col = math.ceil((vim.o.columns - win_width) * 0.5)

require("toggleterm").setup({
	open_mapping = [[<c-p>]],
	direction = "float",
	float_opts = {
		border = "rounded",
		width = win_width,
		height = win_height,
		row = row,
		col = col,
	},
})
