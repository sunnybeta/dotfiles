local set = vim.opt

set.ai = true
set.autoindent = true
set.background = 'dark'
set.backspace = { "start", "eol", "indent" }
set.breakindent = true
set.breakindent = true
set.clipboard = 'unnamedplus'
set.cmdheight = 1
set.completeopt = 'menu,menuone,noselect'
set.conceallevel = 0
set.concealcursor = 'nc'
set.cursorline = false
set.encoding = 'utf-8'
set.expandtab = false
set.fileencoding = 'utf-8'
set.guicursor = ''
set.hlsearch = false
set.ignorecase = true
set.incsearch = true
set.laststatus = 2
set.linebreak = true
set.list = true
set.listchars = { eol = '¬', tab = '▸ ' }
set.number = true -- Make line numbers default
set.path:append { '**' }
set.pumblend = 5
set.relativenumber = true -- Set relative numbered line
set.scrolloff = 2
set.shell = 'bash'
set.shiftwidth = 4
set.showcmd = true
set.si = true
set.signcolumn = 'yes'
set.smartcase = true
set.smarttab = false
set.softtabstop = 4
set.tabstop = 4
set.termguicolors = true
set.timeout = true
set.timeoutlen = 300
set.title = true
set.undofile = true
set.updatetime = 250
set.wildignore:append { '*/node_modules/*', '*/__pycache__/*' }
set.wildoptions = 'pum'
set.winblend = 0
set.winborder = 'rounded'
set.wrap = true

vim.api.nvim_create_autocmd("FileType", {
	pattern = "typescriptreact",
	callback = function()
		set.expandtab = true -- Use spaces instead of tabs
		set.shiftwidth = 2 -- Size of an indent
		set.tabstop = 2 -- Number of spaces tabs count for
		set.softtabstop = 2 -- Number of spaces for a tab while editing
	end,
})


vim.api.nvim_create_autocmd("FileType", {
	pattern = "dart",
	callback = function()
		set.expandtab = true -- Use spaces instead of tabs
		set.shiftwidth = 2 -- Size of an indent
		set.tabstop = 2 -- Number of spaces tabs count for
		set.softtabstop = 2 -- Number of spaces for a tab while editing
	end,
})
