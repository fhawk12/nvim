return {
	"onsails/lspkind.nvim",
	config = function()
		require("lspkind").init({
			-- DEPRECATED (use mode instead): enables text annotations
			--
			-- default: true
			-- with_text = true,

			-- defines how annotations are shown
			-- default: symbol
			-- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
			mode = "symbol_text",

			-- default symbol map
			-- can be either 'default' (requires nerd-fonts font) or
			-- 'codicons' for codicon preset (requires vscode-codicons font)
			--
			-- default: 'default'
			-- preset = "codicons",

			-- override preset symbols
			--
			-- default: {}
			-- my icons symbol
			symbol_map = {
				Text = "󰉿 ",
				Method = "󰆧 ",
				Function = "󰊕 ",
				Constructor = " ",
				Field = "󰜢 ",
				Variable = "α ",
				Interface = " ",
				Property = "󰜢 ",
				Unit = "󰑭 ",
				Value = "󰎠 ",
				Enum = " ",
				EnumMember = " ",
				Keyword = " ",
				Snippet = " ",
				Color = "󰏘 ",
				File = "󰈙 ",
				Folder = "󰉋 ",
				Constant = "󰏿 ",
				Event = " ",
				Operator = "󰆕 ",
				Array = "󰅪 ",
				Boolean = " ",
				Class = " ",
				Copilot = " ",
				nEvent = " ",
				Key = " ",
				Module = " ",
				Namespace = "󰌗 ",
				Null = "󰟢 ",
				Number = "󰎠 ",
				Object = " ",
				Package = " ",
				Reference = " ",
				String = " ",
				Struct = "󰌗 ",
				TypeParameter = "󰊄 ",
			},
		})
	end,
}
