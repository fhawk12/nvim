return {
  "folke/zen-mode.nvim",
  keys = { { "<space>z", "<cmd>ZenMode<cr>" } },
  opts = {
    plugins = {
      options = {
        colorcolumn = "",
        laststatus = 0,              -- turn off the statusline in zen mode
      },
      gitsigns = { enabled = true }, -- disables git signs
      todo = { enabled = false },    -- if set to "true", todo-comments.nvim highlights will be disabled
    }
  }
}
