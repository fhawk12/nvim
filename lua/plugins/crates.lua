return {
	"Saecki/crates.nvim",
	event = { "BufRead Cargo.toml" },
	opts = {
		completion = {
			cmp = { enabled = true }, -- don't forget add source to nvim-cmp
		},
		lsp = {
			enabled = true,
			actions = true,
			completion = true,
			hover = false,
			on_attach = function(client, bufnr)
				local crates = require("crates")
				local opts = { buffer = bufnr, silent = true }

				vim.keymap.set("n", "ct", crates.toggle, opts)
				vim.keymap.set("n", "cr", crates.reload, opts)

				vim.keymap.set("n", "cv", crates.show_versions_popup, opts)
				vim.keymap.set("n", "cf", crates.show_features_popup, opts)
				vim.keymap.set("n", "cd", crates.show_dependencies_popup, opts)

				vim.keymap.set("n", "cu", crates.update_crate, opts)
				vim.keymap.set("v", "cu", crates.update_crates, opts)
				vim.keymap.set("n", "<space>ca", crates.update_all_crates, opts)
				vim.keymap.set("n", "cU", crates.upgrade_crate, opts)
				vim.keymap.set("v", "cU", crates.upgrade_crates, opts)
				vim.keymap.set("n", "<space>cA", crates.upgrade_all_crates, opts)

				vim.keymap.set("n", "cx", crates.expand_plain_crate_to_inline_table, opts)
				vim.keymap.set("n", "cX", crates.extract_crate_into_table, opts)

				vim.keymap.set("n", "cH", crates.open_homepage, opts)
				vim.keymap.set("n", "cR", crates.open_repository, opts)
				vim.keymap.set("n", "cD", crates.open_documentation, opts)
				vim.keymap.set("n", "cC", crates.open_crates_io, opts)
				vim.keymap.set("n", "cL", crates.open_lib_rs, opts)

				local function show_documentation()
					local filetype = vim.bo.filetype
					if filetype == "vim" or filetype == "help" then
						vim.cmd("h " .. vim.fn.expand("<cword>"))
					elseif filetype == "man" then
						vim.cmd("Man " .. vim.fn.expand("<cword>"))
					elseif vim.fn.expand("%:t") == "Cargo.toml" and require("crates").popup_available() then
						require("crates").show_popup()
					else
						vim.lsp.buf.hover()
					end
				end
				vim.keymap.set("n", "E", show_documentation, opts)
			end,
		},
	},
}
