require("quicker").setup({})
require("colorizer").setup()

local todo_comments = require("todo-comments")
todo_comments.setup()
vim.keymap.set("n", "]t", function()
	todo_comments.jump_next()
end, { desc = "Next todo comment" })
vim.keymap.set("n", "[t", function()
	todo_comments.jump_prev()
end, { desc = "Previous todo comment" })

require("trouble").setup({ focus = true })
vim.keymap.set(
	"n",
	"<leader>xw",
	"<cmd>Trouble diagnostics toggle<CR>",
	{ desc = "Open trouble workspace diagnostics" }
)
vim.keymap.set(
	"n",
	"<leader>xd",
	"<cmd>Trouble diagnostics toggle filter.buf=0<CR>",
	{ desc = "Open trouble current buffer diagnostics" }
)
vim.keymap.set("n", "<leader>xq", "<cmd>Trouble quickfix toggle<CR>", { desc = "Open trouble quickfix list" })
vim.keymap.set("n", "<leader>xl", "<cmd>Trouble loclist toggle<CR>", { desc = "Open trouble location list" })
vim.keymap.set("n", "<leader>xt", "<cmd>Trouble todo toggle<CR>", { desc = "Open todos in trouble" })

require("dbsession").setup({})
vim.keymap.set("n", "<leader>ss", ":SessionSave ", { desc = "Session Save" })
vim.keymap.set("n", "<leader>sl", ":SessionLoad ", { desc = "Session Load" })

require("aerial").setup({
	on_attach = function(bufnr)
		vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
		vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
		vim.keymap.set("n", "q", "<cmd>AerialClose<CR>", { buffer = bufnr })
	end,
})
vim.keymap.set("n", "<leader>o", "<cmd>AerialToggle!<CR>")
