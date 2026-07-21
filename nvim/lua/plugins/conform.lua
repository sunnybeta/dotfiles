return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			html = { "prettier" },
			css = { "prettier" },
			c = { "clang-format" },
		},
		format_on_save = { timeout_ms = 500, lsp_fallback = true },
		formatters = {
			["clang-format"] = {
				prepend_args = {
					"--style={ColumnLimit: 200, UseTab: Always, IndentWidth: 4, TabWidth: 4}" },
			},
		},
	},
}
