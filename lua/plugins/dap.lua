return {
	"rcarriga/nvim-dap-ui",
	dependencies = {
		"mfussenegger/nvim-dap",
		"nvim-treesitter/nvim-treesitter",
		"theHamsta/nvim-dap-virtual-text",
    "nvim-neotest/nvim-nio"
	},
	config = function()

    -- keymapping
    vim.keymap.set('n', '<F5>', function() require('dap').continue() end, { desc = "Open Debug" })
    vim.keymap.set('n', '<F10>', function() require('dap').step_over() end, { desc = "Step over" })
    vim.keymap.set('n', '<F11>', function() require('dap').step_into() end, { desc = "Step into" })
    vim.keymap.set('n', '<F12>', function() require('dap').step_out() end, { desc = "Step out" })
    vim.keymap.set('n', '<Leader>db', function() require('dap').toggle_breakpoint() end, { desc = "Toggle breakpoint" })
    vim.keymap.set('n', '<Leader>dB', function() require('dap').set_breakpoint() end, { desc = "Set breakpoint" })
    vim.keymap.set('n', '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end, { desc = "Set breakpoint with message" })
    vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end, { desc = "Repl open" })
    vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end, { desc = "Run last" })
    vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
      require('dap.ui.widgets').hover()
    end, { desc = "Widgets hover" } )
    vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
      require('dap.ui.widgets').preview()
    end, { desc = "Widgets preview" })
    vim.keymap.set('n', '<Leader>df', function()
      local widgets = require('dap.ui.widgets')
      widgets.centered_float(widgets.frames)
    end, { desc = "Widgets centered float frames" })
    vim.keymap.set('n', '<Leader>ds', function()
      local widgets = require('dap.ui.widgets')
      widgets.centered_float(widgets.scopes)
    end, { desc = "Widgets centered float scopes" })

    -- nvim-dap-virtual-text
		require("nvim-dap-virtual-text").setup({
      highlight_new_as_changed = true,
      commented = true,
      virt_lines = true,
      show_stop_reason = true,
    })

    -- dap
		local dap = require("dap")
		dap.adapters.codelldb = {
			type = "server",
			port = "${port}",
			executable = {
				command = "/home/fhawk/.local/share/nvim/mason/bin/codelldb",
				args = { "--port", "${port}" },
			},
		}

		dap.configurations.cpp = {
			{
				name = "Launch file",
				type = "codelldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
			},
		}

    -- dap-ui
		require("dapui").setup()
    local dapui = require('dapui')
		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end
	end,
}
