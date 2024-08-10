vim.g.tmux_navigator_no_mappings = 1

vim.keymap.set("n", "<C-h>", ":TmuxNavigateLeft<cr>")
vim.keymap.set("n", "<C-n>", ":TmuxNavigateDown<cr>")
vim.keymap.set("n", "<C-e>", ":TmuxNavigateUp<cr>")
vim.keymap.set("n", "<C-i>", ":TmuxNavigateRight<cr>")
