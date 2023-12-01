return {
	"nvimdev/epo.nvim",
	event = "InsertEnter",
	enabled = false,
	config = function()
		vim.keymap.set("i", "<TAB>", function()
			if vim.fn.pumvisible() == 1 then
				return "<C-n>"
			elseif vim.snippet.jumpable(1) then
				return "<cmd>lua vim.snippet.jump(1)<cr>"
			else
				return "<TAB>"
			end
		end, { expr = true })

		vim.keymap.set("i", "<S-TAB>", function()
			if vim.fn.pumvisible() == 1 then
				return "<C-p>"
			elseif vim.snippet.jumpable(-1) then
				return "<cmd>lua vim.snippet.jump(-1)<CR>"
			else
				return "<S-TAB>"
			end
		end, { expr = true })

		vim.keymap.set("i", "<C-e>", function()
			if vim.fn.pumvisible() == 1 then
				require("epo").disable_trigger()
			end
			return "<C-e>"
		end, { expr = true })

		-- suggested completeopt
		vim.opt.completeopt = "menu,menuone,noselect"
		local kind_icons = {
			Text = "󰉿",
			Method = "󰆧",
			Function = "󰘧",
			Constructor = "",
			Field = "󰜢",
			Variable = "󰀫",
			Class = "󰠱",
			Interface = "",
			Module = "",
			Property = "󰜢",
			Unit = "󰑭",
			Value = "󰎠",
			Enum = "",
			Keyword = "󰌋",
			Snippet = "",
			Color = "󰏘",
			File = "󰈙",
			Reference = "",
			Folder = "󰉋",
			EnumMember = "",
			Constant = "󰏿",
			Struct = "",
			Event = "",
			Operator = "󰆕",
			TypeParameter = " ",
			Unknown = " ",
		}

		-- default settings
		require("epo").setup({
			-- fuzzy match
			fuzzy = false,
			-- increase this value can aviod trigger complete when delete character.
			debounce = 50,
			-- when completion confrim auto show a signature help floating window.
			signature = true,
			-- vscode style json snippet path
			snippet_path = nil,
			-- border for lsp signature popup, :h nvim_open_win
			signature_border = "rounded",
			-- lsp kind formatting, k is kind string "Field", "Struct", "Keyword" etc.
			kind_format = function(k)
				return k:lower():sub(1, 1)
				-- return kind_icons[k] .. " " .. k
			end,
		})

		local capabilities =
			vim.tbl_deep_extend("force", vim.lsp.protocol.make_client_capabilities(), require("epo").register_cap())
	end,
}
