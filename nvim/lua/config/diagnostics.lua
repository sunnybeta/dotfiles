local map = vim.keymap.set

-- ui
vim.diagnostic.config({
	signs = {
		Error = ' ',
		Warn  = ' ',
		Hint  = '󰠠 ',
		Info  = ' ',
	},
	virtual_text = true,
})

-- maps
map('n', 'gd', vim.lsp.buf.definition, { buffer=0, desc='LSP: [G]oto [D]efinition' })
map('n', 'K', vim.lsp.buf.hover, { buffer=0, desc='LSP: Hover [I]nformation' })
map('n', 'gt', vim.lsp.buf.type_definition, { buffer=0, desc='LSP: [G]oto [T]ype [D]efinition' })
map('n', 'gi', vim.lsp.buf.implementation, { buffer=0, desc='LSP: [G]oto [I]mplementation' })
map('n', '<leader>r', vim.lsp.buf.rename, { buffer=0, desc='LSP: Rename Definition' })
map('n', '<leader>c', vim.lsp.buf.code_action, { buffer=0, desc='LSP: [C]ode Action' })
map('n', '[d', vim.diagnostic.goto_prev, { buffer=0, desc='Go To Previous Diagnostic Message' })
map('n', ']d', vim.diagnostic.goto_next, { buffer=0, desc='Go To Next Diagnostic Message' })
map('n', '<leader>e', vim.diagnostic.open_float, { buffer=0, desc='Open Floating Diagnostic Message' })
map('n', '<leader>q', vim.diagnostic.setloclist, { buffer=0, desc='Open Diagnostics List' })
