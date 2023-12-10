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
vim.o.completeopt = 'menu,menuone,noselect'
vim.o.expandtab = false
vim.o.ignorecase = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.smartcase = true
vim.o.termguicolors = true
vim.o.timeout = true
vim.o.timeoutlen = 300
vim.o.undofile = true
vim.o.updatetime = 250
vim.opt.ai = true
vim.opt.autoindent = true
vim.opt.background = 'dark'
vim.opt.backspace = 'start,eol,indent'
vim.opt.breakindent = true
vim.opt.cmdheight = 0
vim.opt.cursorline = false
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'
vim.opt.guicursor = ''
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.laststatus = 2
vim.opt.list = true
vim.opt.listchars = { eol = '¬', tab = '┊-'}
vim.opt.path:append { '**' }
vim.opt.pumblend = 5
vim.opt.scrolloff = 2
vim.opt.shell = 'bash'
vim.opt.showcmd = true
vim.opt.si = true
vim.opt.smarttab = false
vim.opt.termguicolors = true
vim.opt.title = true
vim.opt.wildignore:append { '*/node_modules/*', '*/__pycache__/*' }
vim.opt.wildoptions = 'pum'
vim.opt.winblend = 0
vim.scriptencoding = 'utf-8'
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.signcolumn = 'no'
vim.wo.wrap = false
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
vim.fn.sign_define('DiagnosticSignError', { text = ' ', texthl = 'DiagnosticSignError', numhl = '' })
vim.fn.sign_define('DiagnosticSignWarn',  { text = ' ', texthl = 'DiagnosticSignWarn',  numhl = '' })
vim.fn.sign_define('DiagnosticSignHint',  { text = '󰠠 ', texthl = 'DiagnosticSignHint',  numhl = '' })
vim.fn.sign_define('DiagnosticSignInfo',  { text = ' ', texthl = 'DiagnosticSignInfo',  numhl = '' })
vim.cmd 'au BufWritePost */xresources !xrdb -load %'
vim.cmd 'au BufWritePost */.bashrc !source ~/.bashrc'
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
require'lazy'.setup({
	{
		'liminalminds/icecream.nvim',
		name = 'icecream',
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
		'neovim/nvim-lspconfig',
		lazy=false,
		event = {'BufReadPre','BufNewFile'},
		dependencies = {
			'williamboman/mason.nvim',
			'hrsh7th/nvim-cmp',
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'L3MON4D3/LuaSnip',
			'saadparwaiz1/cmp_luasnip',
		},
	}
})
vim.cmd.colorscheme 'icecream'
-- vim.api.nvim_set_hl(0, 'Normal',      { bg = 'None' })
-- vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'None' })
-- vim.api.nvim_set_hl(0, 'EndOfBuffer', { bg = 'None' })
require'lualine'.setup({
	options = {
		icons_enabled = true,
		theme = 'auto',
		component_separators = { left = '┊', right = '┊'},
		section_separators   = { left = ' ' , right = ' '},
	}
})
require'telescope'.setup({
	defaults = {
		mappings = {
		  i = {
			['<C-u>'] = false,
			['<C-d>'] = false,
		  },
		},
	},
})
vim.keymap.set('n', '<leader>gf', require'telescope.builtin'.git_files,   { desc = '[S]earch Gi[T] Files'    })
vim.keymap.set('n', '<leader>sf', require'telescope.builtin'.find_files,  { desc = '[S]earch [F]iles'        })
vim.keymap.set('n', '<leader>sh', require'telescope.builtin'.help_tags,   { desc = '[S]earch [H]elp'         })
vim.keymap.set('n', '<leader>sw', require'telescope.builtin'.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require'telescope.builtin'.live_grep,   { desc = '[S]earch by [G]rep'      })
vim.keymap.set('n', '<leader>sd', require'telescope.builtin'.diagnostics, { desc = '[S]earch [D]iagnostics'  })

require'nvim-treesitter.configs'.setup({
	ensure_installed = { 'c', 'cpp', 'lua', 'vim', 'vimdoc', 'query', 'javascript', 'typescript', 'python', 'markdown', 'bash', 'go', 'rust' },
	ignore_install = {},
	modules = {},
	sync_install = true,
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	autotag = {
		enable = true,
	}
})
require'mason'.setup({
	ui={
		icons={
			package_installed   = '✓',
			package_pending     = '󰠠',
			package_uninstalled = '',
		},
	}
})
local cmp = require'cmp'
cmp.setup({
	snippet = {
		expand = function(args)
			require'luasnip'.lsp_expand(args.body)
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
	}, {
		{ name = 'buffer' },
	})
})
local capabilities = require'cmp_nvim_lsp'.default_capabilities(vim.lsp.protocol.make_client_capabilities())
local on_attach = function()
	vim.keymap.set('n', 'gd',        vim.lsp.buf.   definition,      { buffer=0, desc='LSP: [G]oto [D]efinition'          })
	vim.keymap.set('n', 'K',         vim.lsp.buf.   hover,           { buffer=0, desc='LSP: Hover [I]nformation'          })
	vim.keymap.set('n', 'gt',        vim.lsp.buf.   type_definition, { buffer=0, desc='LSP: [G]oto [T]ype [D]efinition'   })
	vim.keymap.set('n', 'gi',        vim.lsp.buf.   implementation,  { buffer=0, desc='LSP: [G]oto [I]mplementation'      })
	vim.keymap.set('n', '<leader>r', vim.lsp.buf.   rename,          { buffer=0, desc='LSP: Rename Definition'            })
	vim.keymap.set('n', '<leader>c', vim.lsp.buf.   code_action,     { buffer=0, desc='LSP: [C]ode Action'                })
	vim.keymap.set('n', '[d',        vim.diagnostic.goto_prev,       { buffer=0, desc='Go To Previous Diagnostic Message' })
	vim.keymap.set('n', ']d',        vim.diagnostic.goto_next,       { buffer=0, desc='Go To Next Diagnostic Message'     })
	vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float,      { buffer=0, desc='Open Floating Diagnostic Message'  })
	vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist,      { buffer=0, desc='Open Diagnostics List'             })
end
require'lspconfig'.lua_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
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
require'lspconfig'.pyright.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
require'lspconfig'.cssls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
require'lspconfig'.gopls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
require'lspconfig'.rust_analyzer.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
require'lspconfig'.jdtls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
require'lspconfig'.bashls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
require'lspconfig'.html.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
require'lspconfig'.marksman.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
require'lspconfig'.tsserver.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
require'lspconfig'.tailwindcss.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
require'lspconfig'.volar.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
