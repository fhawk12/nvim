return {
  {
    "kdheepak/lazygit.nvim",
    -- optional for floating window border decoration
    keys = {
      { "<leader>gg", "<cmd>LazyGit<cr>", desc = "Lazy git" },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
}
