return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    picker = {
      win = {
        input = {
          keys = {
            ["<c-k>"] = { "list_down", mode = { "i", "n" } },
            ["<c-;>"] = { "list_up", mode = { "i", "n" } },
          }
        }
      },
    },
    zen = { toggles = { dim = false }},
    input = {},
    bigfile = {},
    dashboard = {},
    quickfile = {},
    statuscolumn = {},
    styles = {
      notification = {
        wo = { wrap = true } -- Wrap notifications
      }
    }
  },
  keys = {
    { "<space>n",  function() Snacks.notifier.show_history() end, desc = "Notification History" },
    { "<space>bd", function() Snacks.bufdelete() end, desc = "Delete Buffer" },
    { "<space>gB", function() Snacks.gitbrowse() end, desc = "Git Browse" },
    { "<space>gb", function() Snacks.git.blame_line() end, desc = "Git Blame Line" },
    { "<space>gf", function() Snacks.lazygit.log_file() end, desc = "Lazygit Current File History" },
    { "<space>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
    { "<space>gl", function() Snacks.lazygit.log() end, desc = "Lazygit Log (cwd)" },
    { "<space>z",  function() Snacks.zen() end, desc = "Toggle Zen-mode" },

    { "<space>,", function() Snacks.picker.buffers() end, desc = "Buffers" },
    { "<space>/", function() Snacks.picker.grep() end, desc = "Grep" },
    { "<space>:", function() Snacks.picker.command_history() end, desc = "Command History" },
    { "<space>se", function() Snacks.picker.files() end, desc = "Find Files" },
    -- find
    { "<space>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
    { "<space>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
    { "<space>ff", function() Snacks.picker.files() end, desc = "Find Files" },
    { "<space>fg", function() Snacks.picker.git_files() end, desc = "Find Git Files" },
    { "<space>fr", function() Snacks.picker.recent() end, desc = "Recent" },
    { "<space>fi", function() Snacks.picker.icons() end, desc = "Icons" },
    -- git
    { "<space>gc", function() Snacks.picker.git_log() end, desc = "Git Log" },
    { "<space>gs", function() Snacks.picker.git_status() end, desc = "Git Status" },
    -- Grep
    { "<space>sb", function() Snacks.picker.grep_buffers() end, desc = "Grep Open Buffers" },
    { "<space>sg", function() Snacks.picker.grep() end, desc = "Grep" },
    { "<space>sw", function() Snacks.picker.grep_word() end, desc = "Visual selection or word", mode = { "n", "x" } },
    -- search
    { "<space>sc", function() Snacks.picker.commands() end, desc = "Commands" },
    { "<space>sd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
    { "<space>sh", function() Snacks.picker.help() end, desc = "Help Pages" },
    { "<space>sH", function() Snacks.picker.highlights() end, desc = "Highlights" },
    { "<space>sk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
    { "<space>sM", function() Snacks.picker.man() end, desc = "Man Pages" },
    { "<space>uC", function() Snacks.picker.colorschemes() end, desc = "Colorschemes" },
    { "<space>qp", function() Snacks.picker.projects() end, desc = "Projects" },
    -- LSP
    { "<space>ss", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
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
      end,
    })
  end,
}
