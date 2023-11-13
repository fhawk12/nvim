return {
	"L3MON4D3/LuaSnip",
	-- follow latest release.
	version = "2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!).
	build = "make install_jsregexp",
	config = function()
		require("luasnip.loaders.from_vscode").lazy_load()
		require("luasnip.loaders.from_snipmate").lazy_load({ path = { "~/.config/nvim/snippets" } })

		local ls = require("luasnip")
		-- some shorthands...
		-- trig	string		唯一必须提供的选项，触发的文字
		-- name	string		可用于 nvim-compe 等其他插件识别片段
		-- dscr	string 或 table		片段的描述，多行时使用 \n 分隔的字符串或者表
		-- wordTrig	boolean	true	true 时，片段只在光标前的字 ([%w_]+) 与 trigger 相符时展开
		-- regTrig	boolean	false	trigger 是否被解释成 lua 模式
		-- docstring	string		片段的文本表示，类似于 dscr；覆盖从 json 中加载的 docstring
		-- docTrig	string		对于使用 lua 模式所触发的片段：定义用于生成 docstring 的 trigger
		-- hidden	boolean	false	提示补全引擎：true 时，在查询片段时不应该展示该片段
		-- priority	正数	1000	片段的优先级：高优先级先于低优先级匹配触发；多个片段的优先级也可在 add_snippets 中设置

		local s = ls.snippet
		local sn = ls.snippet_node
		local t = ls.text_node
		local i = ls.insert_node
		local f = ls.function_node
		local c = ls.choice_node
		local d = ls.dynamic_node
		local r = ls.restore_node
		local l = require("luasnip.extras").lambda
		local rep = require("luasnip.extras").rep
		local p = require("luasnip.extras").partial
		local m = require("luasnip.extras").match
		local n = require("luasnip.extras").nonempty
		local dl = require("luasnip.extras").dynamic_lambda
		local fmt = require("luasnip.extras.fmt").fmt
		local fmta = require("luasnip.extras.fmt").fmta
		local types = require("luasnip.util.types")
		local conds = require("luasnip.extras.conditions")
		local conds_expand = require("luasnip.extras.conditions.expand")

		ls.add_snippets("all", {

			s("ternary", {
				i(1, "cond"),
				t(" ? "),
				i(2, "then"),
				t(" : "),
				i(3, "else"),
				t(";"),
			}),
		})

		-- require'luasnip'.config.setup({
		--   ext_opts = {
		--     [types.choiceNode] = {
		--       active = {
		--         virt_text = {{"●", "GruvboxOrange"}}
		--       }
		--     },
		--     [types.insertNode] = {
		--       active = {
		--         virt_text = {{"●", "GruvboxBlue"}}
		--       }
		--     }
		--   },
		-- })
	end,
}
