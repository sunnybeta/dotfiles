return {
	dir = '~/.local/projects/liminalminds/eleven59-neovim',
	name = 'eleven59',
	branch = 'dev',
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd.colorscheme'eleven59'
	end
}
