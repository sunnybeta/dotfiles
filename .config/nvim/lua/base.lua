vim.o.background = 'dark'
vim.o.breakindent = true
vim.o.clipboard = 'unnamedplus'
vim.o.completeopt = 'menu,menuone,noselect'
vim.o.expandtab = false
vim.o.ignorecase = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.softtabstop = 2
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
vim.opt.cmdheight = 1
vim.opt.cursorline = false
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'
vim.opt.guicursor = ''
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.laststatus = 2
vim.opt.list = true
vim.opt.listchars = { eol = '¬', tab = '┊ '}
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

vim.wo.number = true -- Make line numbers default
vim.wo.relativenumber = true -- Set relative numbered line
vim.wo.signcolumn = 'no'
vim.wo.wrap = true
vim.wo.linebreak = true

vim.fn.sign_define('DiagnosticSignError', { text = ' ', texthl = 'DiagnosticSignError', numhl = '' })
vim.fn.sign_define('DiagnosticSignWarn',  { text = ' ', texthl = 'DiagnosticSignWarn',  numhl = '' })
vim.fn.sign_define('DiagnosticSignHint',  { text = '󰠠 ', texthl = 'DiagnosticSignHint',  numhl = '' })
vim.fn.sign_define('DiagnosticSignInfo',  { text = ' ', texthl = 'DiagnosticSignInfo',  numhl = '' })

vim.cmd 'au BufWritePost */xresources !xrdb -load %'
vim.cmd 'au BufWritePost */.bashrc !source ~/.bashrc'
