local treesitter = require("nvim-treesitter")

local ts_list = {
    "rust",
    "lua",
    "toml",
    "json",
    "yaml",
    "html",
    "css",
    "svelte",
    "javascript",
    "typescript",
}
treesitter.install(ts_list)
treesitter.setup()
vim.api.nvim_create_autocmd("FileType", {
    pattern = ts_list,
    callback = function(args)
        local ok = pcall(vim.treesitter.start, args.buf)
        if ok then
            -- folds, provided by Neovim
            vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
            vim.wo.foldmethod = "expr"
            -- indentation, provided by nvim-treesitter
            vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
    end,
})
