local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<C-\\>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<C-u>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-y>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<C-;>", function() harpoon:list():select(3) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
vim.keymap.set("n", "<C-S-E>", function() harpoon:list():prev() end)
