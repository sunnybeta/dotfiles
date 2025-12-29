return  {
	'nvim-treesitter/nvim-treesitter',
	lazy = false,
	event = { "BufReadPost", "BufNewFile" },
	dependencies = {
		'nvim-treesitter/nvim-treesitter-textobjects'
	},
	build = ':TSUpdate',
	config = function()
		require'nvim-treesitter.configs'.setup({
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
			},
		})
	end
}
