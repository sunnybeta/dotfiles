return {
	"stevearc/conform.nvim",
	config = function(_, opts)
		require("conform").setup({
			formatters_by_ft = {
				html = { "prettier" },
				css = { "prettier" },
				c = { "clang-format" },
				rust = { "rustfmt " },
			},
			format_on_save = { timeout_ms = 500, lsp_fallback = true },
			formatters = {
				["clang-format"] = {
					prepend_args = {
						"--style={ColumnLimit: 200, UseTab: Always, IndentWidth: 4, TabWidth: 4}" },
				},
				rustfmt = {
					cwd = require("conform.util").root_file({ "rustfmt.toml" }),
				},
			},
		})
	end
}
