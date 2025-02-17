return {
	"nvim-flutter/flutter-tools.nvim",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"stevearc/dressing.nvim", -- optional for vim.ui.select
	},
	config = function()
		local on_attach = function()
			local opts = { noremap = true, silent = true }
			vim.keymap.set("n", "<space>wi", "<cmd>Lspsaga incoming_calls<cr>", opts)
			vim.keymap.set("n", "<space>wo", "<cmd>Lspsaga outgoing_calls<cr>", opts)
			vim.keymap.set("n", "ca", "<cmd>Lspsaga code_action<cr>", opts)
			vim.keymap.set("n", "<space>q", "<cmd>Lspsaga peek_definition<cr>", opts)
			vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", opts)
			vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", opts)
			vim.keymap.set("n", "E", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
			vim.keymap.set("n", "<C-]>", "<cmd>Lspsaga goto_definition<cr>", opts)
			vim.keymap.set("n", "gr", "<cmd>Lspsaga finder<cr>", opts)
			vim.keymap.set("n", "<space>o", "<cmd>Lspsaga outline<cr>", opts)
			vim.keymap.set("n", "<space>rn", "<cmd>Lspsaga rename<cr>", opts)
			vim.keymap.set("n", "<space>R", "<cmd>Lspsaga project_replace<cr>", opts)
			vim.keymap.set("n", "<space>;", "<cmd>Lspsaga show_line_diagnostics<cr>", opts)
			vim.keymap.set("n", "<space>x", "<cmd>Lspsaga show_workspace_diagnostics<cr>", opts)
		end

		require("flutter-tools").setup({
			lsp = {
				on_attach = on_attach,
				capabilities = require("blink.cmp").get_lsp_capabilities(),
			},
		})
	end,
}
