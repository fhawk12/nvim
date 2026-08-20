local bufnr = vim.api.nvim_get_current_buf()
local opts = { silent = true, buffer = bufnr }

vim.keymap.set("n", "gra", function()
	vim.cmd.RustLsp("codeAction") -- supports rust-analyzer's grouping
	-- or vim.lsp.buf.codeAction() if you don't want grouping.
end, opts)

vim.keymap.set("n", "E", function()
	vim.cmd.RustLsp({ "hover", "actions" })
end, opts)

vim.keymap.set("n", "<]d>", function()
	vim.cmd("RustLsp renderDiagnostic cycle")
end, opts)

vim.keymap.set("n", "<[d>", function()
	vim.cmd("RustLsp renderDiagnostic cycle_prev")
end, opts)

vim.keymap.set("n", "<leader>do", function()
	vim.cmd("RustLsp openDocs")
end, opts)

vim.keymap.set("n", "J", function()
	vim.cmd.RustLsp("joinLines")
end, opts)
