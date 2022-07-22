vim.g.mapleader = ' '

local fn = vim.fn
local execute = vim.api.nvim_command

require('sensible')

-- auto install packer.nvim if not exists
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
end
vim.cmd [[packadd packer.nvim]]

require('autocmd')
require('plugins')
require('mapping')
require('completion')
require('lsp')
