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
