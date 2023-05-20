-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

local qt_include_path = "/usr/include/qt6/"
vim.api.nvim_command('set path+="' .. qt_include_path .. '"')
