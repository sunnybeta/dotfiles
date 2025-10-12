return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.8',
	dependencies = { 'nvim-lua/plenary.nvim' },
	opts = {
		defaults = {
			mappings = {
			  i = {
				['<C-u>'] = false,
				['<C-d>'] = false,
			  },
			},
		},
		extensions = {
			file_mappings = {
				hijack_netrw = true
			}
		},
	},
	vim.keymap.set('n', '<leader>gf', require'telescope.builtin'.git_files,   { desc = '[S]earch Gi[T] Files'    }),
	vim.keymap.set('n', '<leader>sf', require'telescope.builtin'.find_files,  { desc = '[S]earch [F]iles'        }),
	vim.keymap.set('n', '<leader>sh', require'telescope.builtin'.help_tags,   { desc = '[S]earch [H]elp'         }),
	vim.keymap.set('n', '<leader>sw', require'telescope.builtin'.grep_string, { desc = '[S]earch [W]ord'         }),
	vim.keymap.set('n', '<leader>sg', require'telescope.builtin'.live_grep,   { desc = '[S]earch by [G]rep'      }),
	vim.keymap.set('n', '<leader>sd', require'telescope.builtin'.diagnostics, { desc = '[S]earch [D]iagnostics'  }),
}
