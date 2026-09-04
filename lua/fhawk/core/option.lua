-- NOTE: You can change these options as you wish!
-- For more options, you can see `:h option-list`
-- To see documentation for an option, you can use `:h 'optionname'`, for example `:h 'number'`

vim.o.termguicolors = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- indentation
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = false
vim.o.smartindent = true
vim.o.wrap = false

-- window splits
vim.o.splitright = true
vim.o.splitbelow = true

vim.o.cursorline = false -- Highlight the line where the cursor is on.
vim.o.scrolloff = 10 -- Keep this many screen lines above/below the cursor.
vim.o.list = true -- Show <tab> and trailing spaces.
vim.o.confirm = true -- raise a dialog asking if you wish to save the current file(s)
vim.o.undofile = true -- auto save undo history
vim.o.number = true -- Show line numbers in a column.
vim.o.relativenumber = true -- Show line numbers relative to where the cursor is.
vim.o.signcolumn = "yes" -- always show the signcolumn
vim.o.laststatus = 3 -- a global statusline at the bottom
vim.opt.clipboard:append("unnamedplus") -- use same clipboard with os

vim.o.winborder = "rounded"
vim.o.swapfile = false
vim.o.foldlevel = 999
