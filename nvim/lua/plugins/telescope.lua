return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.8',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-tree/nvim-web-devicons',
		{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
	},
	config = function()
		local telescope = require'telescope'
		local actions = require'telescope.actions'
		local builtin = require'telescope.builtin'
		telescope.load_extension('fzf')
		telescope.setup({
			defaults = {
				path_display = { 'smart' },
				cwd = false,
				layout_config = {
					horizontal = {
						preview_cutoff = 1,
					},
					height = 0.9,
					width = 0.9,
				},
				mappings = {
					i = {
						['<C-k>'] = actions.move_selection_previous,
						['<C-j>'] = actions.move_selection_next,
					},
				},
			},
			extensions = {
				file_mappings = {
					hijack_netrw = true
				},
				fzf = {},
			},
		})
		vim.keymap.set('n', '<leader>gf', builtin.git_files,   { desc = '[S]earch Gi[T] Files' })
		vim.keymap.set('n', '<leader>sf', builtin.find_files,  { desc = '[S]earch [F]iles' })
		vim.keymap.set('n', '<leader>sh', builtin.help_tags,   { desc = '[S]earch [H]elp' })
		vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch [W]ord' })
		vim.keymap.set('n', '<leader>sg', builtin.live_grep,   { desc = '[S]earch by [G]rep' })
		vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
	end
}
