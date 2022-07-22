--- from https://github.com/norcalli/nvim_utils
function nvim_create_augroups(definitions)
	for group_name, definition in pairs(definitions) do
		vim.api.nvim_command('augroup '..group_name)
		vim.api.nvim_command('autocmd!')
		for _, def in ipairs(definition) do
			local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
			vim.api.nvim_command(command)
		end
		vim.api.nvim_command('augroup END')
	end
end

local autocmds = {
	packer = {
		{ "BufWritePost", "plugins.lua", "PackerCompile" };
	};
	restore_cursor = {
		{ 'BufRead', '*', [[call setpos(".", getpos("'\""))]] };
	};
	autoformat = {
		{ 'BufWritePre', '*.rs', [[lua vim.lsp.buf.formatting_sync(nil, 1000)]] };
	};
}

nvim_create_augroups(autocmds)
