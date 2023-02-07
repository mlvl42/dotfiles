local ls = require("luasnip")
-- some shorthands...
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local fmt = require("luasnip.extras.fmt").fmt

local left_delim = function(_)
	return vim.b.NERDCommenterDelims['leftAlt']
end

local right_delim = function(_)
	return vim.b.NERDCommenterDelims['rightAlt']
end

ls.add_snippets("all", {
	s("mephi_vuln", fmt([[{}{{{{{{ VULN: {}
}}}}}}{}]], {
		f(left_delim, {}),
		i(1),
		f(right_delim, {}),
	})),
	s("mephi_note", fmt([[{}{{{{{{ NOTE: {}
}}}}}}{}]], {
		f(left_delim, {}),
		i(1),
		f(right_delim, {}),
	}))
}, {
	key = "all",
})
