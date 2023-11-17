--                        _           
--  _ __   ___  _____   _(_)_ __ ___  
-- | '_ \ / _ \/ _ \ \ / / | '_ ` _ \ 
-- | | | |  __/ (_) \ V /| | | | | | |
-- |_| |_|\___|\___/ \_/ |_|_| |_| |_|
--                                    

vim.g.mapleader = '\\'
vim.g.maplocalleader = '\\'

vim.o.background = 'dark'
vim.o.breakindent = true
vim.o.clipboard = 'unnamedplus'
vim.o.completeopt = 'menuone,noselect'
vim.o.ignorecase = true
vim.o.shiftwidth = 4
vim.o.smartcase = true
vim.o.tabstop = 4
vim.o.expandtab = false
vim.o.termguicolors = true
vim.o.timeout = true
vim.o.timeoutlen = 300
vim.o.undofile = true
vim.o.updatetime = 250

vim.opt.ai = true
vim.opt.autoindent = true
vim.opt.backspace = 'start,eol,indent'
vim.opt.breakindent = true
vim.opt.cmdheight = 0
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'
vim.opt.guicursor = ''
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.laststatus = 2
vim.opt.list = true
vim.opt.listchars = { eol = '¬', tab = '┊-'} -- -' } -- tab = '▶-' }
vim.opt.path:append { '**' }
vim.opt.scrolloff = 2
vim.opt.shell = 'bash'
vim.opt.showcmd = true
vim.opt.si = true
vim.opt.smarttab = false
vim.opt.title = true
vim.opt.wildignore:append { '*/node_modules/*', '*/__pycache__/*' }
vim.opt.cursorline = false
vim.opt.termguicolors = true
vim.opt.winblend = 0
vim.opt.pumblend = 5
vim.opt.wildoptions = 'pum'
vim.opt.background = 'dark'

vim.scriptencoding = 'utf-8'

vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.signcolumn = 'no'
vim.wo.wrap = true

vim.keymap.set('i', 'boxx', '☐')
vim.keymap.set('i', 'boxt', '☒')
vim.keymap.set('i', '*(',   '★')
vim.keymap.set('i', '=-=',  '≡')
vim.keymap.set('i', '->>',  '→')
vim.keymap.set('i', 'tickk','✓')
vim.keymap.set('i', '+-',   '±')
vim.keymap.set('i', '<--',  '←')
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

vim.keymap.set('n', '[d',        vim.diagnostic.goto_prev,  { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d',        vim.diagnostic.goto_next,  { desc = 'Go to next diagnostic message'     })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message'  })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list'             })

vim.cmd 'au BufWritePost */xresources !xrdb -load %'


local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		'git',
		'clone',
		'--filter=blob:none',
		'https://github.com/folke/lazy.nvim.git',
		'--branch=stable',
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
	{
		'rcarriga/nvim-notify',
		lazy = false,
	},
	{
		'Tsuzat/NeoSolarized.nvim',
		name = 'solarized',
		lazy = false,
		priority = 1000,
	},
	{
		'nvim-lualine/lualine.nvim',
		dependencies = {
			'nvim-tree/nvim-web-devicons'
		},
		lazy=false,
	},
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.3',
		dependencies = {
			'nvim-lua/plenary.nvim',
			'nvim-tree/nvim-web-devicons',
			'nvim-treesitter/nvim-treesitter',
		},
	},
	{
		'nvim-treesitter/nvim-treesitter',
		dependencies = {
			'nvim-treesitter/nvim-treesitter-textobjects'
		},
		build = ':TSUpdate',
	},
	{
		'nvim-tree/nvim-tree.lua',
		dependencies = {
			'nvim-tree/nvim-web-devicons'
		},
	},
	{
		'hrsh7th/nvim-cmp',
		dependencies = {
			'L3MON4D3/LuaSnip',
			'hrsh7th/cmp-nvim-lsp',
		}
	},
	{
		'neovim/nvim-lspconfig',
		lazy=false,
		event = {'BufReadPre','BufNewFile'},
		dependencies = {
			'hrsh7th/cmp-nvim-lsp',
			'neovim/nvim-lspconfig',
			'williamboman/mason-lspconfig.nvim',
			'williamboman/mason.nvim',
		},
	},
	{
		'folke/neodev.nvim',
		dependencies = {
			'hrsh7th/cmp-nvim-lsp',
		},
		opts = {},
	},
})

vim.notify = require('notify')

require('notify').setup({
	render = 'default',
	minimum_width = 40,
	background_colour = '#000000',
	stages = 'fade',
	timeout = 2000,
	fps= 60,
})

vim.cmd.colorscheme 'NeoSolarized'
vim.api.nvim_set_hl(0, 'Normal',      { bg = 'None' })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'None' })
vim.api.nvim_set_hl(0, 'EndOfBuffer', { bg = 'None' })

require('lualine').setup({
	options = {
		icons_enabled = true,
		theme = 'solarized',
		component_separators = { left = '┊', right = '┊'},
		section_separators   = { left = '', right = ''},
	}
})

require('telescope').setup({
	defaults = {
		mappings = {
		  i = {
			['<C-u>'] = false,
			['<C-d>'] = false,
		  },
		},
	},
})

vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files,   { desc = '[S]earch Gi[T] Files'    })
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files,  { desc = '[S]earch [F]iles'        })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags,   { desc = '[S]earch [H]elp'         })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep,   { desc = '[S]earch by [G]rep'      })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics'  })

require('nvim-treesitter.configs').setup({
	ensure_installed = { 'c', 'cpp', 'lua', 'vim', 'vimdoc', 'query', 'javascript', 'typescript', 'python', 'markdown', 'bash', 'go', 'rust' },
	ignore_install = {},
	modules = {},
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	autotag = {
		enable = true,
	}
})

require('nvim-tree').setup({
	view = {
		number = true,
		relativenumber = true,
	},
	renderer = {
		indent_width = 2,
		indent_markers = {
			enable = true,
			inline_arrows = true,
			icons = {
				corner = '└',
				edge = '│',
				item = '├',
				bottom = '─',
			}
		}
	}
})

local cmp = require('cmp')

cmp.setup({
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end
	},
	mapping = cmp.mapping.preset.insert({
		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.close(),
		['<CR>'] = cmp.mapping.confirm({
		  behavior = cmp.ConfirmBehavior.Replace,
		  select = true,
		}),
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'luasnip'  },
		{ name = 'buffer'   },
	}),
	formatting = {
	}
})


local on_attach = function(_, bufnr)
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = bufnr, desc = 'LSP: [G]oto [D]efinition'})
end

local lspconfig = require('lspconfig')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

require('mason').setup({
	ui={
		icons={
			package_installed   = '✓',
			package_pending     = '󰠠',
			package_uninstalled = '',
		},
		{
			border = 'rounded',
		}
	}
})

require('mason-lspconfig').setup({
	ensure_installed = {
		'tsserver',
		'lua_ls',
		'jdtls',
		'rust_analyzer',
		'pyright',
		'gopls',
		'clangd',
		'html',
		'cssls',
		'marksman'
	},
	automatic_installation=true,
})

vim.fn.sign_define('DiagnosticSignError', { text = ' ', texthl = 'DiagnosticSignError', numhl = '' })
vim.fn.sign_define('DiagnosticSignWarn',  { text = ' ', texthl = 'DiagnosticSignWarn',  numhl = '' })
vim.fn.sign_define('DiagnosticSignHint',  { text = '󰠠 ', texthl = 'DiagnosticSignHint',  numhl = '' })
vim.fn.sign_define('DiagnosticSignInfo',  { text = ' ', texthl = 'DiagnosticSignInfo',  numhl = '' })


lspconfig.pyright.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig.cssls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig.gopls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig.rust_analyzer.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig.jdtls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})


lspconfig.html.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig.marksman.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig.lua_ls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		Lua = {
			diagnositcs = {
				globals = {'vim'}
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file('', true),
			},
			telemetry = {
				enable = false,
			}
		}
	}
})

lspconfig.tsserver.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
