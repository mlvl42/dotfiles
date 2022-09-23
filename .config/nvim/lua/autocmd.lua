local utils = require('utils')

local function nvim_create_augroups(groups)
	for group_name, definition in pairs(groups) do
		vim.api.nvim_create_augroup(group_name, { clear = true })
		for _, def in ipairs(definition) do
			local opts = def.opts
			opts.group = group_name
			vim.api.nvim_create_autocmd(def.event, opts)
		end
	end
end

local augroups = {
	packer = {
		{
			event = "BufWritePost",
			opts = {
				pattern = "plugins.lua",
				command = "PackerCompile"
			}
		};
	};
	restore_cursor = {
		{
			event = 'BufRead',
			opts = {
				pattern = '*',
				command = [[call setpos(".", getpos("'\""))]]
			}
		};
	};
	autoformat = {
		{
			event = 'BufWritePre',
			opts = {
				pattern = { '*.rs', '*.lua' },
				callback = function()
					vim.lsp.buf.formatting_sync(nil, 1000)
				end
			}
		};
	};
}

nvim_create_augroups(augroups)
