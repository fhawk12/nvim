vim.opt.wrap = true

vim.keymap.set("n", "<space>se", "<cmd>Telescope neorg find_norg_files<cr>", { buffer = true })
vim.keymap.set("n", "<space>o", "<cmd>Neorg toc right<cr>", { buffer = true })

vim.keymap.set("n", "<space>im", "<cmd>Neorg inject-metadata<cr>", { buffer = true })
vim.keymap.set("n", "<space>nm", "<cmd>Neorg update-metadata<cr>", { buffer = true })

vim.keymap.set("n", "<space>ws", "<cmd>Neorg generate-workspace-summary<cr>", { buffer = true })

vim.keymap.set("n", "<space>wr", "<cmd>Neorg return<cr>")
