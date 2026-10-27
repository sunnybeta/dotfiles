return {
	"nvzone/showkeys",
	event = "VimEnter",
	cmd = "ShowkeysToggle",
	config = function()
		require"showkeys".setup({
			maxkeys = 5,
			show_count = true,
			winopts = {
				focusable = false,
				relative = "editor",
				style = "minimal",
				border = "single",
				height = 1,
				row = 1,
				col = 0,
			}
		})
		vim.cmd("ShowkeysToggle")
	end
}
