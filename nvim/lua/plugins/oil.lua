return {
	'stevearc/oil.nvim',
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		default_file_explorer = true,
		columns = { "icon", "size", "permissions" },
		keymaps = {
			["q"] = "actions.close",
		},
		view_options = {
			show_hidden = true,
		},
		skip_confirm_for_simple_edits = true,
	},
	vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" }),
	vim.api.nvim_create_autocmd("FileType", {
		pattern = "oil",
		callback = function()
			vim.opt_local.cursorline = true
		end,
	}),
}
