return {
	'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	event = { 'VeryLazy' },
	opts = {
		options = {
			theme = 'auto',
			icons_enabled = true,
			component_separators = { left = '┊', right = '┊' },
			section_separators   = { left = '',  right = ''  },
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch" },
			lualine_c = {
				"diagnositcs",
				{
					"buffers",
					buffers_color = {
						active = { bg = '#FF78C6', fg = '#000000', gui = "bold" },
						inactive = { bg = '#000000', fg = '#D3C0AC', gui = "italic" },
					},
					symbols = {
						modified = " ●",
						alternate_file = "",
						directory = "",
					},
					mode = 2,
				},
				{ "filename", path = 1 },
			},
			lualine_x = { "filesize" },
			lualine_y = { "searchcount", "filetype", "selectioncount" },
			lualine_z = { "progress", "location" },
		},
	},
}
