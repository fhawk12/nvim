-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

map({ "n", "x" }, "gl", "$", { desc = "GO to end of line" })
map({ "n", "x" }, "ge", "G", { desc = "GO to end of file" })

map("i", "<C-f>", "<Right>")
map("i", "<C-b>", "<Left>")
