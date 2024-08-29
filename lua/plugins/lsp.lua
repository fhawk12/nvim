return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    { "neovim/nvim-lspconfig" },
    { "williamboman/mason.nvim" },
    { "j-hui/fidget.nvim",      opts = {} },
  },
  config = function()
    local on_attach = function(_, bufnr)
      local opts = { buffer = bufnr, noremap = true, silent = true }

      vim.keymap.set("n", "E", vim.lsp.buf.hover, opts)
      vim.keymap.set("n", "<space>;", vim.diagnostic.open_float, opts)
      vim.keymap.set({ "n", "x" }, "<space>f", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)

      vim.keymap.set("n", "lr", vim.lsp.buf.references, opts)
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
      vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

      vim.keymap.set("n", "<space>r", vim.lsp.buf.rename, opts)

      vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
      vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
      vim.keymap.set("n", "<space>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, opts)
    end

    local server_names = {
      "clangd",
      "rust_analyzer",
      "tsserver",
      "lua_ls",
      "cssls",
      "css_variables",
    }

    require("mason").setup({})
    require("mason-lspconfig").setup({
      ensure_installed = server_names,
      automatic_installation = true,
      handlers = {
        function(server_name)
          require("lspconfig")[server_name].setup({
            on_attach = on_attach,
            capabilities = require('cmp_nvim_lsp').default_capabilities()
          })
        end,
      },
    })
  end,
}
