--                        _           
--  _ __   ___  _____   _(_)_ __ ___  
-- | '_ \ / _ \/ _ \ \ / / | '_ ` _ \ 
-- | | | |  __/ (_) \ V /| | | | | | |
-- |_| |_|\___|\___/ \_/ |_|_| |_| |_|
--                                    

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	{
		'nvim-telescope/telescope.nvim',
		dependencies = {
			'nvim-lua/plenary.nvim'
		},
	},
	{
		'nvim-treesitter/nvim-treesitter',
		dependencies = {'nvim-treesitter/nvim-treesitter-textobjects'},
		build = ':TSUpdate',
		config = function()
			pcall(require('nvim-treesitter.install').update { with_sync = true })
		end,
		ensure_installed = { 'c', 'lua', 'vim', 'vimdoc', 'query', 'javascript', 'typescript', 'python', 'markdown', 'bash', 'go', 'rust' },
		sync_install = false,
		auto_install = true,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
	},
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		opts = {
			options = {
				theme = 'onedark',
				icons_enabled = true,
				component_separators = { left = "", right = "" },
				section_separators   = { left = "", right = "" },
			}
		}
	},
	{
		'neovim/nvim-lspconfig',
		dependencies = {
			'williamboman/mason.nvim',
			'williamboman/mason-lspconfig.nvim',
		}
	},
	{
		'hrsh7th/cmp-nvim-lsp',
		dependencies = {
			'L3MON4D3/LuaSnip',
			'hrsh7th/nvim-cmp',
		},
	},
	{
		'navarasu/onedark.nvim',
		lazy = false,
		priority = 1000,
		config = function()
		  vim.cmd.colorscheme 'onedark'
		end,
	},
	{
		'nanozuki/tabby.nvim',
	},
	{
		'rcarriga/nvim-notify',
	},
	{
		'nvim-tree/nvim-tree.lua',
		dependencies = {
			'nvim-tree/nvim-web-devicons'
		},
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
					corner = "└",
					edge = "│",
					item = "├",
					bottom = "─",
					none = " ",
				}
			}
		},
	}
}

local opts = {}

require('lazy').setup(plugins, opts)
require('tabby').setup()
require('mason').setup()
require('nvim-tree').setup()

local cmp = require('cmp')
local luasnip = require('luasnip')
local mason_lspconfig = require('mason-lspconfig')

vim.notify = require('notify').setup({
	background_color = '#000000'
})

luasnip.config.setup {}

cmp.setup({
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert {
		['<C-u>'] = cmp.mapping.scroll_docs(-4),
		['<C-d>'] = cmp.mapping.scroll_docs(4),
		-- ['<C-f>'] = cmp_action.luasnip_jump_forward(),
		-- ['<C-b>'] = cmp_action.luasnip_jump_backward(),
		['<C-Space>'] = cmp.mapping.complete {},
		['<CR>'] = cmp.mapping.confirm {
		  behavior = cmp.ConfirmBehavior.Replace,
		  select = true,
		},
		['<Tab>'] = cmp.mapping(function(fallback)
		  if cmp.visible() then
		    cmp.select_next_item()
		  elseif luasnip.expand_or_jumpable() then
		    luasnip.expand_or_jump()
		  else
		    fallback()
		  end
		end, { 'i', 's' }),
		['<S-Tab>'] = cmp.mapping(function(fallback)
		  if cmp.visible() then
		    cmp.select_prev_item()
		  elseif luasnip.jumpable(-1) then
		    luasnip.jump(-1)
		  else
		    fallback()
		  end
		end, { 'i', 's' }),
	},
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
	},
})

-----

local servers =  {
	lua_ls = {
		Lua = {
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
			diagnostics = { globals = 'vim' },
		},
	},
}

mason_lspconfig.setup({
  ensure_installed = vim.tbl_keys(servers),
  automatic_installation = true,
})

---- L S P -----

local on_attach = function(_, bufnr)
  -- In this case, we create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  -- nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  -- nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  -- nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  -- nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  -- nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

--- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
    }
  end,
}

-- THEMES

-- 'sainnhe/everforest',
-- 'tsuzat/neosolarized.nvim',
-- 'navarasu/onedark.nvim',
-- 'catppuccin/nvim',
-- 'morhetz/gruvbox',
-- 'Mofiqul/dracula.nvim',



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
vim.o.termguicolors = true
vim.o.timeout = true
vim.o.timeoutlen = 300
vim.o.undofile = true
vim.o.updatetime = 250

vim.opt.ai = true
vim.opt.autoindent = true
vim.opt.backspace = 'start,eol,indent'
vim.opt.breakindent = true
vim.opt.cmdheight = 1
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'
vim.opt.guicursor = ""
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.laststatus = 2
vim.opt.list = true
vim.opt.listchars = { eol = '¬', tab = '-'} -- ┊-' } -- tab = '▶-' }
vim.opt.path:append { '**' }
vim.opt.scrolloff = 2
vim.opt.shell = 'bash'
vim.opt.showcmd = true
vim.opt.si = true
vim.opt.smarttab = true
vim.opt.title = true
vim.opt.wildignore:append { '*/node_modules/*', '*/__pycache__/*' }

vim.scriptencoding = 'utf-8'

vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.signcolumn = 'no'
vim.wo.wrap = true

vim.api.nvim_set_hl(0, 'Normal',      { bg = 'None' })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'None' })
vim.api.nvim_set_hl(0, 'EndOfBuffer', { bg = 'None' })


----- K E Y M A P -----

--- Unicode ---

vim.keymap.set('i', '=-=',  '≡')
vim.keymap.set('i', '->>',  '→')
vim.keymap.set('i', 'tickk','✓')
vim.keymap.set('i', '+-',   '±')
vim.keymap.set('i', '<--',  '←')
-- vim.keymap.set('i', 'boxx', '☐')
-- vim.keymap.set('i', 'boxt', '☒')
-- vim.keymap.set('i', '*(',   '★')

----- Ez Maps -----

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

vim.keymap.set('n', '[d',        vim.diagnostic.goto_prev,  { desc = "Go to previous diagnostic message" })
vim.keymap.set('n', ']d',        vim.diagnostic.goto_next,  { desc = "Go to next diagnostic message"     })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = "Open floating diagnostic message"  })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = "Open diagnostics list"             })

----- Telescope -----
vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files,   { desc = '[S]earch Gi[T] Files'    })
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files,  { desc = '[S]earch [F]iles'        })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags,   { desc = '[S]earch [H]elp'         })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep,   { desc = '[S]earch by [G]rep'      })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics'  })


----- A U T O -----

vim.cmd 'au BufWritePost */xresources !xrdb -load %'
