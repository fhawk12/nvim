return {
  "nvim-java/nvim-java",
  ft = "java",
  keys = {
    { "<leader>jrs", "<cmd>JavaRunnerRunMain<cr>", desc = "Runs the application or selected main class" },
    { "<leader>jre", "<cmd>JavaRunnerStopMain<cr>", desc = "Stops the running application" },
    { "<leader>jl", "<cmd>JavaRunnerToggleLogs<cr>", desc = "Toggle between show & hide runner log windows" },

    { "<leader>jtc", "<cmd>JavaTestRunCurrentClass<cr>", desc = "Run the test class in the active buffer" },
    { "<leader>jtm", "<cmd>JavaTestRunCurrentMethod<cr>", desc = "Run the test method on the cursor" },
    { "<leader>jv", "<cmd>JavaTestViewLastReport<cr>", desc = "Open the last test report in a popup window" },
  },
  dependencies = {
    "nvim-java/lua-async-await",
    "nvim-java/nvim-java-refactor",
    "nvim-java/nvim-java-core",
    "nvim-java/nvim-java-test",
    "nvim-java/nvim-java-dap",
    "MunifTanjim/nui.nvim",
    "neovim/nvim-lspconfig",
    "mfussenegger/nvim-dap",
    {
      "williamboman/mason.nvim",
      opts = {
        registries = {
          "github:nvim-java/mason-registry",
          "github:mason-org/mason-registry",
        },
      },
    },
    {
      "williamboman/mason-lspconfig.nvim",
      opts = {
        handlers = {
          ["jdtls"] = function()
            require("java").setup()
          end,
        },
      },
    },
  },
  opts = {},
}
