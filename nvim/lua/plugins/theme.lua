return {
	{
		dir = '~/.local/projects/icecreamtheme/neovim',
		name = 'icecream',
		branch = 'master',
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme 'icecream'
			-- move the below three lines to the theme itself
			vim.api.nvim_set_hl(0, 'Normal',      { bg = 'None' })
			vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'None' })
			vim.api.nvim_set_hl(0, 'EndOfBuffer', { bg = 'None' })
		end
	}
}
