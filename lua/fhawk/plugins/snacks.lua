return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
      bigfiles = { enabled = true , notify = false },
      dashboard = { enabled = true },
      input = { enabled = true },
      explorer = {
          enabled = true,
          layout = {
              cycle = false,
          }
      },
      picker = {
          enabled = true,
          win = {
            input = {
              keys = {
                ["<c-k>"] = { "list_down", mode = { "i", "n" } },
                ["<c-;>"] = { "list_up", mode = { "i", "n" } },
              }
            }
          },
        },
      statuscolumn = {enabled = true},
      zen = { enabled = true, toggles = { dim = false } },
      scroll = { enabled = true }
  },
  keys = {
    -- Pickers & Explorer
    -- { "<space>e", function() Snacks.explorer() end, desc = "File Explorer" },
    { "<space>/", function() Snacks.picker.grep() end, desc = "Grep" },
    { "<space>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
    { "<space>ff", function() Snacks.picker.files() end, desc = "Find Files" },
    { "<space>fr", function() Snacks.picker.recent() end, desc = "Recent" },
    { "<space>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
    -- git
    { "<space>gd", function() Snacks.picker.git_diff() end, desc = "Git Diff (Hunks)" },
    { "<space>gbr", function() Snacks.picker.git_branches({ layout= "select" }) end, desc = "Pick and Switch Git Branches" },
    -- search
    { "<space>sc", function() Snacks.picker.commands() end, desc = "Commands" },
    { "<space>sd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
    { "<space>sD", function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer Diagnostics" },
    { "<space>sh", function() Snacks.picker.help() end, desc = "Help Pages" },
    { "<space>sH", function() Snacks.picker.highlights() end, desc = "Highlights" },
    { "<space>si", function() Snacks.picker.icons() end, desc = "Icons" },
    { "<space>sk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
    { "<space>sp", function() Snacks.picker.lazy() end, desc = "Search for Plugin Spec" },
    { "<space>uC", function() Snacks.picker.colorschemes() end, desc = "Colorschemes" },
    -- LSP
    { "<space>gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
    -- Other
    { "<space>z",  function() Snacks.zen() end, desc = "Toggle Zen Mode" },
    { "<space>Z",  function() Snacks.zen.zoom() end, desc = "Toggle Zoom" },
    { "<space>n",  function() Snacks.notifier.show_history() end, desc = "Notification History" },
    { "<space>gB", function() Snacks.gitbrowse() end, desc = "Git Browse", mode = { "n", "v" } },
    { "<space>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
    { "<space>un", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
    { "<leader>rn", function() Snacks.rename.rename_file() end, desc = "Rename File" },
  },
  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        -- Setup some globals for debugging (lazy-loaded)
        _G.dd = function(...)
          Snacks.debug.inspect(...)
        end
        _G.bt = function()
          Snacks.debug.backtrace()
        end
        vim.print = _G.dd -- Override print to use snacks for `:=` command

        -- Create some toggle mappings
        Snacks.toggle.option("spell", { name = "Spelling" }):map("<space>us")
        Snacks.toggle.option("wrap", { name = "Wrap" }):map("<space>uw")
        Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<space>uL")
        Snacks.toggle.diagnostics():map("<space>ud")
        Snacks.toggle.line_number():map("<space>ul")
        Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map("<space>uc")
        Snacks.toggle.treesitter():map("<space>uT")
        Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<space>ub")
        Snacks.toggle.inlay_hints():map("<space>uh")
        Snacks.toggle.indent():map("<space>ug")
        Snacks.toggle.dim():map("<space>uD")
      end,
    })
  end,
}
