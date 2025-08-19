---Keymap Settings for Neovim

-- Special Characters
vim.keymap.set('i', 'boxx', '☐')
vim.keymap.set('i', 'boxt', '☒')
vim.keymap.set('i', '*(',   '★')
vim.keymap.set('i', '=-=',  '≡')
vim.keymap.set('i', '->>',  '→')
vim.keymap.set('i', 'tickk','✓')
vim.keymap.set('i', '+-',   '±')

vim.keymap.set('i', '<--',  '←')

-- Move selected lines up and down
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")


-- Diagnostics
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

local opts = { noremap = true, silent = true }

vim.keymap.set('n','x','"_x', opts)

vim.keymap.set('n','<C-d>','<C-d>zz',opts)
vim.keymap.set('n','<C-u>','<C-u>zz',opts)

vim.keymap.set('n','n','nzzzv',opts)
vim.keymap.set('n','N','Nzzzv',opts)

vim.keymap.set('n','<Up>',':resize -2<CR>',opts)
vim.keymap.set('n','<Down>',':resize -2<CR>',opts)
vim.keymap.set('n','<Left>',':vertical resize -2<CR>',opts)
vim.keymap.set('n','<Right>',':vertical resize +2<CR>',opts)
