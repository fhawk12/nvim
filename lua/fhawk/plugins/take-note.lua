require("render-markdown").setup({})

vim.env.ZK_NOTEBOOK_DIR = vim.fn.expand("~/notebook")
require("zk").setup({
	picker = "telescope",
})

local zk = require("zk")
vim.keymap.set("n", "<leader>nn", function()
	local opts = { prompt = "Title: " }
	vim.ui.input(opts, function(input)
		if input == nil then
			return
		end
		zk.new({ title = input })
	end)
end, { desc = "Capture note" })
vim.keymap.set("n", "<leader>nf", "<cmd>ZkNotes { sort = { 'modified' } }<cr>", { desc = "Open notes" })
vim.keymap.set("n", "<leader>nt", "<cmd>ZkTags<cr>", { desc = "Search note tags" })
vim.keymap.set("n", "<leader>ni", "<cmd>ZkInsertLink<cr>", { desc = "Insert Link" })
vim.keymap.set("v", "<leader>n/", ":'<,'>ZkMatch<cr>", { desc = "Search for the notes matching  selection" })

vim.keymap.set("n", "<leader>nc", function()
	local inbox = vim.fn.expand("~/notebook/inbox.md")

	vim.cmd("belowright split " .. vim.fn.fnameescape(inbox))
	vim.cmd("resize 15")

	local timestamp = tostring(os.date("- %Y-%m-%d %H:%M "))
	vim.api.nvim_buf_set_lines(0, -1, -1, false, { timestamp })
	vim.cmd("normal! G$")
	vim.cmd("startinsert!")

	vim.opt_local.bufhidden = "wipe"

	-- 给这个 buffer 单独绑定"完成 capture"的快捷键
	local bufnr = vim.api.nvim_get_current_buf()
	local opts = { buffer = bufnr, silent = true }
	local function finish_capture()
		vim.cmd("stopinsert")
		vim.cmd("write")
		vim.cmd("close")
	end

	vim.keymap.set({ "n", "i" }, "<C-c><C-c>", finish_capture, opts) -- 类似 org-capture 的 C-c C-c

end, { desc = "Capture note" })
