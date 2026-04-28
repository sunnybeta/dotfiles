return {
	"icecreamtheme/neovim",
	-- dir = '~/.local/projects/icecreamtheme/neovim',
	name = 'icecream',
	-- branch = 'dev',
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd.colorscheme 'icecream'
	end
}
