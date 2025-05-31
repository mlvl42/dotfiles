vim.g.mapleader = ' '

local fn = vim.fn
local execute = vim.api.nvim_command

require('sensible')
require("config.lazy")
require('autocmd')
require('plugins')
require('mapping')
require('completion')
require('lsp')
require('snippets')
