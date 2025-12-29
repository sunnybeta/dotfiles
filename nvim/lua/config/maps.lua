local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map('n', '<Space>of', ":lua vim.diagnostic.open_float()<CR>")

-- special
map('i', 'boxx', '☐')
map('i', 'boxt', '☒')
map('i', '*(',   '★')
map('i', '=-=',  '≡')
map('i', '->>',  '→')
map('i', 'tickk','✓')
map('i', '+-',   '±')
map('i', '<--',  '←')

-- move selected lines up and down
map('v', 'J', ":m '>+1<CR>gv=gv")
map('v', 'K', ":m '<-2<CR>gv=gv")

-- cut without overwriting clipboard
map('n','x','"_x', opts)

map('n','<C-d>','<C-d>zz', opts)
map('n','<C-u>','<C-u>zz', opts)

-- center at search
map('n','n','nzzzv',opts)
map('n','N','Nzzzv',opts)

-- resize splits
map('n','<Up>',':resize -2<CR>',opts)
map('n','<Down>',':resize +2<CR>',opts)
map('n','<Left>',':vertical resize -2<CR>',opts)
map('n','<Right>',':vertical resize +2<CR>',opts)
