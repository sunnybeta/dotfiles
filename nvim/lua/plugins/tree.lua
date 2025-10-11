return {
	'nvim-tree/nvim-tree.lua',
	dependencies = {
		'nvim-tree/nvim-web-devicons',
	},
	opts = {
		filters = { dotfiles = false },
		diagnostics = { enable = true },
		renderer = {
			indent_markers = { enable = true },
			icons = {
				show = {
					folder_arrow = false,
				},
			},
		},
	},
	-- Maps
	vim.keymap.set('n', '<C-n>', ":NvimTreeToggle<CR>"),
}
