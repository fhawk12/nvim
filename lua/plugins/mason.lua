return {
  "williamboman/mason-lspconfig.nvim",
  dependencies =
  {
    "williamboman/mason.nvim",
    "neovim/nvim-lspconfig",
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup {
      ensure_installed = { "lua_ls" },
    }
    require("lspconfig").lua_ls.setup {}
    require("lspconfig").clangd.setup {}
  end
}
