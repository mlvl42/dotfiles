return require('packer').startup(function()
	-- packer can manage itself as an optional plugin
	use { 'wbthomason/packer.nvim', opt = true }

	-- color scheme
	use { 'sainnhe/gruvbox-material' }
	vim.g.gruvbox_material_background = 'dark'
	vim.g.gruvbox_material_foreground = 'original'
	vim.g.gruvbox_material_better_performance = 1
	vim.g.gruvbox_material_diagnostic_line_highlight = 1
	vim.g.gruvbox_material_diagnostic_text_highlight = 1
	vim.g.gruvbox_material_diagnostic_virtual_text = 'colored'
	vim.g.gruvbox_material_enable_italic = 1
	vim.g.gruvbox_material_transparent_background = 1
	vim.cmd [[colorscheme gruvbox-material]]

	-- lualine
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}

	require('lualine').setup {
		options = {
			icons_enabled = false,
			theme = 'gruvbox-material',
			component_separators = { left = '>', right = '<' },
			section_separators = { left = '', right = '' },
		},
		sections = {
			lualine_a = { 'mode' },
			lualine_b = { 'branch', 'diff', 'diagnostics' },
			lualine_c = { { 'filename', path = 1 } },
			lualine_x = { 'encoding', 'fileformat', 'filetype' },
			lualine_y = { 'progress' },
			lualine_z = { 'location' }
		}
	}

	use { 'nvim-lua/plenary.nvim' }

	-- treesitter
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}

	-- playground
	use {
		'nvim-treesitter/playground'
	}

	require('nvim-treesitter.configs').setup {
		-- One of "all"
		ensure_installed = "all",

		-- Install languages synchronously (only applied to `ensure_installed`)
		sync_install = false,

		-- List of parsers to ignore installing
		-- ignore_install = { "javascript" },

		highlight = {
			-- `false` will disable the whole extension
			enable = true,

			-- list of language that will be disabled
			disable = { "markdown" },

			-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
			-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
			-- Using this option may slow down your editor, and you may see some duplicate highlights.
			-- Instead of true it can also be a list of languages
			additional_vim_regex_highlighting = false,
		},
		ignore_install = { "phpdoc" },
	}

	-- <3
	use { 'junegunn/fzf.vim' }
	vim.g.fzf_layout = { down = '40%' }

	-- LSP and completion
	use { 'neovim/nvim-lspconfig' }
	use { 'hrsh7th/nvim-cmp' }
	use { 'jose-elias-alvarez/null-ls.nvim' }
	use { 'hrsh7th/cmp-nvim-lsp' }
	use { 'hrsh7th/cmp-buffer' }
	use { 'hrsh7th/cmp-path' }
	use { 'hrsh7th/cmp-cmdline' }
	use({
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		tag = "v<CurrentMajor>.*",
		-- install jsregexp (optional!:).
		run = "make install_jsregexp"
	})

	use { 'saadparwaiz1/cmp_luasnip' }

	-- nerdcommenter
	use { 'ddollar/nerdcommenter' }

	-- zettelkasten
	use { 'mickael-menu/zk-nvim' }

	-- tree
	vim.g.loaded_netrw = 1
	vim.g.loaded_netrwPlugin = 1
	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons', -- optional, for file icon
		},
		config = function() require 'nvim-tree'.setup {
				-- auto_close = true,
				view = {
					mappings = {
						list = {
							{ key = { "<CR>", "o", "l" }, action = "edit", mode = "n" },
						}
					}
				}
			}
		end
	}

	use {
		'lewis6991/gitsigns.nvim',
		config = function()
			require('gitsigns').setup()
		end
	}

	-- diffview
	use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
	require('diffview').setup({
		keymaps = {
			view = {
				-- Disable the default mapping for <tab>:
				["<tab>"] = false,
			}
		}
	})


end)
