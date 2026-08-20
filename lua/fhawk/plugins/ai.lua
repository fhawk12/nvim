require("mcphub").setup({})
require("codecompanion").setup({
	interactions = {
		cli = {
			agent = "opencode",
			agents = {
				opencode = {
					cmd = "opencode",
					args = {},
					description = "Opencode CLI",
					provider = "terminal",
				},
				codex = {
					cmd = "codex",
					args = {},
					description = "Codex CLI",
					provider = "terminal",
				},
			},
		},
	},
})

vim.keymap.set({ "n", "v" }, "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })

vim.keymap.set({ "n", "v" }, "<leader>a", function()
	return require("codecompanion").toggle_cli({ focus = true, silent = true })
end, { noremap = true, silent = true })

vim.keymap.set({ "n", "v" }, "<leader>cp", function()
	return require("codecompanion").cli({ prompt = true })
end, { desc = "Prompt the CLI agent" })

vim.keymap.set({ "n", "v" }, "<leader>ca", function()
	return require("codecompanion").cli("#{this}", { focus = false })
end, { desc = "Add context to the CLI agent" })

vim.keymap.set("n", "<leader>cd", function()
	return require("codecompanion").cli("#{diagnostics} Can you fix these?", { focus = true, submit = false })
end, { desc = "Send diagnostics to CLI agent" })
