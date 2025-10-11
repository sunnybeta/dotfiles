return  {
	'nvim-treesitter/nvim-treesitter',
	event = { "BufReadPost", "BufNewFile" },
	dependencies = {
		'nvim-treesitter/nvim-treesitter-textobjects'
	},
	build = ':TSUpdate',
	opts = {
		ensure_installed = { 'c', 'cpp', 'lua', 'vim', 'vimdoc', 'query', 'javascript', 'typescript', 'python', 'markdown', 'bash', 'go', 'rust', 'jsonc' },
		ignore_install = {},
		modules = {},
		sync_install = true,
		auto_install = true,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
		autotag = {
			enable = true,
		}
	},
	config = function(opts)
		require'nvim-treesitter.configs'.setup(opts)
	end,
}
