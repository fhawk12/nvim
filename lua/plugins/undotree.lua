return {
	"mbbill/undotree",
	config = function()
		vim.keymap.set("n", "<space>u", "<cmd>UndotreeToggle<cr>")
	end,
}
