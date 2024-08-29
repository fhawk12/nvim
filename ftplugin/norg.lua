vim.opt.wrap = true

vim.keymap.set("n", "<leader>se", "<cmd>Telescope neorg find_norg_files<cr>", { buffer = true })
vim.keymap.set("n", "<leader>o", "<cmd>Neorg toc right<cr>", { buffer = true })

vim.keymap.set("n", "<leader>im", "<cmd>Neorg inject-metadata<cr>", { buffer = true })
vim.keymap.set("n", "<leader>um", "<cmd>Neorg update-metadata<cr>", { buffer = true })

vim.keymap.set("n", "<leader>ws", "<cmd>Neorg generate-workspace-summary<cr>", { buffer = true })
