require("neogit").setup({})
vim.keymap.set("n", "<leader>gg", "<cmd>Neogit<cr>", { desc = "Open Neogit" })

require("gitsigns").setup({
	signs = {
		add = { text = "+" },
	},
	signs_staged = {
		add = { text = "+" },
	},
	on_attach = function(bufnr)
		local gitsigns = require("gitsigns")

		local function map(mode, l, r, opts)
			opts = opts or {}
			opts.buffer = bufnr
			vim.keymap.set(mode, l, r, opts)
		end

		-- Navigation
		map("n", "]h", function()
			if vim.wo.diff then
				vim.cmd.normal({ "]c", bang = true })
			else
				gitsigns.nav_hunk("next")
			end
		end, { desc = "Go to next hunk" })

		map("n", "[h", function()
			if vim.wo.diff then
				vim.cmd.normal({ "[c", bang = true })
			else
				gitsigns.nav_hunk("prev")
			end
		end, { desc = "Go to prev hunk" })

		-- Actions
		map("n", "<leader>hs", gitsigns.stage_hunk, { desc = "Stage the current hunk" })
		map("n", "<leader>hr", gitsigns.reset_hunk, { desc = "Reset the cutrent hunk" })

		map("v", "<leader>hs", function()
			gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end, { desc = "Stage the select hunk" })

		map("v", "<leader>hr", function()
			gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end, { desc = "Reset the select hunk" })

		map("n", "<leader>hS", gitsigns.stage_buffer, { desc = "Stage the buffer" })
		map("n", "<leader>hR", gitsigns.reset_buffer, { desc = "Reset the buffer" })
		map("n", "<leader>hp", gitsigns.preview_hunk, { desc = "Preview the hunk with pop window" })
		map("n", "<leader>hi", gitsigns.preview_hunk_inline, { desc = "Preview the hunk inline" })

		map("n", "<leader>hb", function()
			gitsigns.blame_line({ full = true })
		end, { desc = "Blame line" })

		map("n", "<leader>hd", gitsigns.diffthis, { desc = "Diffthis" })

		map("n", "<leader>hD", function()
			gitsigns.diffthis("~")
		end, { desc = "Diff the buffer" })

		map("n", "<leader>hQ", function()
			gitsigns.setqflist("all")
		end)
		map("n", "<leader>hq", gitsigns.setqflist, { desc = "Show status in quickfix" })

		-- Toggles
		map("n", "<leader>tb", gitsigns.toggle_current_line_blame, { desc = "Toggle current line blame" })
		map("n", "<leader>tw", gitsigns.toggle_word_diff, { desc = "Toggle word diff" })

		-- Text object
		-- map({ "o", "x" }, "ih", gitsigns.select_hunk, {desc="Select the current hunk"})
	end,
})
