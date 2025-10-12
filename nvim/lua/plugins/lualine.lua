local colors = {
	bluemoon     = '#05A7AA',
	blueberry    = '#206BC4',

	blackberry   = '#696969',

	chocolate    = '#000000',

	kesar        = '#FDBA21',
	mango        = '#F6E377',

	pistachio    = '#4BA560',
	greenapple   = '#4EEF76',

	strawberry   = '#F00359',
	rose         = '#FF78C6',

	lichi        = '#C279CF',
	blackcurrant = '#9387C0',

	orange       = '#F07A5D',
	apple        = '#F85452',

	vanilla      = '#D3C0AC',
	none         = 'NONE',
}

local theme = {
	normal = {
		a = { bg = colors.mango, fg = colors.chocolate, gui = 'bold' },
		b = { bg = colors.blackcurrant, fg = colors.chocolate },
		c = { bg = colors.vanilla, fg = colors.chocolate },
		x = { bg = colors.chocolate, fg = colors.vanilla },
		y = { bg = colors.blackberry, fg = colors.strawberry },
	},
	insert = {
		a = { bg = colors.pistachio, fg = colors.chocolate, gui = 'bold' },
		b = { bg = colors.blackcurrant, fg = colors.chocolate },
		c = { bg = colors.vanilla, fg = colors.chocolate },
		x = { bg = colors.chocolate, fg = colors.vanilla },
		y = { bg = colors.blackberry, fg = colors.strawberry },
	},
	visual = {
		a = { bg = colors.lichi, fg = colors.chocolate, gui = 'bold' },
		b = { bg = colors.blackcurrant, fg = colors.chocolate },
		c = { bg = colors.vanilla, fg = colors.chocolate },
		x = { bg = colors.chocolate, fg = colors.vanilla },
		y = { bg = colors.blackberry, fg = colors.strawberry },
	},
	replace = {
		a = { bg = colors.vanilla, fg = colors.chocolate, gui = 'bold' },
		b = { bg = colors.blackcurrant, fg = colors.chocolate },
		c = { bg = colors.vanilla, fg = colors.chocolate },
		x = { bg = colors.chocolate, fg = colors.vanilla },
		y = { bg = colors.blackberry, fg = colors.strawberry },
	},
	command = {
		a = { bg = colors.chocolate, fg = colors.vanilla, gui = 'bold' },
		b = { bg = colors.blackcurrant, fg = colors.chocolate },
		c = { bg = colors.vanilla, fg = colors.chocolate },
		x = { bg = colors.chocolate, fg = colors.vanilla },
		y = { bg = colors.blackberry, fg = colors.strawberry },
	},
}

return {
	'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	event = { "VeryLazy" },
	opts = {
		options = {
			theme = theme,
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
						active = { bg = colors.rose, fg = colors.chocolate, gui = "bold" },
						inactive = { bg = colors.chocolate, fg = colors.vanilla, gui = "italic" },
					},
					symbols = {
						modified = " ●",
						alternate_file = "",
						directory = "",
					},
					mode = 2,
				},
				{ "filename", path = 2 },
			},
			lualine_x = { "filesize" },
			lualine_y = { "searchcount", "filetype", "selectioncount" },
			lualine_z = { "progress", "location" },
		},
	},
}
