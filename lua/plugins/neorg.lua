vim.g.maplocalleader = ","

return {
  "nvim-neorg/neorg",
  lazy = false,  -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
  version = "*", -- Pin Neorg to the latest stable release
  bulid = ":Neorg sync-parsers",
  keys = { { "<space>ww", "<cmd>Neorg index<cr>" } },
  dependencies = { { "nvim-lua/plenary.nvim" }, { "nvim-neorg/neorg-telescope" } },
  opts = {
    load = {
      ["core.defaults"] = {},
      ["core.concealer"] = {},
      ["core.dirman"] = {
        config = {
          default_workspace = "main",
          workspaces = {
            main = "~/Notes",
          },
          index = "index.norg", -- The name of the main (root) .norg file
        }
      },
      ["core.summary"] = {
        config = {
          strategy = "default" -- default via document.meta | by_path
        }
      },
      ["core.esupports.metagen"] = {
        config = {
          author = "fhawk",
        }
      },
      ["core.integrations.telescope"] = {
        config = {
          insert_file_link = {
            show_title_preview = true,
          },
        }
      }
    }
  }
}
